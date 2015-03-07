# setwd("C:/Users/Jor/Documents/DSciencesCoursera/04_ExploratoryDataAnalysis/Week1")
library(chron)
info <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

head(info)
month.day.year(as.Date(info$Date[1],"%d/%m/%Y"))


info$Date <- as.Date(info$Date,"%d/%m/%Y")

info2 <- info[month.day.year(info$Date)$month == 2 &
                month.day.year(info$Date)$year == 2007 &
                (month.day.year(info$Date)$day == 1 |
                   month.day.year(info$Date)$day == 2)
              ,];

par(mfrow=c(2,2));

x <- strptime(paste(info2$Date,info2$Time),"%Y-%m-%d %H:%M:%S")

plot(x,as.numeric(as.character(info2$Global_active_power)),type='l',xlab='',ylab='Global Active Power');

plot(x,as.numeric(as.character(info2$Voltage)),type='l',xlab='datetime',ylab='Voltage');


plot(x,as.numeric(as.character(info2$Sub_metering_1)),type='l',xlab='',ylab='Energy sub metering');
lines(x,as.numeric(as.character(info2$Sub_metering_2)),col='red')
lines(x,as.numeric(as.character(info2$Sub_metering_3)),col='blue')

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))

plot(x,as.numeric(as.character(info2$Global_reactive_power)),type='l',xlab='datetime',ylab='Global reactive power');


dev.copy(png,file = 'plot4.png',width=480, height=480)
dev.off()

