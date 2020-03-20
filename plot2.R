library(data.table)
library(dplyr)
library(ggplot2)

#read and clean data
mydata1 <- fread("./household_power_consumption.txt", na.strings = "?")
dt <- filter(mydata1, Date == "1/2/2007"| Date == "2/2/2007")
fdt <- mutate(dt, time = paste(Date, Time))
fdt$time <- strptime(fdt$time, "%d/%m/%Y %T")

#make plot2 and write it into png file
png("plot2.png", width = 480, height = 480)
plot(fdt$time, fdt$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()