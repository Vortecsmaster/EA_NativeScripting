utxoin="3802bf9267dfd4a9fe4f6ac77cd20863497d215fa7d1e204bbdeb547d2f17fe7#1"
address=$(cat AS.addr) 
output="400000000"


cardano-cli transaction build \
  --babbage-era \
  $PREVIEW \
  --tx-in "79dd8b27a196647a9172c8033800674ab47eab49867390d123f80aa8d988f744#0" \
  --tx-in "c802db721de48a3f101b3d5fde4a58aecd442c62df3b2c327683f4d103ab4e02#0" \
  --tx-out $nami+"200000000" \
  --tx-out "addr_test1qp65draw5za4msm4sqp9wtv4yejvehecceml20cc6waewrjfqx4dgsjqxh2gql7zjr2776l3thnxgtcvjg3cm8dad3lqn484e6"+"790000000" \
  --change-address "addr_test1qp65draw5za4msm4sqp9wtv4yejvehecceml20cc6waewrjfqx4dgsjqxh2gql7zjr2776l3thnxgtcvjg3cm8dad3lqn484e6" \
  --protocol-params-file protocol.params \
  --out-file give.unsigned

cardano-cli transaction sign \
    --tx-body-file give.unsigned \
    --signing-key-file Wallet/Adr01.skey \
    --signing-key-file Wallet/Adr07.skey \
    $PREVIEW \
    --out-file give.signed

 cardano-cli transaction submit \
    $PREVIEW \
    --tx-file give.signed