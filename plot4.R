library(data.table)
library(dplyr)
library(ggplot2)

#read and clean data
mydata1 <- fread("./household_power_consumption.txt", na.strings = "?")
dt <- filter(mydata1, Date == "1/2/2007"| Date == "2/2/2007")
fdt <- mutate(dt, time = paste(Date, Time))
fdt$time <- strptime(fdt$time, "%d/%m/%Y %T")

#make plot4 and write it into png file
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(5,4,2,1))

        #1
        plot(fdt$time, fdt$Global_active_power, type = "l", 
         xlab = "", ylab = "Global Active Power")

        #2
        plot(fdt$time, fdt$Sub_metering_1, type = "l", 
             xlab = "", ylab = "Energy sub metering")
        
        lines(fdt$time, fdt$Sub_metering_2, type = "l", 
              xlab = "", ylab = "Energy sub metering", col = "red")
        
        lines(fdt$time, fdt$Sub_metering_3, type = "l", 
              xlab = "", ylab = "Energy sub metering", col = "blue")
        
        legend("topright", legend = c("Sub_mettering_1", "Sub_mettering_2", "Sub_mettering_3"), 
               col = c("black", "red", "blue"), lty = 1, margin(0))
        
        #3
        with(fdt, plot(time, Voltage, 
                       xlab="datetime", ylab="Voltage", type="l" ))
        
        #4
        with(fdt, plot(time, Global_reactive_power, 
                       xlab="datetime", ylab="Global_reactive_power", type = "l"))
        
dev.off()