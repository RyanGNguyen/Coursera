pollutantmean <- function(directory, pollutant, id = 1:332) {
        sum <- 0
        count <- 0
        for() {
                file <- file.path("C:","Users","ryang", "OneDrive","Documents","R","Coursera", directory, fsep="/")
                table <- read.csv(file)
                pol <- table[pollutant]
                pol_no_NA <- pol[!is.na(pol)]
                
        }
}