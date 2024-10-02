cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "0c5d9a4022651487f0bf812dbef4eb21017e9463228709c0ef29c91ed13960d4#0" \
  --tx-in "b6412bf29aaf8fdb40265767426a66496df8782964d2f5412a74f5c188586532#0" \
  --tx-out $nami+"200000000" \
  --change-address $nami \
  --protocol-params-file protocol.params \
  --out-file multisig.unsigned

cardano-cli transaction sign \
    --tx-body-file multisig.unsigned \
    --signing-key-file ../../Wallets/Adr01.skey \
    --signing-key-file ../../Wallets/Adr02.skey \
    --testnet-magic 2 \
    --out-file multisig.signed

 cardano-cli transaction submit \
    --testnet-magic 2 \
    --tx-file multisig.signed
