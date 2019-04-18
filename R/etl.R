un <- function(opts){
  #' Error handling username from cli
  #' @param opts the cli options
  
  if(is.null(opts["user_name"])) {
    stop("Missing Github username")
  }else{
    return(opts["user_name"])
  }
}

ue <- function(opts){
  #' Error handling email from cli
  #' @param opts the cli options
  
  if(is.null(opts["user_email"])) {
    stop("Missing email")
  }else{
    
    return(opts["user_email"])
  }
}

up <- function(opts){
  #' Error handling password from cli
  #' @param opts the cli options
  
  if(is.null(opts["user_password"])) {
    stop("Missing Github password")
  }else{
    return(opts["user_password"])
  }
}


archive_elt <- function(output_dir, fls) {
  #' Initiates the ETL for archiving
  #' @param output_dir the output directory
  #' @param fls: the files to move to Current folder

  opts <- parseArguments()
  
  if(!is.null(opts["commit_message"])){

    message <- opts["commit_message"]
    
    user.name <- un(opts)
    user.email <- ue(opts)
    user.password <- up(opts)

    add_branch <- opts["add_branch"]
    add_message <- opts["add_message"]
    
    repo <- setUp(user.name, user.email)
    commit <- auto_commit(repo, user.name, user.password, fl = ".", message, add_branch, add_message)
    archive_output(commit, output_dir, fls)

  
  }else{
    
    write_output(output_dir, fls)
  }
    
}
