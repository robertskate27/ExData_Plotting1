setwd("C:\\Users\\Katelynn Roberts\\Documents\\Coursera-DataScience\\Course4\\")

dataset <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Keep two important dates
data_sub <- subset(dataset,Date %in% c("1/2/2007", "2/2/2007"))

# Create date/time variable
data_sub$DateTime <- as.POSIXct(paste(data_sub$Date, data_sub$Time),format = "%d/%m/%Y %H:%M:%S")

# Create PNG
png("plot2.png", width = 480, height = 480)

# Line plot
plot(data_sub$DateTime,data_sub$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
