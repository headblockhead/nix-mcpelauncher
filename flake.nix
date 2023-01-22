{
  description = "A nix flake to run Minecraft Bedrock on Nix/NixOS";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs"; };

  outputs = { self, nixpkgs }: 
  with import nixpkgs { system = "x86_64-linux"; };
  let 
    app = appimageTools.wrapType2 {
      name = "mcpelauncher";
    src = pkgs.fetchurl {
      url = "https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.8.0-700/Minecraft_Bedrock_Launcher-x86_64-v0.8.0.700.AppImage";
      sha256 = "KX4w9zrbTwJxp+fVB/eImlN+qu+svgmN70teNAkBQeU=";
    };
    extraPkgs = pkgs: with pkgs; [ ];
  };
  in
  {
    defaultPackage.x86_64-linux = app;
  };
}
