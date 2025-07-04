FROM n8nio/n8n:1.101.0

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nodejs npm \
    python3 python3-pip \
    solc \
    curl \
    golang-go \
    git build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g truffle
RUN npm install -g hardhat
RUN npm install -g ganache-cli
RUN npm install web3 ethers
RUN pip3 install eth-brownie
RUN npm install -g mocha chai

RUN curl -fsSL https://dist.ipfs.io/go-ipfs/v0.16.0/go-ipfs_v0.16.0_linux-amd64.tar.gz | tar -xz -C /usr/local/bin --strip-components=1 && \
    rm -rf go-ipfs

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    $HOME/.cargo/bin/rustc --version && \
    rm -rf /root/.cargo/registry /root/.cargo/git

USER node

WORKDIR /data

EXPOSE 5678

CMD ["n8n", "start"]
