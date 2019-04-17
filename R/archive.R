## Versioning functions

create_archive_dir <- function(output_dir) {
    #' Creates the file path to the Archive directory
    #' @param output_dir the path to create the versioning folder structure in
    #' @examples
    #' ad <- archive_dir('C:/Projects/ProjectXYZ/Data/Processed')
    
    return(file.path(output_dir, "Archive"))
}

create_current_dir <- function(output_dir) {
    #' Creates the file path to the Current directory
    #' @param output_dir the path to create the versioning folder structure in
    #' @examples
    #' cd <- current_dir('C:/Projects/ProjectXYZ/Data/Processed')
    
    return(file.path(output_dir, "Current"))
}

create_archive_str <- function(output_dir) {
    #'Creates the archive structure
    #'@param output_dir the output directory where the archive structure will be created
    #'@examples
    #'output_dir <- c('./Data/Processed')
    #'create_archive_str(output_dir)
    
    utilsR::create_dirs(c(create_archive_dir(output_dir), create_current_dir(output_dir)))
    
}

move_to_current <- function(archive_fls, current_dir) {
    #' Moves the files to the Current folder
    #' @param archive_fls a list of the files to archive
    #' @param current_dir the current directory
    #' @examples 
    #' output_dir <- 'C:/Projects/ProjectXYZ/Data/Processed'
    #' current_dir <- create_current_dir(output_dir)
    #' archive_fls <- c('data.csv', 'data_log.log')
    #' move_to_current(archive_fls, current_dir)
    
    utilsR::remove_files(dir(current_dir, full.names = T))
    sapply(1:length(archive_fls), FUN = function(x) {
        file.rename(archive_fls[x], file.path(current_dir, archive_fls[x]))
    })
}

create_archive <- function(commit, current_dir, archive_dir) {
    #' Copies files from the Current folder, adds them to the archive, and zips files using the commit id as the filename
    #' @param commit the commit id
    #' @param current_dir the current directory
    #' @param archive_dir the archive directory
    #' @examples 
    #' commit <- 'master_98jgh8'
    #' output_dir <- 'C:/Projects/ProjectXYZ/Data/Processed'
    #' archive_files <- c('data.csv', 'data_log.log')
    #' create_archive(commit, output_dir, archive_fls)
    
    zipped_fl <- paste0(commit, ".zip")
    zip::zipr(zipped_fl, files = dir(current_dir, full.names = T))
    file.rename(zipped_fl, file.path(archive_dir, zipped_fl))
    
}

archive_files <- function(commit, output_dir, archive_fls) {
    #' Writes archive fls out to the Current folder and archives the same files with a commit id
    #' @param commit the commit id
    #' @param output_dir the path to create the file archive
    #' @param archive_fls a list of the files to archive
    #' @return 
    #' @examples
    #' commit <- 'master_98jgh8'
    #' output_dir <- 'C:/Projects/ProjectXYZ/Data/Processed'
    #' archive_files <- c('data.csv', 'data_log.log')
    #' archive_files(commit, output_dir, archive_fls)
    
    archive_dir <- create_archive_dir(output_dir)
    current_dir <- create_current_dir(output_dir)
    
    create_archive_str(output_dir)
    move_to_current(archive_fls, current_dir)
    create_archive(commit, current_dir, archive_dir)
    
}

