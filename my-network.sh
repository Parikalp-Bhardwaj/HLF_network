echo "Generating crypto-config"
../bin/cryptogen generate --config=./crypto-config.yaml


sleep 3
echo "Generate System Genesis Block"
../bin/configtxgen -profile TwoOrgsOrdererGenesis -configPath . -channelID mychannel -outputBlock ./channel-artifacts/genesis.block


sleep 2
echo "Generating channel configuration block"
../bin/configtxgen -profile TwoOrgsChannel -configPath . -outputCreateChannelTx ./channel-artifacts/mychannel.tx -channelID mychannel


sleep 2
echo "Generating Anchor peer update for Org1"
../bin/configtxgen -profile TwoOrgsChannel -configPath . -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP


sleep 2

echo "Generating Anchor peer update for Org2"
../bin/configtxgen -profile TwoOrgsChannel -configPath . -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID mychannel -asOrg Org2MSP

