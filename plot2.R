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


##Creating the Graph
png(filename = "plot2.png")
plot(data3$dandt, data3$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
