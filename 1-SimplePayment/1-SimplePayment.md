# Simple Payment Transaction

## Build the transaction using `transaction build` (recommended)
    
### Transaction build is a more automated form of constructing a transaction letting cardano-cli take care of fees calculations.


#### Check for UTxOs on the address. 
#### Select UTxO with 10,000 tADA (or any with more than the output of the transaction)

```bash
UTXO1=7b4956b103d47908318ee92aa0790ff4b36fe7940991f0be350c9085fc4da175#0

cardano-cli transaction build \
    --babbage-era \
    --tx-in $UTXO1 \
    --tx-out $(cat ../wallets/payment2.addr)+5000000000 \
    --change-address $(cat payment1.addr) \
    $PREVIEW \
    --out-file paymentTx.unsigned
```

#### Sign the transaction

```bash
cardano-cli transaction sign \
    $PREVIEW \
    --signing-key-file payment1.skey \
    --tx-body-file paymentTx.unsigned \
    --out-file paymentTx.signed
```

And submit it to the Preview Testnet
```bash
cardano-cli transaction submit $PREVIEW --tx-file paymentTx.signed
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


## HandsOn

### 1- Send 1100 tADA to Roberto's wallet addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt

### 2- Send five (5) 100tADA UTxOs to your second address (payment2 in the sample).

### 3- Send two(2) 100tADA UTxOs to your address and three(3) 50tADA UTxOs to Roberto's wallet.
