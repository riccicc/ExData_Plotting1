##########################################################
##  Coursera Exploratory Data Analysis - Course Project 1
##  plot 4
##########################################################

##  install.packages("lubridate")  ## if package is not already installed, install it first.
library(lubridate)  ## from lecture wk4- topic 4 "Getting and Cleaning Data" 
library(stringr)  ## from lecture wk4 - topic 1 "Getting and Cleaning Data" 

getwd()
setwd("C:/Users/ric/ExDataProj1/ExData_Plotting1")

## the assumption is that the source data file is located in the working directory:
rawplotdata <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                       na.strings= c("",NA,"?"), stringsAsFactors=FALSE)

##  subset only the data for the two days needed for this analysis
plotdata <- subset(rawplotdata, Date == "1/2/2007" | Date == "2/2/2007") ## this is day/month/yr.
dateTime <- paste(plotdata$Date, plotdata$Time)
plotdata$Date <- as.Date(plotdata$Date, "%d/%m/%Y")
plotdata$Time <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
plotdata$Global_reactive_power <- as.numeric(plotdata$Global_reactive_power)

## save dataset for this plot to conserve space:
write.table(plotdata, file="plotdata4.txt", row.names=FALSE, sep = ";")

#####  plot4 code  #####################################################
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))

## plot - top left
plot(plotdata$Time, plotdata$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

## plot - top right 
plot(plotdata$Time, plotdata$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

## plot - bottom left
plot(plotdata$Time, plotdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotdata$Time, plotdata$Sub_metering_2, col = "red")
lines(plotdata$Time, plotdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, cex=1)

## plot - bottom right
plot(plotdata$Time, plotdata$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power", ylim=c(0, 0.5)) ##ylim from "R Cookbook," p243

######### build separate file  ####################
dev.copy(png, file = "plot4.png")  ## copy plot to a file in the working directory.  
dev.off()
######## following lines are a test  ############################
##dev.copy2pdf(file="plot4.pdf")
##dev.off()
########################################################################
