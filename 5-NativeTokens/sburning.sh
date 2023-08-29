utxoin="ad1b44f2bc301a1aa0affba68af7c5a011f6a51cf325c055218365c4e339f535#0"
policyid=$(cat monetary.pid)
address=$nami
output="5000000"
tokenname=$(echo -n "MrWonderfullCoin" | xxd -ps | tr -d '\n')
tokenammount="-1650"
collateral="4cbf990857530696a12b0062546a4b123ad0bef21c67562e32d03e3288bdcd7b#0"
signerPKH="697a501b7d05766b3d08e39dab43e0f170973d3398b28745b3b8ce55"


cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $Adr01+$output \
  --change-address $nami \
  --mint "$tokenammount $policyid.$tokenname" \
  --mint-script-file policy.script \
  --invalid-before 26057313 \
  --protocol-params-file protocol.params \
  --out-file sburning.unsigned

cardano-cli transaction sign \
  --tx-body-file sburning.unsigned \
  --signing-key-file ../../Wallets/Adr01.skey \
  --signing-key-file ../../Wallets/Adr07.skey \
  --testnet-magic 2 \
  --out-file sburning.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file sburning.signed