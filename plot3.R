#Read data from unzibbed filled
data = read.table("household_power_consumption.txt", header=TRUE, sep=";")
#Subset data using  dates 2007-02-01 and 2007-02-02
data1 <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
#Format date data
time <- strptime(paste(data1$Date, data1$Time), format='%d/%m/%Y %H:%M:%S')

#Change column data from factor to numeric
data1[, 3] = as.numeric(as.character(data1$Global_active_power))
data1[, 4] = as.numeric(data1$Global_reactive_power)
data1[, 5] = as.numeric(data1$Voltage)
data1[, 6] = as.numeric(data1$Global_intensity)
data1[, 7] = as.numeric(data1$Sub_metering_1)
data1[, 8] = as.numeric(data1$Sub_metering_2)
data1[, 9] = as.numeric(data1$Sub_metering_3)
#Code for plot 3
plot(time, data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub Metering")
lines(time, data1$Sub_metering_2, type="l", col="red")
lines(time, data1$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=c(1,1,1))
#Code for saving plot 3 as png file
png("plot3.png", width=480, height=480)
plot(time, data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub Metering")
lines(time, data1$Sub_metering_2, type="l", col="red")
lines(time, data1$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=c(1,1,1))
dev.off()
