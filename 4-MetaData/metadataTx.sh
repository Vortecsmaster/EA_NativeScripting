cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "d62193cea3ebbe5e2df57e10b5cb0e74de71de179c6210b05eeebae55d0af2dc#1" \
  --change-address $Adr01 \
  --metadata-json-file myData.json \
  --protocol-params-file protocol.params \
  --out-file metadataTx.unsigned

cardano-cli transaction sign \
  --tx-body-file metadataTx.unsigned \
  --signing-key-file ../Wallet/Adr01.skey \
  --testnet-magic 2 \
  --out-file metadataTx.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file metadataTx.signed