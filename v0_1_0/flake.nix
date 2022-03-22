{
  description = ''A URL shortener cli app. using bit.ly'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-urlshortener-v0_1_0.flake = false;
  inputs.src-urlshortener-v0_1_0.owner = "jabbalaci";
  inputs.src-urlshortener-v0_1_0.ref   = "v0_1_0";
  inputs.src-urlshortener-v0_1_0.repo  = "UrlShortener";
  inputs.src-urlshortener-v0_1_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-urlshortener-v0_1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-urlshortener-v0_1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}