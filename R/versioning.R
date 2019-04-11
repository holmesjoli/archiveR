## Versioning functions

make_dirs <- function(pth){
  #'Makes a directory structure 
  #'
  #'Makes a directory structure that's compatible with the versioning system
  #'
  #'@param pth the root project directory path to create the versioning system structure in
  #'@examples
  #' make_dirs("C:/Projects/ProjectXYZ")

  dir.create(file.path(pth, "Data"))
  dir.create(file.path(pth, "Data", "Processed"))
  dir.create(file.path(pth, "Data", "Processed", "Current"))
  dir.create(file.path(pth, "Data", "Processed", "Archive"))
  dir.create(file.path(pth, "Data", "Raw"))
  
  dir.create(file.path(pth, "Deliverables"))
  dir.create(file.path(pth, "Deliverables", "Current"))
  dir.create(file.path(pth, "Deliverables", "Archive"))
  
}
