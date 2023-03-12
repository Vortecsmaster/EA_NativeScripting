cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  - --testnet-magic 2 \
  --tx-in "79dd8b27a196647a9172c8033800674ab47eab49867390d123f80aa8d988f744#0" \
  --tx-in "c802db721de48a3f101b3d5fde4a58aecd442c62df3b2c327683f4d103ab4e02#0" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"200000000" \
  --tx-out "addr_test1qp65draw5za4msm4sqp9wtv4yejvehecceml20cc6waewrjfqx4dgsjqxh2gql7zjr2776l3thnxgtcvjg3cm8dad3lqn484e6"+"790000000" \
  --change-address "addr_test1qp65draw5za4msm4sqp9wtv4yejvehecceml20cc6waewrjfqx4dgsjqxh2gql7zjr2776l3thnxgtcvjg3cm8dad3lqn484e6" \
  --protocol-params-file protocol.params \
  --out-file multisig.unsigned

cardano-cli transaction sign \
    --tx-body-file multisig.unsigned \
    --signing-key-file ../Wallet/Adr01.skey \
    --signing-key-file ../Wallet/Adr07.skey \
     --testnet-magic 2 \
    --out-file multisig.signed

 cardano-cli transaction submit \
     --testnet-magic 2 \
    --tx-file multisig.signed