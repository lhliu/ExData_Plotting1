source("func.R")
Sys.setlocale(category = "LC_TIME", locale = "C")

plot4 <- function() {
    #Clear plot env
    plot.new()
    
    #Inital plot1 as png
    png("plot4.png", width=480, height=480)
    
    #Read data (column: Global Active Power)
    dat <- readData()

    #Prepare datetime and plot mainframe
    par(mfrow = c(2,2))
    datetime <- strptime(dat$datetime_fixed, "%Y-%m-%d %H:%M:%S")
    
    #Draw plot4-1
    plot(datetime,
         as.numeric(as.character(dat$Global_active_power)),
         type="l",xlab="",ylab="Global Active Power")

    #Draw plot4-2
    plot(datetime,
         as.numeric(as.character(dat$Voltage)),
         type="l",xlab="datetime",ylab="Voltage")
    
    #Draw plot4-3
    plot(datetime,as.numeric(as.character(dat$Sub_metering_1)),
         type="l",xlab="",ylab="Energy sub metering")
    lines(datetime,as.numeric(as.character(dat$Sub_metering_2)), col="red")
    lines(datetime,as.numeric(as.character(dat$Sub_metering_3)), col="blue")
    
    legend("topright",lty=1,
           col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    #Draw plot4-1
    plot(datetime,
         as.numeric(as.character(dat$Global_reactive_power)),
         type="l",xlab="datetime", ylab="Global_reactive_power")
    
    #Close plot
    dev.off()
}