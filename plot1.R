# read in file and create subset for time period
data <- read.csv(file = "../exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data["datetime"] <- as.POSIXct(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")

electricData <- subset(data, 
                       data$datetime > as.POSIXct("2007-02-01", format = "%Y-%m-%d")
                       & data$datetime < as.POSIXct("2007-02-03", format = "%Y-%m-%d"))


# open the graphics device
png(filename = "plot1.png")

# create plot 1 - historgram of Global Active Power
hist(electricData$Global_active_power,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylim = c(0,1200), 
     col = "red")

# output png graphics file
dev.off()
