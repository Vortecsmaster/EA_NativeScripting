cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "1575cc7a144f4f3615f25e9aa232b50e6a034dad20762ded02157ba347bb35dd#0" \
  --tx-in "1c5a5b0699164c554b17acf2ad7c6a690c9afed9c6f32a165764215be0a25d3b#0" \
  --tx-out $nami+"400000000" \
  --change-address $Adr02 \
  --protocol-params-file protocol.params \
  --out-file paymw.unsigned

cardano-cli transaction witness \
  --tx-body-file paymw.unsigned \
  --signing-key-file  ../../Wallets/Adr01.skey \
  --testnet-magic 2 \
  --out-file Adr01.witness

cardano-cli transaction witness \
  --tx-body-file paymw.unsigned \
  --signing-key-file  ../../Wallets/Adr02.skey \
  --testnet-magic 2 \
  --out-file Adr02.witness

cardano-cli transaction assemble \
  --tx-body-file paymw.unsigned \
  --witness-file Adr01.witness \
  --witness-file Adr02.witness \
  --out-file paymw.assembled 

cardano-cli transaction submit \
  --tx-file paymw.assembled \
  --testnet-magic 2