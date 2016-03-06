



pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
    directory <- paste0("~/Downloads/",directory,"/")

    full_data <- c()
    list_all_files <- as.character(list.files(directory))
    file_path <- paste0(directory, list_all_files)
    
    for(i in id) {
        one_file <- read.csv(file_path[i], header=T)
        remove_na <- one_file[!is.na(one_file[, pollutant]), pollutant]
        full_data <- c(full_data, remove_na)
    }
    
    output <- mean(full_data)
    return(output)
}
