setwd("/Users/hyeaw/Desktop/Coursera/Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption") 


## read the file
power_consumtion<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## formatted the Date 
theDate<-as.Date(power_consumption$Date,"%d/%m/%Y" )

power_consumption$Date<-theDate
## subsetting the data only "2007-02-01" and "2007-02-02"
data<-subset(power_consumption, power_consumption$Date == "2007-02-01" | power_consumption$Date == "2007-02-02")

## make the histogram by Global_active_power
hist(as.numeric(data$Global_active_power), main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")