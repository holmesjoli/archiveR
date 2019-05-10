# Loads data from the archive

#' @title Archive Connect
#' @description Extracts a csv (comma delimited) file from the archive
#' @param output_dir the directory where the archive structure is
#' @param commit the commit id
#' @param fl the file name to extract
#' @return the archive connection
archive_connect <- function(output_dir, commit, fl) {
    
    archive_dir <- create_archive_dir(output_dir)
    archive_name <- grep(commit, list.files(archive_dir), value = TRUE)
    
    archive <- unz(file.path(archive_dir, archive_name), fl)
    
    return(archive)
}

#' @title Extract csv
#' @description Extracts a csv (comma delimited) file from the archive
#' @param output_dir the directory where the archive structure is
#' @param commit the commit id
#' @param fl the file name to extract
#' @return the data from the file specified
#' @examples 
#' output_dir <- './tests/testthat/Data'
#' commit <- 'bd429f' #this will have to be changed
#' fl <- 'data.csv'
#' df <- extract_csv(output_dir, commit, fl)
#' @export
extract_csv <- function(output_dir, commit, fl) {
    
    archive <- archive_connect(output_dir, commit, fl)
    df <- read.table(archive, header = TRUE, sep = ",")
    
    return(df)
    
}

#' @title Extract tsv
#' @description Extracts a tsv (tab delimited) file from the archive
#' @param output_dir the directory where the archive structure is
#' @param commit the commit id
#' @param fl the file name to extract
#' @return the data from the file specified
#' @examples 
#' output_dir <- './tests/testthat/Data'
#' commit <- 'bd429f' #this will have to be changed
#' fl <- 'data.tsv'
#' df <- extract_tsv(output_dir, commit, fl)
#' @export
extract_tsv <- function(output_dir, commit, fl) {
    
    archive <- archive_connect(output_dir, commit, fl)
    df <- read.table(archive, header = TRUE, sep = "\t")
    
    return(df)
    
}
