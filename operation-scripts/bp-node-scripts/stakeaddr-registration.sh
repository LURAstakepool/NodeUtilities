
sudo sh find-tipandutxo.sh

stakeAddressDeposit=$(cat $NODE_HOME/params.json | jq -r '.stakeAddressDeposit')
echo stakeAddressDeposit : $stakeAddressDeposit

cardano-cli transaction build-raw \
    ${tx_in} \
    --tx-out $(cat $NODE_HOME/keys/payment.addr)+0 \
    --invalid-hereafter $(( ${currentSlot} + 10000)) \
    --fee 0 \
    --out-file tx.tmp \
    --certificate $NODE_HOME/keys/stake.cert

fee=$(cardano-cli transaction calculate-min-fee \
    --tx-body-file tx.tmp \
    --tx-in-count ${txcnt} \
    --tx-out-count 1 \
    --mainnet \
    --witness-count 2 \
    --byron-witness-count 0 \
    --protocol-params-file $NODE_HOME/params.json | awk '{ print $1 }')
echo fee: $fee

txOut=$((${total_balance}-${stakeAddressDeposit}-${fee}))
echo Change Output: ${txOut}

cardano-cli transaction build-raw \
    ${tx_in} \
    --tx-out $(cat $NODE_HOME/keys/payment.addr)+${txOut} \
    --invalid-hereafter $(( ${currentSlot} + 10000)) \
    --fee ${fee} \
    --certificate-file $NODE_HOME/keys/stake.cert \
    --out-file tx.raw
