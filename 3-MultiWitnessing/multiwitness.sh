cardano-cli conway transaction build \
  --testnet-magic 2 \
  --tx-in "57ed7fbb06a92cc90de265e16e2dc39cb5a15eb0abd12171aeba3b09da5b1f61#0" \
  --tx-in "b6c2c676d0960564db292329a109b385ecd436dd4cbb89090e9ffc2e0e15d7b8#1" \
  --tx-out $nami3+"130000000" \
  --change-address $nami3 \
  --out-file multiwitness.unsigned

cardano-cli conway transaction witness \
  --tx-body-file multiwitness.unsigned \
  --signing-key-file  $HOME/Dev/Wallets/Adr01.skey \
  --testnet-magic 2 \
  --out-file Adr01.witness

cardano-cli conway transaction witness \
  --tx-body-file multiwitness.unsigned \
  --signing-key-file  $HOME/Dev/Wallets/Adr02.skey \
  --testnet-magic 2 \
  --out-file Adr02.witness

cardano-cli conway transaction assemble \
  --tx-body-file multiwitness.unsigned \
  --witness-file Adr01.witness \
  --witness-file Adr02.witness \
  --out-file multiwitness.assembled 

cardano-cli transaction submit \
  --tx-file multiwitness.assembled \
  --testnet-magic 2