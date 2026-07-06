SELECT
  date_trunc('day', block_time) AS day,
    COUNT(*) FILTER (WHERE "to" = 0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a) AS arbitrum_tx_count,
      SUM(CASE WHEN "to" = 0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a THEN CAST(value AS DOUBLE) / 1e18 ELSE 0 END) AS arbitrum_eth_bridged,
        COUNT(*) FILTER (WHERE "to" = 0x99C9fc46f92E8a1c0deC1b1747d010903E884bE1) AS optimism_tx_count,
          SUM(CASE WHEN "to" = 0x99C9fc46f92E8a1c0deC1b1747d010903E884bE1 THEN CAST(value AS DOUBLE) / 1e18 ELSE 0 END) AS optimism_eth_bridged,
            COUNT(*) FILTER (WHERE "to" = 0x49048044D57e1C92A77f79988d21Fa8fAF74E97e) AS base_tx_count,
              SUM(CASE WHEN "to" = 0x49048044D57e1C92A77f79988d21Fa8fAF74E97e THEN CAST(value AS DOUBLE) / 1e18 ELSE 0 END) AS base_eth_bridged
              FROM ethereum.transactions
              WHERE "to" IN (0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a, 0x99C9fc46f92E8a1c0deC1b1747d010903E884bE1, 0x49048044D57e1C92A77f79988d21Fa8fAF74E97e)
                AND block_time >= date_add('day', -90, now())
                  AND success = true
                  GROUP BY 1
                  ORDER BY 1
