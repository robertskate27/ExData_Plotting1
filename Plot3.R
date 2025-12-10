setwd("C:\\Users\\Katelynn Roberts\\Documents\\Coursera-DataScience\\Course4\\")

dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Keep two important dates
data_sub <- subset(dataset,Date %in% c("1/2/2007", "2/2/2007"))

# Create date/time variable
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time),format = "%d/%m/%Y %H:%M:%S")

# Create PNG device
png("plot3.png", width = 480, height = 480)

# Sub_metering_1
plot(data_sub$DateTime,data_sub$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")

# Add Sub_metering_2 and Sub_metering_3
lines(data_sub$DateTime,data_sub$Sub_metering_2,col = "red")
lines(data_sub$DateTime,data_sub$Sub_metering_3,col = "blue")

# Legend
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"),lty = 1)

dev.off()
