{ pkgs, ... }:

/* lua */ ''
lspconfig.tsserver.setup{
  capabilities = capabilities;
  on_attach = function(client, bufnr)
    attach_keymaps(client, bufnr)
  end,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server", "--stdio" },
  handlers = handlers,
  single_file_support = false
}

lspconfig.svelte.setup{
  capabilities = capabilities;
  on_attach = function(client, bufnr)
    attach_keymaps(client, bufnr)
  end,
  cmd = { "${pkgs.nodePackages.svelte-language-server}/bin/svelteserver", "--stdio" },
  filetypes = { "svelte" },
  handlers = handlers,
  root_dir = require('lspconfig.util').root_pattern('package.json', 'svelte.config.js', '.git'),
  settings = {
    svelte = {
      plugin = {
        svelte = {
          enable = true,
          diagnostics = { enable = true },
          codeLens = { enable = true },
          defaultScriptLanguage = "typescript"
        }
      }
    }
  }
}
''
