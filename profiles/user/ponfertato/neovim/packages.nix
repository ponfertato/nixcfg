{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bash-language-server
    dockerfile-language-server
    fd
    gcc
    lua-language-server
    nerd-fonts.fira-code
    nil
    nixfmt
    ripgrep
    shfmt
    stylua
    tree-sitter
    yaml-language-server
    # unstable.lazydocker
    # unstable.lazygit
  ];

  programs.neovim.configure.packages.ponfertato = with pkgs.vimPlugins; {
    start = [
      bufferline-nvim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      comment-nvim
      gitsigns-nvim
      lazydocker-nvim
      lazygit-nvim
      lualine-nvim
      luasnip
      nui-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      plenary-nvim
      telescope-nvim
      which-key-nvim
    ];
    opt = [ ];
  };
}
