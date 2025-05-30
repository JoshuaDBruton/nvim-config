-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
      'lua_ls',
      'omnisharp',
      'cssls',
      'html',
      'eslint',
      'grammarly',
      'nginx_language_server',
      'pylsp',
      'ruff',
      'sqlls',
      'ts_ls',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', '<leader>g', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- So this is to run the language servers
require('lspconfig').omnisharp.setup({
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
})

local vue_typescript_plugin = '/home/joshua/.config/nvm/versions/node/v18.20.6'
  .. '/lib/node_modules'
  .. '/@vue/language-server/node_modules'
  .. '@vue/typescript-plugin'

require('lspconfig').ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_typescript_plugin,
        languages = {'javascript', 'typescript', 'vue'}
      },
    }
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
})

require('lspconfig').volar.setup({})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

vim.g.db_ui_use_nerd_fonts = 1

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sql", "mysql", "plsql"},
    callback = function()
        cmp.setup.buffer {
            sources = {
                { name = 'vim-dadbod-completion' }
            }
        }
    end,
})
