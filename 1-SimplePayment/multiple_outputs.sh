#Use some variables to  organize the script

# Define the variables
utxoin="871ec8740cac1b846fd05ca890c857c202a2cbd0cb1714db4af1407940218aef#0"
address=$(cat  ../wallets/payment2.addr)
output_value=110000000
change_address=$(cat  ../wallets/payment1.addr)

# --tx-out $address+$output_value \

cardano-cli conway transaction build \
  $PREVIEW \
  --tx-in $utxoin \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 5500000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 4400000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 3300000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 2200000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 1100000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 990000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 880000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 770000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 660000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 550000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 440000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 330000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 220000000" \
  --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 110000000" \
  --change-address $nami3 \
  --out-file multiple_outputs.unsigned

##$(cat ../wallets/payment1.addr) \
  
cardano-cli conway transaction sign \
  --tx-body-file simple_payment.unsigned \
  --signing-key-file $HOME/Dev/Wallets/Adr02.skey \
  $PREVIEW \
  --out-file multiple_outputst.signed

cardano-cli conway transaction submit \
  $PREVIEW \
  --tx-file multiple_outputs.signed