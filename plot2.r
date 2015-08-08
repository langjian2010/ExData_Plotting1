## load data

mydata<-read.table("household_power_consumption.txt",header=TRUE,  sep=";",na.strings="?")
mydata$Time<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"))
final.data<-subset(mydata, mydata$Date %in% dates)


## Plot 2
png("plot2.png", width=400, height=400)
plot(final.data$Time,final.data$Global_active_power,type="l",xlab="",ylab="Global  Active Power (kilowatts)")
#dev.copy(png,'plot2.png', width=400, height=400)
dev.off()
