## Versioning functions

create_archive_dir <- function(output_dir) {
    #' Creates the file path to the Archive directory
    #' @param output_dir the path to create the versioning folder structure in
    #' @examples
    #' output_dir <- '.'
    #' ad <- archive_dir(output_dir)
    
    return(file.path(output_dir, "Archive"))
}

create_current_dir <- function(output_dir) {
    #' Creates the file path to the Current directory
    #' @param output_dir the path to create the versioning folder structure in
    #' @examples
    #' output_dir <- '.'
    #' cd <- current_dir(output_dir)
    
    return(file.path(output_dir, "Current"))
}

create_archive_str <- function(output_dir) {
    #'Creates the archive structure
    #'@param output_dir the output directory where the archive structure will be created
    #'@examples
    #'output_dir <- c('.')
    #'create_archive_str(output_dir)
    
    utilsR::create_dirs(c(create_archive_dir(output_dir), create_current_dir(output_dir)))
    
}

move_to_current <- function(fls, current_dir) {
    #' Moves the files to the Current folder
    #' @param fls a list of the files to archive
    #' @param current_dir the current directory
    #' @examples 
    #' output_dir <- '.'
    #' current_dir <- create_current_dir(output_dir)
    #' fls <- c('data.csv', 'data_log.log')
    #' utilsR::create_files(fls)
    #' move_to_current(fls, current_dir)
    
    utilsR::remove_files(dir(current_dir, full.names = T))
    
    assertthat::assert_that(all(sapply(1:length(fls), FUN = function(x) {
        file.rename(fls[x], file.path(current_dir, basename(fls[x])))
    })))
}

create_archive <- function(commit, current_dir, archive_dir) {
    #' Copies files from the Current folder, adds them to the archive, and zips files using the commit id as the filename
    #' @param commit the commit id
    #' @param current_dir the current directory
    #' @param archive_dir the archive directory
    #' @examples 
    #' commit <- 'master_98jgh8'
    #' output_dir <- '.'
    #' archive_files <- c('data.csv', 'data_log.log')
    #' create_archive(commit, output_dir, fls)
    
    zipped_fl <- paste0(commit, ".zip")
    zip::zipr(zipped_fl, files = dir(current_dir, full.names = T))
    assertthat::assert_that(file.rename(zipped_fl, file.path(archive_dir, zipped_fl)))
    
}

archive_output <- function(commit, output_dir, fls) {
    #' Writes archive fls out to the Current folder and archives the same files with a commit id
    #' @param commit the commit id
    #' @param output_dir the path to create the file archive
    #' @param fls a list of the files to archive
    #' @examples
    #' commit <- 'master_98jgh8'
    #' output_dir <- '.'
    #' fls <- c('data.csv', 'data_log.log')
    #' archive_output(commit, output_dir, fls)
    
    archive_dir <- create_archive_dir(output_dir)
    current_dir <- create_current_dir(output_dir)
    
    create_archive_str(output_dir)
    move_to_current(fls, current_dir)
    create_archive(commit, current_dir, archive_dir)
    
}

write_output <- function(output_dir, fls) {
  #' Writes archive fls out to the Current folder 
  #' @param output_dir the path to create the file archive
  #' @param fls a list of the files to archive
  #' @examples
  #' output_dir <- '.'
  #' fls <- c('data.csv', 'data_log.log')
  #' write_output(output_dir, fls)
  
  archive_dir <- create_archive_dir(output_dir)
  current_dir <- create_current_dir(output_dir)
  
  create_archive_str(output_dir)
  move_to_current(fls, current_dir)
  
}

