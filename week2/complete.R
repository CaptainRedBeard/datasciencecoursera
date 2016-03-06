

complete <- function(directory, id = 1:332) {
    directory <- paste0("~/Downloads/",directory,"/")  
    
    list_length <- length(id)
    id_counter <- rep(0, list_length)

    all_files <- as.character(list.files(directory))
    file_path <- paste0(directory, all_files)
    
    counter <- 1 
    
    for (i in id) {
        one_file <- read.csv(file_path[i], header=T)
        id_counter[counter] <- sum(complete.cases(one_file))
        counter <- counter + 1
    }
    
    output <- data.frame(id = id, nobs = id_counter)
    return(output)
} 
