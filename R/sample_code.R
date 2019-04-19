library(utilsR)
library(dataArchiveR)
library(dplyr)

output_dir <- "./tests/testthat"

utilsR::create_dirs(file.path(output_dir, c("Data", "Deliverables")))
data_fls <- file.path(output_dir, "Data", c("data.csv", "data_summary.csv"))
plot_fls <- file.path(output_dir, "Deliverables", c("hist_df.png", "hist_df.jpg", "hist_df.tiff"))

## Functions

dm <- function(data_fls) {
    #' Data Management
    #' @param data_fls the files to archive
    
    
    df <- data.frame(col1 = c(1:4), col2 = c("a", "b", "c", "d"))
    df$new_col <- ifelse(df$col1 > 1, 1, 0)
    
    write.csv(x = df, file = data_fls[1])
    
    return(df)
}

dm_sum <- function(df, data_fls) {
    #' Summarize df
    #' @param df the dataframe
    #' @param data_fls the names of the data files to write out
    
    df_sum <- df %>% dplyr::group_by(new_col) %>% dplyr::summarize(n = dplyr::n())
    
    write.csv(x = df, file = data_fls[2])
    
    return(df_sum)
}

plots <- function(df, plot_fls) {
    #' Plot Sample Data
    #' @param df the dataframe
    #' @param data_fls the names of the data files to write out
    
    png(filename = plot_fls[1])
    hist(df$new_col)
    dev.off()
    
    jpeg(filename = plot_fls[2])
    hist(df$new_col)
    dev.off()
    
    tiff(filename = plot_fls[3])
    hist(df$new_col)
    dev.off()
    
}

## Run

df <- dm(data_fls)
df_sum <- dm_sum(df, data_fls)
plots(df, plot_fls)
archive_etl(file.path(output_dir, "Data"), data_fls)
archive_etl(file.path(output_dir, "Deliverables"), plot_fls)
