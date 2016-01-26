## This creates the Plot 1 plot

library(dplyr)
## Get the data
c1 <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

d1 <- read.table("household_power_consumption.txt",header=TRUE,sep=";", 
     na.strings = "?",colClasses = c1)

d2 <- d1 %>% mutate(Date = as.Date(strptime(Date,"%d/%m/%Y"))) %>% 
     filter(Date == "2007-02-01" | Date == "2007-02-02")

## Make the plot
png(filename="plot1.png", width=480, height=480)

hist(d2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()





