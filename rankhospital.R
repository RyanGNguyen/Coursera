rankhospital <- function(state, outcome, num = "best") {
        ##Read outcome data 
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        states <- unique(data$State)
        
        ##Check if state is valid
        if (!(state %in% states)) {
                stop("invalid state")
        }
        
        ##Check if outcome is valid
        if (!(outcome %in% outcomes)) {
                stop("invalid outcome")
        }
        
        ##Finalize search range
        search_out <- if (identical(outcome, outcomes[1])) {
                "Heart.Attack"
        } else if (identical(outcome, outcomes[2])) {
                "Heart.Failure"
        } else {
                "Pneumonia"
        }
        search_col <- paste("Hospital.30.Day.Death..Mortality..Rates.from", 
                            search_out, sep = ".") 
        
        ##Find mortality rates
        rates <- as.numeric(data[data$State == state, search_col])
        ordered_rates <- sapply(order(rates, na.last = NA), function(x) rates[x])
        
        #Pick mortality rate
        if (is.numeric(num)) {
                if (num > length(ordered_rates)) {
                        return(NA)
                }
        } else {
                if (num == "best") {
                        num <- 1
                } else if (num == "worst") {
                        num <- length(ordered_rates)
                }
        }
        numRate <- ordered_rates[num]
        
        ##Find hospital that corresponds to numRate
        idx <- which(data$State == state & data[search_col] == format(numRate, nsmall = 1))
        data[idx, "Hospital.Name"]
}