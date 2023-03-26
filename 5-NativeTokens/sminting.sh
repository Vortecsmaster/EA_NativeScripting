utxoin="dcb20c46542b65c0eafe2a12e4589c27e7a5dc10d1a99cc7bb28fecfcc073de5#0"
policyid=$(cat policy.id)
address="addr_test1vqw66gv28k5m0rtsvf8q0mhqf53k4jnvkng8ynd2v5kqryqwt23dw"
output="11000000"
tokenname=$(echo -n "OurWonderfullToken" | xxd -ps | tr -d '\n')
tokenammount="1000"
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