output_dir <- "./tests/testthat"
fls <- file.path(output_dir, c("data.csv"))

dm <- function(fls) {
  #' Data Management
  #' @param fls the files to archive


  df <- data.frame(col1 = c(1:4), col2 = c("a", "b", "c", "d"))
  df["new_col"] <- ifelse(df["col1"] > 1, 1, 0)

  write.csv(x = df, file = fls[1])

}


dm(fls)
dataArchiveR::archive_etl(output_dir, fls)

