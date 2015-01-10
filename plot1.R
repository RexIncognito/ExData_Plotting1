if(!file.exists("household_power_consumption.txt"))
{
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     message("Downloading the file")
     download.file(fileUrl)
     unzip("household_power_consumption.zip")  
}

consumptionData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
febData <- consumptionData[consumptionData$Date=="1/2/2007" | consumptionData$Date=="2/2/2007",]
png(filename="plot1.png", width = 480, height = 480)
hist(febData$Global_active_power, col = "red", labels = FALSE, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()