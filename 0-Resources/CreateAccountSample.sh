#Creating keys and accounts (entrerprise and staking adresses)

#Create keys
echo "Creating keys"
mkdir -p ../wallets
cardano-cli address key-gen \
--verification-key-file ../wallets/payment1.vkey \
--signing-key-file ../wallets/payment1.skey

cardano-cli stake-address key-gen \
--verification-key-file ../wallets/staking1.vkey \
--signing-key-file ../wallets/staking1.skey

cardano-cli address key-gen \
--verification-key-file ../wallets/payment2.vkey \
--signing-key-file ../wallets/payment2.skey

cardano-cli stake-address key-gen \
--verification-key-file ../wallets/staking2.vkey \
--signing-key-file ../wallets/staking2.skey

#Create addresses
echo "Creating addresses"
cardano-cli address build \
--payment-verification-key-file ../wallets/payment1.vkey \
--stake-verification-key-file ../wallets/staking1.vkey \
--out-file ../wallets/payment1.addr \
$PREVIEW

cardano-cli address build \
--payment-verification-key-file ../wallets/payment2.vkey \
--stake-verification-key-file ../wallets/staking2.vkey \
--out-file ../wallets/payment2.addr \
$PREVIEW
