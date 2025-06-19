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
''
