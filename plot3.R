if ("household_power_consumption.txt" %in% dir() == FALSE) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
        unzip("household_power_consumption.zip")}


power <- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE,na.strings = "?")
power$Date <- paste(power$Date,power$Time)
power$Date <- strptime(power$Date, "%d/%m/%Y %H:%M:%S")


subset <- subset(power, Date >= "2007-02-01" & Date < "2007-02-03")

par(mar=c(4,5,1,2))

plot(subset$Date, subset$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n")
lines(subset$Date, subset$Sub_metering_1, col="black")
lines(subset$Date, subset$Sub_metering_2, col="red")
lines(subset$Date, subset$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red","blue"), cex=0.8, lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png,"plot3.png", width=480,height=480)
dev.off()