# Command line Interface Arguments

parseArguments <- function() {
    #' Parses different options from the command line
    
    b <- optparse::make_option(c("-b", "--add_branch"), action = "store_true", help = "Add the branch to the commit tag")
    m <- optparse::make_option(c("-m", "--add_message"), action = "store_true", help = "Add the message to the commit tag")
    c <- optparse::make_option(c("-c", "--commit_message"), action = "store", help = "The commit message")
    e <- optparse::make_option(c("-e", "--user_email"), action = "store", help = "User's email")
    p <- optparse::make_option(c("-p", "--user_password"), action = "store", help = "User's password ")
    n <- optparse::make_option(c("-n", "--user_name"), action = "store", help = "Github Username")
    
    option_list <- list(b, m, c, e, p, n)
    
    opt_parser <- optparse::OptionParser(option_list = option_list)
    opt <- optparse::parse_args(opt_parser)
    
    return(opt)
    
}
