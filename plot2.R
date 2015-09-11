# first we extract the data from the file
data<-read.table("household_power_consumption.txt",sep=";")
# we add the names as needed
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering")
# we subset to get the data from the days we need
data2<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
# we plot the graphic with date time and type l, xlab and ylab
# this is to put the language in Englih
Sys.setlocale("LC_ALL","English")
plot(strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="Plot2.png")
dev.off()
