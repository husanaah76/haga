#!/bin/bash

# Define your RPC URL
RPC_URL="https://mainnet.helius-rpc.com/?api-key=c2c2d31f-38d2-46f8-9f05-096cfc25f8ab"

while true; do
    # Claim rewards
    ore --keypair ~/.config/solana/id.json --rpc "$RPC_URL" claim
    # Add a delay of 10 seconds
    sleep 10
done
