setwd("C:\\Users\\Katelynn Roberts\\Documents\\Coursera-DataScience\\Course4\\")

dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Keep two important dates
data_sub <- subset(dataset,Date %in% c("1/2/2007", "2/2/2007"))

# Create date/time variable
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time),format = "%d/%m/%Y %H:%M:%S")

# Create PNG
png("plot4.png", width = 480, height = 480)

# 2x2 layout
par(mfrow = c(2, 2))

#Global Active Power
plot(data_sub$DateTime,data_sub$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

#Voltage
plot(data_sub$DateTime,data_sub$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

#Sub metering
plot(data_sub$DateTime,data_sub$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(data_sub$DateTime,data_sub$Sub_metering_2,col = "red")
lines(data_sub$DateTime,data_sub$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"),lty = 1,bty = "n")

#Global Reactive Power
plot(data_sub$DateTime,data_sub$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
