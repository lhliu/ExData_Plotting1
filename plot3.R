source("func.R")
Sys.setlocale(category = "LC_TIME", locale = "C")

plot3 <- function() {
    #Clear plot env
    plot.new()
    
    #Inital plot1 as png
    png("plot3.png", width=480, height=480)
    
    #Read data (column: Global Active Power)
    dat <- readData()
    
    #Draw plot
    datetime <- strptime(dat$datetime_fixed, "%Y-%m-%d %H:%M:%S")
    plot(datetime,as.numeric(as.character(dat$Sub_metering_1)),
         type="l",xlab="",ylab="Energy sub metering")
    lines(datetime,as.numeric(as.character(dat$Sub_metering_2)), col="red")
    lines(datetime,as.numeric(as.character(dat$Sub_metering_3)), col="blue")
    
    legend("topright",lty=1,
           col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #Close plot
    dev.off()
}