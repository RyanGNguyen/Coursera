complete <- function(directory, id = 1:332) {
        path <- file.path("C:","Users","ryang", "OneDrive","Documents","R",
                          "Coursera", directory, fsep="/")
        setwd(path)
        fileNames <- list.files(path)
        idList <- c()
        nobs <- c()
        for(x in id) {
                file <- fileNames[x]
                table <- read.csv(file)
                num <- sum(!is.na(table$sulfate) & !is.na(table$nitrate))
                idList <- c(idList, x)
                nobs <- c(nobs, num)
        }
        values <- cbind(idList, nobs)
        df <- data.frame(values)
        colnames(df) <- c('id', 'nobs')
        df
        
}