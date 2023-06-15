complete <- function(directory, id = 1:332) {
        path <- file.path("C:","Users","ryang", "OneDrive","Documents","R","Coursera", directory, fsep="/")
        setwd(path)
        fileNames <- list.files(path)
        nobs <- c()
        files <- c()
        for(x in id) {
                file <- fileNames[x]
                table <- read.csv(file)
                num <- sum(!is.na(table[2:3]))
                files <- c(files, x)
                nobs <- c(nobs, num)
        }
        df <- data.frame(nobs, row.names = files)
        names(df) <- c("id", "nobs")
        df
        
}