#Exploratory Data Analysis
#Course Project 1
#Plot 3

#Commented Out ------
#source('~/Documents/Learnings/MOOC/DataScience/Exploratory/Projects/ExploratoryProject01/plot3.R')
#setwd("~/Documents/Learnings/MOOC/DataScience/Exploratory/Projects/ExploratoryProject01/")
#tempurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url = tempurl,destfile = "pwr_cnsmp.zip", method = "curl")
#unzip(zipfile = "pwr_cnsmp.zip")
#Commented Out ------


df <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = c("?"))
#str(df)
df$Time <-paste(df$Date, df$Time)
df$Time <-strptime(df$Time, "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
sub.df = subset(df, df$Date >='2007-02-01' & df$Date <= '2007-02-02')
library(datasets)
png("plot3.png", width=480, height=480)
with(sub.df, plot(sub.df$Time,sub.df$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering"))
with(sub.df, points(sub.df$Time,sub.df$Sub_metering_2,col="red",type="l"))
with(sub.df, points(sub.df$Time,sub.df$Sub_metering_3,col="blue",type="l"))
legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()