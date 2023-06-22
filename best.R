best <- function(state, outcome) {
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
        
        ##Find the lowest mortality rate 
        rates <- as.numeric(data[data$State == state, search_col])
        bestRate <- min(rates, na.rm = T)
        
        ##Find hospital that corresponds to lowest mortality rate
        ##Correct index is 4103
        bestIdx <- which(data$State == state & data[search_col] == bestRate)
        data[bestIdx, "Hospital.Name"]
}