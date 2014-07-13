readData <- function(location = '.') {
    
    #Get household power raw data from internet
    datazip = "exdata_data_household_power_consumption.zip"
    if (!file.exists(datazip)) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      destfile=datazip,method="curl")
    }
    unzip(datazip)
    
    #Read data to dat
    dat <- read.csv("household_power_consumption.txt", 
                    sep=";", header=TRUE)         
    
    #Filter data by date =2007/2/1 & 2007/2/2
    datx <-  dat[dat$Date == '2/2/2007' | dat$Date == '1/2/2007',]
    datetime <- paste(datx$Date,datx$Time)
    
    #Combine date & time to datetime_fixed, for plot usage
    datetime_fixed  <- strptime(datetime,format ="%d/%m/%Y %H:%M:%S")
    cbind(datx, datetime_fixed)
}

whereAmI <- function(){
    getwd()
}
#/Users/kcliu/Documents/ExData_Plotting1/