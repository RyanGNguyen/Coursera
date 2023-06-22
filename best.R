best <- function(state, outcome) {
        ##Read outcome data 
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        states <- unique(data$State)
        
        ##Check that state and outcome are valid 
        if (!(state %in% states)) {
                print("invalid state")
        }
        
        if (!(outcome %in% outcomes)) {
                print("invalid outcome")
        }
        
        ##Return hospital name in that state with lowest 30-day death rate
}