{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: 

  
  let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in
  {
    devShells = forEachSupportedSystem ({ pkgs }: {
      default = pkgs.mkShell {
        shellHook = ''
          export GIT_AUTHOR_EMAIL='able.port-0c@icloud.com'
          export GIT_AUTHOR_NAME='00010023'
        '';
      };
    });
  };
}
