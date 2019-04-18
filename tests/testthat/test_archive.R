library(testthat)
library(assertthat)
library(utilsR)
library(dataArchiveR)

commit <- "master_95804f"
output_dir <- "./tests/testthat"
fls <- file.path(output_dir, c("test1.txt", "test2.txt"))

testthat::test_that("create archive structure creates the appropriate folders", {

  dataArchiveR::create_archive_str(output_dir)
  testthat::expect_true(create_archive_dir(output_dir) %in% dir(output_dir, full.names = TRUE))  
  testthat::expect_true(create_current_dir(output_dir) %in% dir(output_dir, full.names = TRUE))  
  
})


testthat::test_that("move to current moves the files to current", {

  utilsR::create_files(fls)
  testthat::expect_true(all(basename(fls) %in% list.files(output_dir)))
  cd <- dataArchiveR::create_current_dir(output_dir)
  dataArchiveR::move_to_current(fls, cd)
  testthat::expect_true(all(basename(fls) %in% list.files(cd)))

})

testthat::test_that("archive zip files creates a zipped directory", {

  archive_dir <- dataArchiveR::create_archive_dir(output_dir)
  current_dir <- dataArchiveR::create_current_dir(output_dir)
  dataArchiveR::create_archive(commit, current_dir, archive_dir)

  testthat::expect_true(paste0(commit, ".zip") %in% list.files(archive_dir))
  utilsR::remove_dirs(c(create_archive_dir(output_dir), create_current_dir(output_dir)))

})
