if ("household_power_consumption.txt" %in% dir() == FALSE) {
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip")}


power <- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE,na.strings = "?")
power$Date <- paste(power$Date,power$Time)
power$Date <- strptime(power$Date, "%d/%m/%Y %H:%M:%S")


subset <- subset(power, Date >= "2007-02-01" & Date < "2007-02-03")

par(mar=c(5,5,3,2))
with(subset, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.copy(png,"plot1.png", width=480,height=480)
dev.off()

