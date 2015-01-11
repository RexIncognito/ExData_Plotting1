if(!file.exists("household_power_consumption.txt"))
{
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     message("Downloading the file")
     download.file(fileUrl, destfile = "./household_power_consumption.zip")
     unzip("household_power_consumption.zip")  
}

consumptionData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
febData <- consumptionData[consumptionData$Date=="1/2/2007" | consumptionData$Date=="2/2/2007",]
febData$Date <- as.Date(febData$Date, format="%d/%m/%Y")
febData$DateTime <- strptime(paste(febData$Date, febData$Time), format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(febData, {
     plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab="", type ="l")
     plot(DateTime, Voltage, ylab="Voltage", xlab="datetime", type ="l")
     plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
          with(febData, lines(DateTime, Sub_metering_2, col ="red"))
          with(febData, lines(DateTime, Sub_metering_3, col ="blue"))
          legend("topright", lty=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(DateTime, Global_reactive_power, xlab="datetime", type ="l")
})
     

dev.off()
