# read in file and create subset for time period
data <- read.csv(file = "../exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data["datetime"] <- as.POSIXct(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

electricData <- subset(data, 
                       data$datetime > as.POSIXct("2007-02-01", format = "%Y-%m-%d")
                       & data$datetime < as.POSIXct("2007-02-03", format = "%Y-%m-%d"))

# open the graphics device
png(filename = "plot3.png")

# create plot 3 - Energy Sub Metering over Time 

## main plot
plot(y = electricData$Sub_metering_1, 
     x = electricData$datetime, type = "l", 
     xlab = "", ylab = "Energy sub metering")
## add sub metering 2
lines(y = electricData$Sub_metering_2, 
      x = electricData$datetime, col = "red")
## add sub metering 3
lines(y = electricData$Sub_metering_3, 
      x = electricData$datetime, col = "blue")
## add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), 
       lwd=c(2.5,2.5),
       col=c("black","red","blue"))


# output png graphics file
dev.off()