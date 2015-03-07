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
              ,]

hist(as.numeric(as.character(info2$Global_active_power)), main="Global active power", xlab="Global Active Power", col='red')
dev.copy(png,file = 'plot1.png',width=480, height=480)
dev.off()

