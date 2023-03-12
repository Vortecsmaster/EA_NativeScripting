cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "d53a91823de2b21adfe904711dd8807a7cc8dd8ff7fd2695bf845f6c6f0f5a0d#0" \
  --tx-in "883c78a718b787a67825a3ed721b7943ad611d3379ffdb2749cc9ebfc8f31c22#0" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"200000000" \
  --change-address "addr_test1qp65draw5za4msm4sqp9wtv4yejvehecceml20cc6waewrjfqx4dgsjqxh2gql7zjr2776l3thnxgtcvjg3cm8dad3lqn484e6" \
  --protocol-params-file protocol.params \
  --out-file paymw.unsigned

cardano-cli transaction witness \
  --tx-body-file paymw.unsigned \
  --signing-key-file  ../Wallet/Adr01.skey \
   --testnet-magic 2 \
  --out-file Adr01.witness

cardano-cli transaction witness \
  --tx-body-file paymw.unsigned \
  --signing-key-file  ../Wallet/Adr07.skey \
   --testnet-magic 2 \
  --out-file Adr07.witness

 cardano-cli transaction assemble \
   --tx-body-file paymw.unsigned \
   --witness-file Adr01.witness \
   --witness-file Adr07.witness \
   --out-file paymw.assembled 

cardano-cli transaction submit \
    --tx-file paymw.assembled \
     --testnet-magic 2
