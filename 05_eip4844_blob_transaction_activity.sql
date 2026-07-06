SELECT
  date_trunc('day', block_time) AS day,
    COUNT(*) FILTER (WHERE type = '3') AS blob_tx_count,
      SUM(CASE WHEN type = '3' THEN gas_used ELSE 0 END) AS gas_used_by_blob_txs
      FROM ethereum.transactions
      WHERE block_time > now() - interval '90' day
      GROUP BY 1
      ORDER BY 1
