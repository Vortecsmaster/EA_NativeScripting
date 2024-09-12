# Keys and Addresses - First steps using the Cardano blockchain 

## Part 1 Create a new set of keys and address 
Lets create an environment variable as shortcut, you can make it permanent including in the .bashrc file, and restarting terminal.
```bash
    export PREVIEW="--testnet-magic 2"
```

### Note: The Below steps will help you setup an address and fund it with testAda.
If not, execute the following steps to create the address and fund it with test ada.
```bash
    cardano-cli address key-gen \
    --verification-key-file payment1.vkey \
    --signing-key-file payment1.skey

    cardano-cli stake-address key-gen \
    --verification-key-file stake1.vkey \
    --signing-key-file stake1.skey

    cardano-cli address build \
    --payment-verification-key-file payment1.vkey \
    --stake-verification-key-file stake1.vkey \
    --out-file payment1.addr \
    $PREVIEW
```

 **Fund the payment address with 1000 Test Ada from the Faucet ([ADA Testnet Faucet](https://docs.cardano.org/cardano-testnet/tools/faucet/))**


Generate necessary keys for the second account
```bash
    cardano-cli address key-gen \
    --verification-key-file payment2.vkey \
    --signing-key-file payment2.skey

    cardano-cli stake-address key-gen \
    --verification-key-file stake2.vkey \
    --signing-key-file stake2.skey

    cardano-cli address build \
    --payment-verification-key-file payment2.vkey \
    --stake-verification-key-file stake2.vkey \
    --out-file payment2.addr \
    $PREVIEW
```

And check the UTxO for the payment address 
```bash    
    cardano-cli query utxo --address addr_test1vzl0uq5su8jt90vwx6zv8mvp9x7hf90pnylrhcnh3afyx4gcf747v --testnet-magic 2

                               TxHash                                 TxIx        Amount
    --------------------------------------------------------------------------------------
    7b4956b103d47908318ee92aa0790ff4b36fe7940991f0be350c9085fc4da175     1        100000000000 lovelace + TxOutDatumHashNone
```