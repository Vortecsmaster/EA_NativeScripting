#Use some variables to  organize the script

# Define the variables
utxoin="78a1e9cc56066af82f373b78b7fd2d4d9b7e513c439afa6c626ca35507db3c8a#1"
address=$(cat  ../wallets/payment2.addr)
output_value=110000000
change_address=$(cat $(cat  ../wallets/payment1.addr))


cardano-cli conway transaction build \
  $PREVIEW \
  --tx-in $utxoin \
  --tx-out $address+$output_value \
  --change-address $change_address \
  --out-file simple_payment.unsigned

cardano-cli conway transaction sign \
  --tx-body-file simple_payment.unsigned \
  --signing-key-file $(cat ../wallets/payment1.addr) \
  $PREVIEW \
  --out-file simple_payment.signed

cardano-cli conway transaction submit \
  $PREVIEW \
  --tx-file simple_payment.signed