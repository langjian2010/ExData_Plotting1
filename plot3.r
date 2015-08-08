## load data

mydata<-read.table("household_power_consumption.txt",header=TRUE,  sep=";",na.strings="?")
mydata$Time<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"))
final.data<-subset(mydata, mydata$Date %in% dates)

## Plot 3
png("plot3.png", width=400, height=400)
plot(final.data$Time, final.data$Sub_metering_1,type="l",col="black",xlab="",  ylab="Energy sub metering")
lines(final.data$Time, final.data$Sub_metering_2,type="l",col="red")
 lines(final.data$Time, final.data$Sub_metering_3,type="l",col="blue")
 legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c ("black","red","blue"),lty=1)
#dev.copy(png,'plot3.png', width=400, height=400)
dev.off()
