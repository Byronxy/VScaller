
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Vistual Stiffness caller (VScaller)

<!-- badges: start -->

<!-- badges: end -->

A R Package for Calculating Virtual Stiffness from Gene Expression Data

## Installation

the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Byronxy/VScaller")
```

## Example

``` r
library(VScaller)
#> VScaller v0.1.0  Welcome to use VScaller
```

We subset expression data from TCGA-GBM for illustration and check it

``` r
data(eSet_tcga_gbm_sub)
eSet_tcga_gbm_sub[1:5,1:5]
#>         TCGA-02-0047-01 TCGA-02-0055-01 TCGA-02-2483-01 TCGA-02-2485-01
#> MT-CO1          14.0136         12.3945         13.1153         11.9787
#> MT-CO3          13.4037         12.2022         13.4436         11.7649
#> MT-CO2          13.5251         12.3893         13.4086         11.6139
#> MT-ATP8         13.8439         11.7280         13.6287         12.0474
#> MT-ATP6         13.7777         11.9408         13.4227         11.7723
#>         TCGA-06-0125-01
#> MT-CO1          13.7174
#> MT-CO3          13.0777
#> MT-CO2          13.3993
#> MT-ATP8         13.3213
#> MT-ATP6         13.2619
```

Run calculation function

``` r
res <- cal_VS_score(eset = eSet_tcga_gbm_sub,verbose = FALSE)
#> Warning in .local(expr, gset.idx.list, ...): 19765 genes with constant
#> expression values throuhgout the samples.
head(res[,c(1:5)])
#>            sample Virtual_stiffness GO_EXTRACELLULAR_MATRIX_ASSEMBLY
#> 1 TCGA-02-0047-01          2.033695                         2.080860
#> 2 TCGA-02-0055-01          2.164910                         2.150061
#> 3 TCGA-02-2483-01          1.940980                         2.050644
#> 4 TCGA-02-2485-01          1.907394                         2.032538
#> 5 TCGA-06-0125-01          2.007569                         2.085841
#> 6 TCGA-06-0125-02          2.096711                         2.167207
#>   GO_EXTRACELLULAR_MATRIX_STRUCTURAL_CONSTITUENT GO_COMPLEX_OF_COLLAGEN_TRIMERS
#> 1                                       1.818321                       2.042861
#> 2                                       2.055580                       2.235923
#> 3                                       1.719075                       1.940959
#> 4                                       1.711142                       1.941093
#> 5                                       1.845455                       2.077646
#> 6                                       1.906860                       2.137334
```
