
# In cardano node repo

git fetch --all --recurse-submodules --tags

git checkout $(curl -s https://api.github.com/repos/input-output-hk/cardano-node/releases/latest | jq -r .tag_name)

cabal configure –with-compiler=ghc-8.10.7

cabal clean && cabal update

cabal build cardano-node cardano-cli

cp -p "$(./scripts/bin-path.sh cardano-node)" $HOME/.local/bin/
cp -p "$(./scripts/bin-path.sh cardano-cli)" $HOME/.local/bin/
