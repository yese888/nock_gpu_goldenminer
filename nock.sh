#!/bin/bash

apt install -y screen htop

#检查文件是否存在，否则下载
if [ ! -f /root/golden-miner-pool-prover ]; then
    wget -q https://github.com/GoldenMinerNetwork/golden-miner-nockchain-gpu-miner/releases/download/v0.1.5/golden-miner-pool-prover && \
    chmod +x /root/golden-miner-pool-prover
	echo start wget...
else
	echo no wget
fi

#检查程序是否已运行，没有才启动
if ! pgrep -f golden-miner-pool-prover > /dev/null; then
    screen -dmS nock /root/golden-miner-pool-prover \
    --pubkey=438KDxSKxfrCiQYsPqBcraxSuzLaTb93seWZ98p9JP1gSnvVD8jX8zSWMTr4yRPJMdxPfq49K4r1NePFFWhny6kUdJwXWTn1NPJx1Avdx5njeVfZqFXAcRTwLi8n18pLL3bd
	echo start screen...
else
	echo no screen
fi
