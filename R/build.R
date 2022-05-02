# This file downloads data files for depmap using the depmap R package and saves those files in the parquet format.
library(arrow)
library(depmap)

dir.create("data/")
setwd("data/")
write_parquet(depmap_copyNumber(), "depmap_copyNumber.parquet")
write_parquet(depmap_crispr(), "depmap_crispr.parquet")
write_parquet(depmap_drug_sensitivity(), "depmap_drug_sensitivity.parquet")
write_parquet(depmap_metadata(), "depmap_metadata.parquet")
write_parquet(depmap_mutationCalls(), "depmap_mutationCalls.parquet")
write_parquet(depmap_proteomic(), "depmap_proteomic.parquet")
write_parquet(depmap_rnai(), "depmap_rnai.parquet")
write_parquet(depmap_RPPA(), "depmap_RPPA.parquet")
write_parquet(depmap_TPM(), "depmap_TPM.parquet")

