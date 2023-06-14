pollutantmean <- function(directory, pollutant, id = 1:332) {
        path <- file.path("C:","Users","ryang", "OneDrive","Documents","R","Coursera", directory, fsep="/")
        setwd(path)
        fileNames <- list.files(path)
        sum <- 0
        count <- 0
        for(x in id) {
                file <- fileNames[x]
                table <- read.csv(file)
                pol <- table[pollutant]
                pol_no_NA <- pol[!is.na(pol)]
                sum <- sum + sum(pol_no_NA)
                count <- count + length(pol_no_NA)
        }
        mean = sum / count
        mean
}