corr <- function(directory, threshold = 0) {
        path <- file.path("C:","Users","ryang", "OneDrive","Documents","R",
                          "Coursera", directory, fsep="/")
        setwd(path)
        fileNames <- list.files(path)
        df <- complete(directory)
        corList <- c()
        for (i in as.vector(df$id)) {
                if (df[i, "nobs"] > threshold) {
                        file <- fileNames[i]
                        table <- read.csv(file)
                        comCases <- table[!is.na(table$sulfate) & 
                                                  !is.na(table$nitrate), 2:3]
                        val <- cor(comCases[1], comCases[2])
                        corList <- c(corList, val)
                }
        }
        corList
}