# setting wd
setwd("D:/Coursera/exdata-data-household_power_consumption")

# reading data
dane <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".")

# format
dane$Date <-format(dane$Date)
dane$Time <- format(dane$Time)

# only data from the dates 2007-02-01 and 2007-02-02
dane.new<-dane[(dane$Date == "1/2/2007  ") | (dane$Date == "2/2/2007  "),]

# different graphs of Electric power consumption dataset
Sys.setlocale("LC_TIME", "English") 

# converting the Date and Time variables to Date/Time classes
dateTime <- strptime( paste(dane.new$Date,dane.new$Time), format="%d/%m/%Y %H:%M:%S")

# graph of Energy submaterling
par(mfrow= c(2,2))
# plot 1
plot(dateTime, as.numeric(as.character(dane.new$Global_active_power)), type = "l",ylab = "Global Active Power (kilowatts)", xlab = "" )

# plot 2
plot(dateTime, as.numeric(as.character(dane.new$Voltage)), type = "l",ylab = "Voltage", xlab = "" )

# plot 3
plot(dateTime, as.numeric(as.character(dane.new$Sub_metering_1)), type = "l",ylab = "Energy submaterling", xlab = "" )
lines(dateTime, as.numeric(as.character(dane.new$Sub_metering_2)),col = "red")
lines(dateTime, as.numeric(as.character(dane.new$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"), lty = 1, col = c("black", "red", "blue"))

# plot 4
plot(dateTime, as.numeric(as.character(dane.new$Global_reactive_power)), type = "l",ylab = "Global_reactive_power", xlab = "" )




# saving to png file
png("plot4.png",  width = 480 ,height  = 480, units = "px")
par(mfrow= c(2,2))
# plot 1
plot(dateTime, as.numeric(as.character(dane.new$Global_active_power)), type = "l",ylab = "Global Active Power (kilowatts)", xlab = "" )

# plot 2
plot(dateTime, as.numeric(as.character(dane.new$Voltage)), type = "l",ylab = "Voltage", xlab = "" )

# plot 3
plot(dateTime, as.numeric(as.character(dane.new$Sub_metering_1)), type = "l",ylab = "Energy submaterling", xlab = "" )
lines(dateTime, as.numeric(as.character(dane.new$Sub_metering_2)),col = "red")
lines(dateTime, as.numeric(as.character(dane.new$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"), lty = 1, col = c("black", "red", "blue"))

# plot 4
plot(dateTime, as.numeric(as.character(dane.new$Global_reactive_power)), type = "l",ylab = "Global_reactive_power", xlab = "" )

dev.off()
