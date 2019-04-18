## Git tools


setUp <- function(user.name, user.email) {
    #' Configure repository
    #' 
    #' Initiates and configures the repository
    #' @param user.name server (github, bitbucket, etc.) username
    #' @param user.email the users email
    #' @return the repository
    #' @examples 
    #' repo <- config.repo('Joli Holmes', 'holmesjoligmail.com')
    
    repo <- git2r::repository(".")
    git2r::config(repo, global = F, user.name, user.email)
    
    return(repo)
    
}

check_master <- function(repo) {
    #' Checks if the master branch is active
    #' Checks to see if the HEAD is on the master branch
    #' @param repo the repository to check
    #' @return the name of the active branch
    #' @examples 
    #' repo <- config.repo('Joli Holmes', 'holmesjoligmail.com')
    #' check_master(repo)
    
    active_branch <- git2r::repository_head(repo)$name
    
    if (active_branch != "master") {
        
        ui <- readline("Master branch is not active. Continue? \n1:Yes \n2:No\n")
        while (ui %in% c(1, 2) == FALSE) {
            ui <- readline("Please select 1 or 2")
        }
        
        if (ui == 2) {
            stop("Autocommit stopped")
        } else {
            print("Continuing autocommit")
        }
        
    }
    
    return(active_branch)
    
}

auto_commit <- function(repo, user.name, user.password, fl, message, add_branch, add_message) {
    #' Automattically commits
    #' 
    #' Automattically commits code
    #' @param repo the repository
    #' @param user.name username
    #' @param user.password user password
    #' @param fl the file to commit
    #' @param message the commit message
    #' @param add_branch takes the values TRUE or FALSE; if TRUE adds branch to the beginning of the the commit tag
    #' @param add_message takes the values TRUE or FALSE; if TRUE adds message to the end of the commit tag
    #' @return filename to be used to version output files and datasets
    #' @examples 
    #' repo <- config.repo('Joli Holmes', 'holmesjoligmail.com')
    #' auto_commit(repo, 'holmesjoli', 'password', '.', 'July 2018 Monthly')
    
    active_branch <- check_master(repo)
    
    git2r::add(repo = repo, path = fl)
    commit_result <- git2r::commit(repo = repo, message)
    git2r::push(repo, credentials = cred_user_pass(username = user.name, password = user.password))
    
    hash <- substring(commit_result$sha, 1, 6)
    
    if (add_message) {
        commit <- paste(hash, message, sep = "_")
    }
    if (add_branch) {
        commit <- paste(branch, hash, sep = "_")
    }
    
    return(commit)
}





