# read in file and create subset for time period
data <- read.csv(file = "../exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data["datetime"] <- as.POSIXct(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

electricData <- subset(data, 
                       data$datetime > as.POSIXct("2007-02-01", format = "%Y-%m-%d")
                       & data$datetime < as.POSIXct("2007-02-03", format = "%Y-%m-%d"))


# open the graphics device
png(filename = "plot2.png")

# create plot 2 - Global Active Power Over Time 
plot(y = electricData$Global_active_power, 
     x = electricData$datetime, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# output png graphics file
dev.off()