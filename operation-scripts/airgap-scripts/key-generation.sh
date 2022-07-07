mkdir $HOME/cold-keys

mkdir $HOME/keys

cardano-cli node key-gen \
    --cold-verification-key-file $HOME/cold-keys/node.vkey \
    --cold-signing-key-file $HOME/cold-keys/node.skey \
    --operational-certificate-issue-counter $HOME/cold-keys/node.counter

cardano-cli address key-gen \
    --verification-key-file $HOME/keys/payment.vkey \
    --signing-key-file $HOME/keys/payment.skey

cardano-cli stake-address key-gen \
    --verification-key-file $HOME/keys/stake.vkey \
    --signing-key-file $HOME/keys/stake.skey

cardano-cli stake-address build \
    --stake-verification-key-file $HOME/keys/stake.vkey \
    --out-file $HOME/keys/stake.addr \
    --mainnet

cardano-cli address build \
    --payment-verification-key-file $HOME/keys/payment.vkey \
    --stake-verification-key-file $HOME/keys/stake.vkey \
    --out-file $HOME/keys/payment.addr \
    --mainnet
