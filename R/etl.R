
#' @title Error handling username
#' @description Error handling username from cli
#' @param opts the cli options
un <- function(opts) {
    
    if (is.null(opts[["user_name"]])) {
        stop("Missing Github username")
    } else {
        return(opts[["user_name"]])
    }
}

#' @title Error handling email
#' @description Error handling email from cli
#' @param opts the cli options
ue <- function(opts) {
    
    if (is.null(opts[["user_email"]])) {
        stop("Missing email")
    } else {
        
        return(opts[["user_email"]])
    }
}

#' @title Error handling password
#' @description Error handling password from cli
#' @param opts the cli options
up <- function(opts) {
    
    if (is.null(opts[["user_password"]])) {
        stop("Missing Github password")
    } else {
        return(opts[["user_password"]])
    }
}

eval <- function(add) {
    
    if (is.null(add)) {
        return(FALSE)
    } else {
        return(TRUE)
    }
    
}

#' @title Archive ETL
#' @description Initiates the ETL for archiving
#' @param output_dir the output directory
#' @param fls: the files to move to Current folder
#' @export
archive_etl <- function(output_dir, fls) {
    
    opts <- parseArguments()
    
    if (!is.null(opts[["commit_message"]])) {
        
        message <- opts[["commit_message"]]
        add_branch <- eval(opts[["add_branch"]])
        add_message <- eval(opts[["add_message"]])
        
        user.name <- un(opts)
        user.email <- ue(opts)
        user.password <- up(opts)
        
        repo <- setUp(user.name, user.email)
        commit <- auto_commit(repo, user.name, user.password, fl = ".", message, add_branch, add_message)
        archive_output(commit, output_dir, fls)
        
    } else {
        
        write_output(output_dir, fls)
    }
    
}
