# === script preparation === #
setwd("~/Documents/4 - ExploratoryData/project_1")
rm(list=ls())
library(sqldf)

# === processing === #
df <- read.csv2.sql("./household_power_consumption_.txt",sep=";",
                    'select * from file where Date = "1/2/2007" or Date = "2/2/2007" ')
df$Time <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
plot(df$Time,df$Global_active_power,type="l",xlab = ""
     ,ylab = "Global Active Power (kilowatts)")

# === write to file === #
dev.copy(png, file = "plot2.png")
dev.off()
