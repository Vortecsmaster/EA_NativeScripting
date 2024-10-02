# Multiple Witness Assembled Transaction

## Walkthru 3-1 Build the transaction multiple witness files
    



#### Lets create a transaction that:
- takes 2 inputs 
- creates 1 ouput with your third address and value, smaller than the input value.  
- define a change address to send the remaining tAda after output and fees.
- build the tx
- create witness file per each signatorie
- assemble all witness file 
- submit the assembled transaction.

#### Check for UTxOs on the address. 
#### Select the UTxO with 10,000 tADA from the faucet (or any with more than the output of the transaction).


#### Build the transaction.
```bash
cardano-cli conway transaction build \
  --testnet-magic 2 \
  --tx-in "57ed7fbb06a92cc90de265e16e2dc39cb5a15eb0abd12171aeba3b09da5b1f61#0" \
  --tx-in "b6c2c676d0960564db292329a109b385ecd436dd4cbb89090e9ffc2e0e15d7b8#1" \
  --tx-out $nami3+"130000000" \
  --change-address $nami3 \
  --out-file multiwitness.unsigned
```

#### Create Witness files

#### Assemble the Transaction and Witnesses


#### Submit the Transaction


two tx-in from user1, user2 and having one tx-out to user3 and change-address to user2 (for example)

### find out about the  "--witness-override" feature of the cardano-cli transaction build command

    
    
## Additional exercise: Work out how this feature could be used to conduct an ATOMIC swap 
  - Atomic swap meaning that the transaction either succeeds completely, OR FAILS completely
  - For now, assume the swap as below:
  - A has 250 Ada
  - B has 750 Ada
  - the swap tx should EXCHANGE THE two values between A and B
  - since we haven't yet studied native tokens, for now this is limited to swapping value.
  - Later on, we can actually exchange tokens using the same logic

## Actities



```bash
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
```