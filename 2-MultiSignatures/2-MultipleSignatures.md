# Multisignature Transaction

## Walkthru 2-1 Build the transaction that uses multiple signers.
   
### Create a transaction that:
- takes 2 inputs, 1 from AddressA and 1 from AddressB 
- creates 1 ouput for AddressC and value, smaller than the total input value, and leave 2A for fees payment..  
- define a change address to send the remaining tAda after output and fees.
- sign the transaction with both AddressA and AddressB signing keys.

#### Check for UTxOs on the address. 
#### Select UTxOs with more total value than the output of the transaction, and 2tAda to cover fees.

export UTXOIN1="690813569f2cf691442fe0e9d1d5c158852f203041e4e69546c8ff2f0451a025#1"
export UTXOIN2="832cf06b2e388a4569bfce92b79c0a506b5f45df76ba3c4cc7e6e7bff6086770#13"


#### Build the transaction

```bash
cardano-cli conway transaction build \
    --tx-in $UTXOIN1 \
    --tx-in $UTXOIN2 \
    --tx-out "addr_test1qz8a9te33ln0675t9atgvxmamgcjgyfgzcttjq5482lhzgwkx0qw82lv9jasu7cl0nggv5ps58rgg6mvt0t89fdsr82srsfq3f 100000000" \
    --change-address "addr_test1qry9q4e2fldtyrh4yet4r68qr65ara0z0zldc9m24cm8zqaxra8dtqsrd3ddhrmz56tkrhzd6pga438tj03y9xv2glhqpghhc3" \
    --testnet-magic 2 \
    --out-file paymentTx.unsigned
```

#### Sign the transaction

```bash
cardano-cli conway transaction sign \
    $PREVIEW \
    --signing-key-file payment1.skey \
    --signing-key-file payment2.skey \
    --tx-body-file paymentTx.unsigned \
    --out-file paymentTx.signed
```

#### Submit the Transaction 

```bash
cardano-cli conway transaction submit $PREVIEW --tx-file paymentTx.signed
```
The transaction is submitted, if you wnat to know the transaction hash, just type out the command below:

    cardano-cli transaction txid --tx-file tx.signed
    
Check that the result is what you expect

```bash
cardano-cli query utxo --address addr_test1qz8a9te33ln0675t9atgvxmamgcjgyfgzcttjq5482lhzgwkx0qw82lv9jasu7cl0nggv5ps58rgg6mvt0t89fdsr82srsfq3f $PREVIEW
```
                               TxHash                                 TxIx        Amount
    --------------------------------------------------------------------------------------
    7d721d8a0cc2f3d87f44d4df22d6815f58fb67f421b283462ff3b823c36f34a6     1        5000000000 lovelace + TxOutDatumHashNone



## Actities

##### Assuming you got 2 addresses, AddressA, and AddressB
##### Create a AddressC with any wallet that can work on the Cardano preview testnet (Examples: Nami, Lace, Yoroi)
##### OR create another address with cardano-cli. 


##### 2.1. Define a single transaction that send 1100 tADA to AddressB, send the change back to AddressA.

##### 2.2. Define a single transaction that spend value from your AddressA and send five (5) 100tADA UTxOs to your AddressB, send the change back to AddressA.

##### 2.3. Define a single transactino that spend value from  AddressB and send two(2) 100tADA UTxOs to your AddressA and three(3) 50tADA UTxOs to AddressC, send the change back to AddressA.

##### 2.4. Define a single transaction that takes 2 inputs from your AddressB with more than 150tADA and pay 150tADA to AddressC, send the change back to AddressB.


#### Final commets:
With the provided shellscripts, you can use them as templates for the excercises. Consider that it needs to be executable, so if you get an error, you can make it executable with the command 
```bash
chmod +x simple_payment.sh
```
