library(data.table)
library(dplyr)
library(ggplot2)

#read and clean data
mydata1 <- fread("./household_power_consumption.txt", na.strings = "?")
dt <- filter(mydata1, Date == "1/2/2007"| Date == "2/2/2007")
fdt <- mutate(dt, time = paste(Date, Time))
fdt$time <- strptime(fdt$time, "%d/%m/%Y %T")

#make plot3 and write it into png file
png("plot3.png", width = 480, height = 480)
plot(fdt$time, fdt$Sub_metering_1, type = "l", 
        xlab = "", ylab = "Energy sub metering")

lines(fdt$time, fdt$Sub_metering_2, type = "l", 
      xlab = "", ylab = "Energy sub metering", col = "red")

lines(fdt$time, fdt$Sub_metering_3, type = "l", 
      xlab = "", ylab = "Energy sub metering", col = "blue")

legend("topright", legend = c("Sub_mettering_1", "Sub_mettering_2", "Sub_mettering_3"), 
       col = c("black", "red", "blue"), lty = 1, margin(0))

dev.off()