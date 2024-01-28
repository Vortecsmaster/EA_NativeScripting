cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "6aad99ae015f657fa09430d25665b6ddbd757f02335a8b95f1d6d3df7467651d#0" \
  --tx-out "addr_test1qqhe2k79d0aexj0mx25gl4ku04mqmygl8ecs9nekmn0wqykjn5caavpcfrhen8wkj0c6vaz0n9a7xcp4s3g3sfqc0spseknmvw 5000000000" \
  --change-address $nami \
  --protocol-params-file protocol.params \
  --out-file payment.unsigned

cardano-cli transaction sign \
  --tx-body-file payment.unsigned \
  --signing-key-file ../wallets/batch107.skey \
  --testnet-magic 2 \
  --out-file payment.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file payment.signed