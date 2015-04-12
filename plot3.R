# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_1")
rm(list=ls())
library(sqldf)

# === processing === #
df <- read.csv2.sql("./household_power_consumption_.txt",sep=";",
                    'select * from file where Date = "1/2/2007" or Date = "2/2/2007" ')
df$Time <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
plot(df$Time,df$Sub_metering_1,type="l",xlab = "",col="black"
     ,ylab = "Energy sub metering")
lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright",lty = 1,col= c("black","red","blue")
       ,legend=c("Sub_metering_1",
                 "Sub_metering_2",
                 "Sub_metering_3"))

# === write to file === #
dev.copy(png, file = "plot3.png")
dev.off()
