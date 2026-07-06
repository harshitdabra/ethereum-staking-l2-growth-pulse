WITH daily AS (
  SELECT
      date_trunc('day', block_time) AS day,
          SUM(CAST(value AS DOUBLE) / 1e18) AS eth_deposited
            FROM ethereum.transactions
              WHERE "to" = 0x00000000219ab540356cBB839Cbe05303d7705Fa
                  AND block_time >= date_add('day', -90, now())
                      AND success = true
                        GROUP BY 1
                        )
                        SELECT
                          day,
                            eth_deposited,
                              SUM(eth_deposited) OVER (ORDER BY day) AS cumulative_eth_staked
                              FROM daily
                              ORDER BY day
