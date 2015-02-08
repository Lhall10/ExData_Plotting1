setwd("C:/Users/user/Desktop/RExploratory")

##Getting and subseeting the data
datafile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datafile, destfile = "./elecdata.zip")
data <- read.table(unzip("elecdata.zip"), header = T, sep = ";")
data$Date <- strptime(data$Date, "%d/%m/%Y")
data2 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data2$Global_active_power<- as.character(data2$Global_active_power)
data2$Global_active_power<- as.numeric(data2$Global_active_power)

##Making the date and time information work
data3 <- data2
data3$Date <- as.character(data3$Date)
data3$Time<- as.character(data3$Time)
data3$dandt <- as.POSIXct(paste(data3$Date, data3$Time), format= "%Y-%m-%d %H:%M:%S")
subvals <- c(data3$Sub_metering_1, data3$Sub_metering_2, data3$Sub_metering_3)

##Setting up the variables
data3$Sub_metering_1 <- as.character(data3$Sub_metering_1)
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.character(data3$Sub_metering_2)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.character(data3$Sub_metering_3)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)


##Creating the Graph
png(filename = "plot3.png")
plot(data3$dandt, data3$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")

lines(data3$dandt, data3$Sub_metering_1)
lines(data3$dandt, data3$Sub_metering_2, col = "Red")
lines(data3$dandt, data3$Sub_metering_3, col = "Blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "_", col = c("Black", "Red", "Blue"))

dev.off()
