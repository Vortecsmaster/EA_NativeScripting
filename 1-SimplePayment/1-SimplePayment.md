# Simple Payment Transaction

## Walkthru 1-1 Build the transaction using `transaction build` 
    
##### Transaction build is a more automated form of constructing a transaction letting cardano-cli take care of fees calculations.



#### Lets create a transaction that:
- takes 1 inputs 
- creates 1 ouput with your second address and value, smaller than the input value.  
- define a change address to send the remaining tAda after output and fees.

#### Check for UTxOs on the address. 
#### Select the UTxO with 10,000 tADA from the faucet (or any with more than the output of the transaction).

export UTXOIN="7b4956b103d47908318ee92aa0790ff4b36fe7940991f0be350c9085fc4da175#0"

The utxo is identified as:  TXhash # index


#### Build the transacion

```bash
cardano-cli conway transaction build \
    --tx-in $UTXOIN \
    --tx-out "addr_test1qzqxpmyc9dscsuylvwpphm8qhesgr36v7yuq04fwfd9pprd5n6m772znh8lf4z2zawkzwnxl2zzduew5vgjeduv2nwksa20hl9 5000000000" \
    --change-address "addr_test1qqwumapqc9yghg69wvx5rae2s3jz3w5pfs4avw2x96h45pemvtjg092unvw09zgm2az4evmg0anv5xgytk26jxaz2lussnpysf" \
    --testnet-magic 2 \
    --out-file paymentTx.unsigned
```

#### Sign the transaction

```bash
cardano-cli conway transaction sign \
    $PREVIEW \
    --signing-key-file payment1.skey \
    --tx-body-file paymentTx.unsigned \
    --out-file paymentTx.signed
```

#### Submit the transaction

```bash
cardano-cli conway transaction submit $PREVIEW --tx-file paymentTx.signed
```
The transaction is submitted, if you wnat to know the transaction hash, just type out the command below:

    cardano-cli transaction txid --tx-file tx.signed
    
Check that the result is what you expect

```bash
cardano-cli query utxo --address $(cat payment2.addr) $PREVIEW
```
                               TxHash                                 TxIx        Amount
    --------------------------------------------------------------------------------------
    7d721d8a0cc2f3d87f44d4df22d6815f58fb67f421b283462ff3b823c36f34a6     1        5000000000 lovelace + TxOutDatumHashNone



## Actities

##### Assuming you got 2 addresses, AddressA, and AddressB
##### Create a AddressC with any wallet that can work on the Cardano preview testnet (Examples: Nami, Lace, Yoroi)
##### OR create another address with cardano-cli. 


##### 1.1.- Define a single transaction that send 1100 tADA to AddressB, send the change back to AddressA.

##### 1.2.- Define a single transaction that spend value from your AddressA and send five (5) 100tADA UTxOs to your AddressB, send the change back to AddressA.

##### 1.3.- Define a single transactino that spend value from  AddressB and send two(2) 100tADA UTxOs to your AddressA and three(3) 50tADA UTxOs to AddressC, send the change back to AddressA.

##### 1.4- Define a single transaction that takes 2 inputs from your AddressB with more than 150tADA and pay 150tADA to AddressC, send the change back to AddressB.

#### Final commets:
With the provided shellscripts, you can use them as templates for the excercises. Consider that it needs to be executable, so if you get an error, you can make it executable with the command 
```bash
chmod +x simple_payment.sh
```
