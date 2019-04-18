library(utilsR)
library(dataArchiveR)

output_dir <- "./tests/testthat"

test_that("create archive structure creates the appropriate folders", {

  create_archive_str(output_dir)
  testthat::expect_true(create_archive_dir(output_dir) %in% dir(output_dir, full.names = TRUE))  
  testthat::expect_true(create_current_dir(output_dir) %in% dir(output_dir, full.names = TRUE))  
  
})


test_that("move to current moves the files to current", {
  
  fls <- file.path(output_dir, c("test1.txt", "test2.txt"))
  create_files(fls)
  
  move_to_current(fls, create_current_dir(output_dir))
  

})