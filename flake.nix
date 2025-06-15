{
  description = "Jekyll development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Ruby and Jekyll
            ruby_3_2
            bundler
            jekyll
            
            # System dependencies that Jekyll gems often need
            gcc
            gnumake
            pkg-config
            
            # For native gem compilation
            zlib
            zlib.dev
            openssl
            openssl.dev
            libffi
            libffi.dev
            
            # Git for version control
            git
            
            # Optional: Node.js for any frontend tooling
            nodejs
            
            # Optional: Python for any build scripts
            python3
          ];

          # Environment variables
          shellHook = ''
            echo "🚀 Jekyll development environment loaded!"
            echo ""
            echo "Available commands:"
            echo "  jekyll new my-site    # Create a new Jekyll site"
            echo "  jekyll serve          # Serve site locally"
            echo "  jekyll build          # Build site"
            echo "  bundle install        # Install gems from Gemfile"
            echo "  bundle exec jekyll serve # Run Jekyll through Bundler"
            echo ""
            echo "Ruby version: $(ruby --version)"
            echo "Jekyll version: $(jekyll --version)"
            
            # Set up local gem installation directory
            export GEM_HOME="$PWD/.gems"
            export PATH="$GEM_HOME/bin:$PATH"
            
            # Ensure bundle installs gems locally
            export BUNDLE_PATH="$PWD/.bundle"
          '';

          # Ruby environment
          RUBY_VERSION = "3.2.0";
        };
      }
    );
}
