#Creating keys and accounts (entrerprise and staking adresses)

#Create keys
echo "Creating keys"
mkdir -p ../wallets
cardano-cli address key-gen \
--verification-key-file ../wallets/enterprise.vkey \
--signing-key-file ../wallets/enterprise.skey

cardano-cli stake-address key-gen \
--verification-key-file ../wallets/staking.vkey \
--signing-key-file ../wallets/staking.skey

#Create addresses
echo "Creating addresses"
cardano-cli address build \
--payment-verification-key-file ../wallets/enterprise.vkey \
--stake-verification-key-file ../wallets/staking.vkey \
--out-file ../wallets/payment.addr \
--testnet-magic 2


