# Command line Interface Arguments

parseArguments <- function() {
    #' Parses different options from the command line
    
    option_list <- list(optparse::make_option(c("-ab", "--add_branch"), action = "store_true", help = "Add the branch to the commit tag [default= %default]"), 
        optparse::make_option(c("-am", "--add_message"), action = "store_true", help = "Add the message to the commit tag [default= %default]"), 
        optparse::make_option(c("-c", "--commit_message"), action = "store", help = "The commit message [default= %default]"))
    
    opt_parser <- optparse::OptionParser(option_list = option_list)
    opt <- optparse::parse_args(opt_parser)
    
    return(opt)
    
}
