utxoin="4236a03675ba16d6b3bb3ce051b497a692e7e84b5a6d8c242071ff401451bf34#0"
policyid=$(cat policy.id)
address="addr_test1vqw66gv28k5m0rtsvf8q0mhqf53k4jnvkng8ynd2v5kqryqwt23dw"
output="2000000"
tokenname=$(echo -n "OurWonderfullToken" | xxd -ps | tr -d '\n')
tokenammount="-100"
collateral="4cbf990857530696a12b0062546a4b123ad0bef21c67562e32d03e3288bdcd7b#0"
signerPKH="697a501b7d05766b3d08e39dab43e0f170973d3398b28745b3b8ce55"


cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $nami+$output+"900 $policyid.$tokenname" \
  --change-address $nami \
  --mint "$tokenammount $policyid.$tokenname" \
  --mint-script-file policy.script \
  --invalid-before 12537288 \
  --protocol-params-file protocol.params \
  --out-file sminting.unsigned

cardano-cli transaction sign \
  --tx-body-file sminting.unsigned \
  --signing-key-file ../Wallet/Adr01.skey \
  --signing-key-file ../Wallet/Adr07.skey \
  --testnet-magic 2 \
  --out-file sminting.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file sminting.signed