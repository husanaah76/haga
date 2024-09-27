#!/bin/bash

#add your solana rpc endpoint
DEFAULT_RPC_URL="https://mainnet.helius-rpc.com/?api-key=c2c2d31f-38d2-46f8-9f05-096cfc25f8ab"
#add your solana pubkey path
DEFAULT_KEY="[75,79,149,190,136,242,157,156,107,239,41,3,59,252,73,178,132,164,173,53,146,236,96,72,29,229,31,141,137,49,202,101,115,34,94,195,134,50,38,97,204,164,6,25,9,111,190,226,220,206,161,57,223,208,86,140,209,153,241,50,148,98,161,223]"
#define solana gas fee
DEFAULT_FEE=1000
#define how many cpu threads used
DEFAULT_THREADS=90

RPC_URL=${1:-$DEFAULT_RPC_URL}
KEY=${2:-$DEFAULT_KEY}
FEE=${3:-$DEFAULT_FEE}
THREADS=${4:-$DEFAULT_THREADS}

COMMAND="ore --rpc ${RPC_URL} --keypair ${KEY} --priority-fee ${FEE} mine --cores ${THREADS}"

while true; do
  echo "Starting the process..."
  eval $COMMAND
  [ $? -eq 0 ] && break
  echo "Restart in 5 seconds..."
  sleep 5
done
