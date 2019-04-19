# Loads data from the archive

archive_connect <- function(output_dir, commit, fl) {
    #' Extracts a csv (comma delimited) file from the archive
    #' @param output_dir the directory where the archive structure is
    #' @param commit the commit id
    #' @param fl the file name to extract
    #' @returns the archive connection
    #' @examples 
    #' output_dir <- "./tests/testthat/Data"
    #' commit <- "bd429f" #this will have to be changed
    #' fl <- "data.csv"
    #' archive <- archive_connect(output_dir, commit, fl)
  
    archive_dir <- create_archive_dir(output_dir)
    archive_name <- grep(commit, list.files(archive_dir), value = TRUE)
    
    archive <- unz(file.path(archive_dir, archive_name), fl)
    
    return(archive)  
}

extract_csv <- function(archive){
    #' Extracts a csv (comma delimited) file from the archive
    #' @param archive the archive connection 
    #' @returns the data from the file specified
    #' @examples 
    #' output_dir <- "./tests/testthat/Data"
    #' commit <- "bd429f" #this will have to be changed
    #' fl <- "data.csv"
    #' archive <- archive_connect(output_dir, commit, fl)
    #' df <- extract_csv(archive)
   
    df <- read.table(archive, header = TRUE, sep = ",")
    
    return(df)
  
}

extract_tsv <- function(archive){
  #' Extracts a tsv (tab delimited) file from the archive
  #' @param archive the archive connection 
  #' @returns the data from the file specified
  #' @examples 
  #' output_dir <- "./tests/testthat/Data"
  #' commit <- "bd429f" #this will have to be changed
  #' fl <- "data.tsv"
  #' archive <- archive_connect(output_dir, commit, fl)
  #' df <- extract_tsv(archive)
  
  df <- read.table(archive, header = TRUE, sep = "\t")
  
  return(df)
  
}
