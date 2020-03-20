library(data.table)
library(dplyr)
library(ggplot2)

#read and clean data
mydata1 <- fread("./household_power_consumption.txt", na.strings = "?")
dt <- filter(mydata1, Date == "1/2/2007"| Date == "2/2/2007")
fdt <- mutate(dt, time = paste(Date, Time))
fdt$time <- strptime(fdt$time, "%d/%m/%Y %T")

#make plot1 and write it into png file
png("plot1.png", width = 480, height = 480)
hist(fdt$Global_active_power, 
     breaks=12, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = 'Frequency', col = "red")
dev.off()
