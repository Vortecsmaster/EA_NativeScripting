cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "4b6bda5d37598571a89dc876885c5a973bb50e405a50a8545c6f65d395176739#2" \
  --change-address $nami \
  --metadata-json-file myData.json \
  --protocol-params-file protocol.params \
  --out-file metadataTx.unsigned

cardano-cli transaction sign \
  --tx-body-file metadataTx.unsigned \
  --signing-key-file ../../Wallets/Adr01.skey \
  --testnet-magic 2 \
  --out-file metadataTx.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file metadataTx.signed