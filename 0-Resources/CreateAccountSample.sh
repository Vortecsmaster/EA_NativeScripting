#Creating keys and accounts (entrerprise and staking adresses)

#Create keys
echo "Creating keys"
mkdir -p 0-Resources/keys
cardano-cli address key-gen \
--verification-key-file 0-Resources/keys/enterprise.vkey \
--signing-key-file 0-Resources/keys/enterprise.skey

cardano-cli address key-gen \
--verification-key-file 0-Resources/keys/staking.vkey \
--signing-key-file 0-Resources/keys/staking.skey

#Create addresses
echo "Creating addresses"
cardano-cli address build \
--payment-verification-key-file 0-Resources/keys/enterprise.vkey \
--stake-verification-key-file 0-Resources/keys/staking.vkey \
--out-file 0-Resources/keys/payment.addr \
--testnet-magic 2


