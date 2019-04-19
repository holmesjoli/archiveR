output_dir <- "./tests/testthat/Data"
commit <- "bd429f"
fl <- "data.csv"

testthat::test_that("archive connects", {
  
  archive <- dataArchiveR::archive_connect(output_dir, commit, fl)
  expect_true(class(archive)[2] == "connection")
  
})

testthat::test_that("csv can be imported into R", {
  
  df_archive <- dataArchiveR::extract_csv(output_dir, commit, fl)
  df_current <- read.csv(file.path(dataArchiveR::create_current_dir(output_dir), fl))
  
  expect_true(all(df_archive == df_current))
  
})
