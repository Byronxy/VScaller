eSet = readRDS("D:/lilab/work/PANCAN/TCGA_toil_pancan_tumor_expr_genecor_v1.Rds")
library(tidyverse)
eSet_tcga_gbm = eSet %>% filter(tissue == "GBM") %>%
  select(-tissue) %>%
  column_to_rownames(var = "sample") %>%
  t()
eSet_tcga_gbm_sub = eSet_tcga_gbm[,c(1:10)]
usethis::use_data(eSet_tcga_gbm_sub)
res <- cal_VS_score(eset = eSet_tcga_gbm)
