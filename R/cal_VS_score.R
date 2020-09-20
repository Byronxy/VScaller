
#' Function for calculating virtual stiffness score
#' @param eset a matrix or dataframe (row: gene symbal id, col: sample id) (transcriptome data: CPM, TPM, RPKM, FPKM, etc.)
#' @param method method in GSVA, default 'ssgsea'
#' @return a data frame
#' @export
#' @author Yi Xiong
#' @import dplyr
#' @import GSVA
#' @import tibble
#' @examples
cal_VS_score <- function(eset = NULL, method = "ssgsea",...){
  data(stiffness_marker)
  eset = as.matrix(eset)
  #eset = t(eset)
  #Auto Log2 Transformation
  if(max(eset)>100) eset<-log2(eset+1)
  eset_gsva <- as.data.frame(t(GSVA::gsva(eset, stiffness_marker, method = method,...)))
  eset_gsva = eset_gsva %>%
    tibble::rownames_to_column(var = "sample")
  eset_gsva = eset_gsva %>% dplyr::mutate(Virtual_stiffness = rowMeans(eset_gsva[,c(2:12)]))
  eset_gsva = eset_gsva %>% dplyr::select(sample,Virtual_stiffness,everything())
  return(eset_gsva)
}
