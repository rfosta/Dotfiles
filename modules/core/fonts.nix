{
  inputs,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-color-emoji
    (nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka"];})
    font-awesome
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = ["SFProDisplay Nerd Font"];
      sansSerif = ["SFProDisplay Nerd Font"];
      monospace = ["SFProDisplay Nerd Font"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
