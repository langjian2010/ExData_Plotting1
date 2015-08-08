## for plot1
## load data

mydata<-read.table("household_power_consumption.txt",header=TRUE,  sep=";",na.strings="?")
mydata$Time<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"))
final.data<-subset(mydata, mydata$Date %in% dates)

## Plot 1
png("plot1.png", width=400, height=400)
hist(final.data$Global_active_power,col='red',xlab="Global Active Power  (kilowatts)",main="Global Active Power")
#dev.copy(png,'plot1.png', width=400, height=400)
dev.off()
