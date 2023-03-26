utxoin="a5a35965dff312e47fe860eae4cc2a28d8307cdbe4c53b4092c009ad623c7ed1#0"
policyid=$(cat NFTpolicy.id)
address="addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"
output="11000000"
tokenname=$(echo -n "Batch81nft_Mech" | xxd -ps | tr -d '\n')
tokenammount="1"
collateral="4cbf990857530696a12b0062546a4b123ad0bef21c67562e32d03e3288bdcd7b#0"
signerPKH="697a501b7d05766b3d08e39dab43e0f170973d3398b28745b3b8ce55"

#cardano-cli address key-hash --payment-verification-key-file ../Wallet/Adr01.vkey --out-file Adr01.pkh
#cardano-cli address key-hash --payment-verification-key-file ../Wallet/Adr07.vkey --out-file Adr07.pkh
cardano-cli transaction policyid --script-file NFTpolicy.script > NFTpolicy.id

cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $nami+$output+"$tokenammount $policyid.$tokenname" \
  --change-address $Adr01 \
  --mint "$tokenammount $policyid.$tokenname" \
  --mint-script-file NFTpolicy.script \
  --invalid-before 13136667 \
  --metadata-json-file NFTmetadata.json \
  --protocol-params-file protocol.params \
  --out-file NFTminting.unsigned

cardano-cli transaction sign \
  --tx-body-file NFTminting.unsigned \
  --signing-key-file ../Wallet/Adr01.skey \
  --signing-key-file ../Wallet/Adr07.skey \
  --testnet-magic 2 \
  --out-file NFTminting.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file NFTminting.signed