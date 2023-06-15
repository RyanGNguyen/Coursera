complete <- function(directory, id = 1:332) {
        path <- file.path("C:","Users","ryang", "OneDrive","Documents","R","Coursera", directory, fsep="/")
        setwd(path)
        fileNames <- list.files(path)
        nobs <- c()
        names <- c()
        for(x in id) {
                file <- fileNames[x]
                table <- read.csv(file)
                pol <- table[pollutant]
                names <- c(names, x)
                nobs <- c(nobs, length(pol[!is.na(pol)]))
        }
        df <- data.frame(nobs, row.names = names)
        df
        
}