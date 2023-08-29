utxoin="558c3e159d48453297c2f1d9c522c2948cba540515a51a93db9e92a7a12c2b45#0"
policyid=$(cat NFTpolicy.id)
address="addr_test1qp65draw5za4msm4sqp9wtv4yejvehecceml20cc6waewrjfqx4dgsjqxh2gql7zjr2776l3thnxgtcvjg3cm8dad3lqn484e6"
output="22000000"
tokenname=$(echo -n "BobMecha" | xxd -ps | tr -d '\n')
tokenammount="1"
collateral="4cbf990857530696a12b0062546a4b123ad0bef21c67562e32d03e3288bdcd7b#0"
signerPKH="697a501b7d05766b3d08e39dab43e0f170973d3398b28745b3b8ce55"

#cardano-cli transaction policyid --script-file NFTpolicy.script > NFTpolicy.id

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
  --mint-script-file NFTpolicy.script \
  --invalid-before 13136667 \
  --metadata-json-file NFTmetadata.json \
  --protocol-params-file protocol.params \
  --out-file NFTminting.unsigned

cardano-cli transaction sign \
  --tx-body-file NFTminting.unsigned \
  --signing-key-file ../../Wallets/Adr01.skey \
  --signing-key-file ../../Wallets/Adr07.skey \
  --testnet-magic 2 \
  --out-file NFTminting.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file NFTminting.signed