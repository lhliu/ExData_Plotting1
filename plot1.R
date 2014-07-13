source("func.R")
Sys.setlocale(category = "LC_TIME", locale = "C")

plot1 <- function() {
    #Clear plot env
    plot.new()
    
    #Inital plot1 as png
    png("plot1.png", width=480, height=480)
    
    #Read data (column: Global Active Power)
    dat <- readData()
    dat3 <- as.numeric(as.character(dat[,3]),na.rm = TRUE)
    
    #Draw hist
    hist(x3, col="red", 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    
    #Close plot
    dev.off()
}