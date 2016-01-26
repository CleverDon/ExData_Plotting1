## This creates the Plot 3 plot

library(dplyr)
## Get the data
c1 <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

d1 <- read.table("household_power_consumption.txt",header=TRUE,sep=";", 
                 na.strings = "?",colClasses = c1)

d2 <- d1 %>% mutate(DateDay = as.Date(strptime(Date,"%d/%m/%Y"))) %>% 
  filter(DateDay == "2007-02-01" | DateDay == "2007-02-02")

d2$DateTime <- as.POSIXct(strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S"))

## Make the plot
png(filename="plot3.png", width=480, height=480)

plot(d2$DateTime, d2$Sub_metering_1, type="l",col="black", xlab="",ylab="Energy sub metering")
points(d2$DateTime, d2$Sub_metering_2, type="l",col="red")
points(d2$DateTime, d2$Sub_metering_3, type="l",col="blue")

legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid")


dev.off()





