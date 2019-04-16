## Versioning functions

archive_dir <- function(output_dir) {
  #' Creates the file path to the Archive directory
  #' @param output_dir the path to create the versioning folder structure in
  #' @examples
  #' ad <- archive_dir("C:/Projects/ProjectXYZ/Data/Processed")

  return(file.path(output_dir, "Archive"))
}

current_dir <- function(output_dir) {
  #' Creates the file path to the Current directory
  #' @param output_dir the path to create the versioning folder structure in
  #' @examples
  #' cd <- current_dir("C:/Projects/ProjectXYZ/Data/Processed")

  return(file.path(output_dir, "Current"))
}

archive_dirs <- function(output_dir) {
  #' Creates the archive directory file structure
  #' @param output_dir the path to create the versioning folder structure in
  #' @examples
  #' ad <- archive_dirs("C:/Projects/ProjectXYZ/Data/Processed")

  return(c(archive_dir(output_dir), current_dir(output_dir)))

}
