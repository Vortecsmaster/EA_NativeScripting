utxoin="0172071937c726836d15e477327e2a89376944941f34364a2222913a75fa6a6f#4"
policyid=$(cat monetary.pid)
address=$nami
output="22000000"
tokenname=$(echo -n "MrWo4nderfullCoin" | xxd -ps | tr -d '\n')
tokenammount="2200"
collateral="4cbf990857530696a12b0062546a4b123ad0bef21c67562e32d03e3288bdcd7b#0"
signerPKH="697a501b7d05766b3d08e39dab43e0f170973d3398b28745b3b8ce55"


cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $address+$output+"$tokenammount $policyid.$tokenname" \
  --change-address $Adr01 \
  --mint "$tokenammount $policyid.$tokenname" \
  --mint-script-file policy.script \
  --invalid-hereafter 26057313 \
  --protocol-params-file protocol.params \
  --out-file sminting.unsigned

cardano-cli transaction sign \
  --tx-body-file sminting.unsigned \
  --signing-key-file ../../Wallets/Adr01.skey \
  --signing-key-file ../../Wallets/Adr07.skey \
  --testnet-magic 2 \
  --out-file sminting.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file sminting.signed