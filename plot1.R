##########################################################
##  Coursera Exploratory Data Analysis - Course Project 1
##  plot 1
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
plotdata <- subset(rawplotdata, Date == "1/2/2007" | Date == "2/2/2007")
plotdata$Date <- as.Date(plotdata$Date, "%m/%d/%Y")
plotdata$Time <- strptime(plotdata$Time, format='%H:%M:%S')
plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
plotdata$Global_reactive_power <- as.numeric(plotdata$Global_reactive_power)

## save dataset for this plot to conserve space:
## write.table(plotdata, file="plotdata.txt", row.names=FALSE, sep = ";")

#####  plot1 code  #####################################################
hist(plotdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
        main ="Global Active Power", ylim=c(0,1200)) ## ylim from "R Cookbook"
dev.copy(png, file = "plot1.png")  ## copy plot to a file in the working directory.  
dev.off()
########################################################################
