{ pkgs, ... }:

/* lua */ ''
lspconfig.hls.setup{
  capabilities = capabilities;
  on_attach = function(client, bufnr)
    attach_keymaps(client, bufnr)
  end,
  cmd = { "${pkgs.haskellPackages.haskell-language-server}/bin/haskell-language-server-wrapper", "--lsp" },
  handlers = handlers,
}
''
