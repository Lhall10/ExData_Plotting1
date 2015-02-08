setwd("C:/Users/user/Desktop/RExploratory")

##Getting and subseeting the data
datafile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datafile, destfile = "./elecdata.zip")
data <- read.table(unzip("elecdata.zip"), header = T, sep = ";")
data$Date <- strptime(data$Date, "%d/%m/%Y")
data2 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data2$Global_active_power<- as.character(data2$Global_active_power)
data2$Global_active_power<- as.numeric(data2$Global_active_power)

##Creating the Histogram
png(filename = "plot1.png")
hist(data2$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
