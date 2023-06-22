best <- function(state, outcome) {
        ##Read outcome data 
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        states <- unique(data$State)
        
        ##Check if state is valid
        if (!(state %in% states)) {
                print("invalid state")
        }
        
        ##Check if outcome is valid
        if (!(outcome %in% outcomes)) {
                print("invalid outcome")
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
        hospitals <- data[data$State == state, search_col]
        
        ##Return hospital name in that state with lowest 30-day death rate
        data[which(hospitals == min(hospitals)), "Hospital.Name"]
}