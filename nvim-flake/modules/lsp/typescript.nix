{ pkgs, ... }:

/* lua */ ''
lspconfig.tsserver.setup{
  capabilities = capabilities;
  on_attach = function(client, bufnr)
    attach_keymaps(client, bufnr)
  end,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "svelte.typescript", "svelte" },
  cmd = { "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server", "--stdio" },
  handlers = handlers
}

lspconfig.svelte.setup{
  capabilities = capabilities;
  on_attach = function(client, bufnr)
    attach_keymaps(client, bufnr)
  end,
  cmd = { "${pkgs.nodePackages.svelte-language-server}/bin/svelteserver", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "svelte.typescript", "svelte" },
  handlers = handlers,

  vim.filetype.add({ extension = { ['svelte.ts'] = 'svelte.typescript' } })
}
''
