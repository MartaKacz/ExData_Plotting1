# setting wd
setwd("D:/Coursera/exdata-data-household_power_consumption")

# reading data
dane <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".")

# format
dane$Date <-format(dane$Date)
dane$Time <- format(dane$Time)

# only data from the dates 2007-02-01 and 2007-02-02
dane.new<-dane[(dane$Date == "1/2/2007  ") | (dane$Date == "2/2/2007  "),]

# histogram of Global Active Power
hist(as.numeric(as.character(dane.new$Global_active_power)), main = "Global Active Power", col = "red", xlab ="Global Active Power (kilowatts)")

# saving to png file
png("plot1.png",  width = 480 ,height  = 480, units = "px")
hist(as.numeric(as.character(dane.new$Global_active_power)), main = "Global Active Power", col = "red", xlab ="Global Active Power (kilowatts)")
dev.off()



