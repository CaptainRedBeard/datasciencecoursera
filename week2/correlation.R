




corr <- function(directory, threshold = 0) {
    directory <- paste0("~/Downloads/",directory,"/")

    full_set <- complete("specdata", 1:332)
    nobs <- full_set$nobs
    ids <- full_set$id[nobs > threshold]
    list_length <- length(ids)
    correlation_list <- rep(0, list_length)
    
    all_data <- as.character(list.files(directory))
    file_path <- paste(directory, all_data, sep="")

    counter <- 1
    for(i in ids) {
        one_file <- read.csv(file_path[i], header=T, sep=",")
        correlation_list[counter] <- cor(one_file$sulfate, one_file$nitrate, use="complete.obs")
        counter <- counter + 1
    }
    output <- correlation_list
    return(output)   
}
