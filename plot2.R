source("func.R")
Sys.setlocale(category = "LC_TIME", locale = "C")

plot2 <- function() {
    #Clear plot env
    plot.new()
    
    #Inital plot1 as png
    png("plot2.png", width=480, height=480)
    
    #Read data (column: Global Active Power)
    dat <- readData()
    
    #Draw plot
    datetime <- strptime(dat$datetime_fixed, "%Y-%m-%d %H:%M:%S")
    plot(datetime,
         as.numeric(as.character(dat$Global_active_power)),
         type="l",xlab="",ylab="Global Active Power (kilowatts)")
    
    #Close plot
    dev.off()
}