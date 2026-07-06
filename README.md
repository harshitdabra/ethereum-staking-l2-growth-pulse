# Ethereum Staking & L2 Growth Pulse

Dune Analytics queries tracking Ethereum staking deposits on the Beacon Chain, liquid staking token transfer activity, Layer 2 bridge deposit volume, and EIP-4844 blob transaction activity.

Live dashboard: https://dune.com/harshit_dabra/ethereum-staking-and-l2-growth-pulse

## Queries

`01_eth_staking_deposits_beacon_chain.sql` tracks daily ETH staking deposits to the Beacon Deposit Contract: deposit count and total ETH deposited over the last 90 days.

`02_lst_transfer_activity.sql` tracks daily transfer activity for the top 3 liquid staking tokens: stETH, rETH, and cbETH.

`03_l2_bridge_deposit_volume.sql` tracks daily ETH bridged to major L2 rollups: Arbitrum, Optimism, and Base, via their native bridge contracts.

`04_cumulative_eth_staked_growth.sql` tracks cumulative ETH staked growth over the last 90 days.

`05_eip4844_blob_transaction_activity.sql` tracks daily blob transaction count and blob gas usage on Ethereum L1, the data availability layer for L2 rollups.

## Notes

Built with DuneSQL against `ethereum.transactions` and `ethereum.blocks`. This dashboard is for informational and educational purposes only and is not financial advice.

## About

Built by Harshit Dabra.
