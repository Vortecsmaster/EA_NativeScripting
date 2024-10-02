#Use some variables to  organize the script

# Define the variables
utxoin="871ec8740cac1b846fd05ca890c857c202a2cbd0cb1714db4af1407940218aef#0"
address=$(cat  ../wallets/payment2.addr)
output_value=100000000
change_address=$(cat  ../wallets/payment1.addr)
nami="addr_test1qry9q4e2fldtyrh4yet4r68qr65ara0z0zldc9m24cm8zqaxra8dtqsrd3ddhrmz56tkrhzd6pga438tj03y9xv2glhqpghhc3"

# --tx-out $address+$output_value \

cardano-cli conway transaction build \
  $PREVIEW \
  --tx-in $utxoin \
  --tx-out $address+$output_value \
  --tx-out $address+$output_value \
  --tx-out $address+$output_value \
  --tx-out $address+$output_value \
  --tx-out $address+$output_value \
  --change-address $nami \
  --out-file multiple_outputs.unsigned

##$(cat ../wallets/payment1.addr) \
  
cardano-cli conway transaction sign \
  --tx-body-file multiple_outputs.unsigned \
  --signing-key-file $(cat ../wallets/payment2.skey) \
  $PREVIEW \
  --out-file multiple_outputs.signed

cardano-cli conway transaction submit \
  $PREVIEW \
  --tx-file multiple_outputs.signed