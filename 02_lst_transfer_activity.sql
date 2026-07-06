SELECT
  date_trunc('day', block_time) AS day,
    SUM(CASE WHEN contract_address = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84 THEN CAST(amount AS DOUBLE) ELSE 0 END) AS stETH_transferred,
      SUM(CASE WHEN contract_address = 0xae78736Cd615f374D3085123A210448E74Fc6393 THEN CAST(amount AS DOUBLE) ELSE 0 END) AS rETH_transferred,
        SUM(CASE WHEN contract_address = 0xBe9895146f7AF43049ca1c1AE358B0541Ea49704 THEN CAST(amount AS DOUBLE) ELSE 0 END) AS cbETH_transferred
        FROM tokens_ethereum.transfers
        WHERE contract_address IN (0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84, 0xae78736Cd615f374D3085123A210448E74Fc6393, 0xBe9895146f7AF43049ca1c1AE358B0541Ea49704)
          AND block_time >= date_add('day', -90, now())
          GROUP BY 1
          ORDER BY 1
