CREATE OR REFRESH STREAMING TABLE supply_chain.bronze.metadata
  COMMENT "Raw metadata - bronze layer" AS
SELECT
  *
FROM
  STREAM read_files(
    "/Volumes/data/supply_chain/raw/metadata",
    format => "csv",
    header => "true",
    inferSchema => "true"
  );