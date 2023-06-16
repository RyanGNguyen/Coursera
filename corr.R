corr <- function(directory, threshold = 0) {
        path <- file.path("C:","Users","ryang", "OneDrive","Documents","R",
                          "Coursera", directory, fsep="/")
        setwd(path)
        fileNames <- list.files(path)
        df <- complete(directory)
        corList <- c()
        for (x in df["id"]) {
                if (df[x, 2] > threshold) {
                        file <- fileNames[x]
                        table <- read.csv(file)
                        suf <- table[2]
                        nit <- table[3]
                        val <- cor(suf[!is.na(suf)], nit[!is.na(nit)])
                        corList <- c(corList, val)
                }
        }
        corList
}