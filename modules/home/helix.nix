{
  inputs,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;

    extraPackages = with pkgs; [
      # Nix
      nixd
      nil
      alejandra

      # Lua
      lua-language-server
      stylua

      # HTML/CSS
      vscode-langservers-extracted
    ];

    settings = {
      theme = "catppuccin_mocha";
    };

    languages = {
      language-server.nixd = {
        command = "nixd";
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = ["nixd" "nil"];
          formatter = {command = "alejandra";};
        }
      ];
    };
  };
}
