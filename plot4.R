
Table <- read.table("./data/household_power_consumption.txt",
                    header=TRUE,
                    stringsAsFactors=FALSE,
                    sep=";",
                    na.strings="?")

## Combine Date and Time variables (character) into one variable "Stamp"

DataTable$Stamp <- paste(DataTable$Date,DataTable$Time)

## Convert the character into a date and time format: POSIXlt and POSIXt.

DataTable$Stamp <- strptime(DataTable$Stamp,format="%d/%m/%Y %H:%M:%S")

##Change the classes of the measures into numeric.

DataTable$Global_active_power <- as.numeric(DataTable$Global_active_power)
DataTable$Global_reactive_power <- as.numeric(DataTable$Global_reactive_power)
DataTable$Voltage <- as.numeric(DataTable$Voltage)
DataTable$Global_intensity <- as.numeric(DataTable$Global_intensity)
DataTable$Sub_metering_1 <- as.numeric(DataTable$Sub_metering_1)
DataTable$Sub_metering_2 <- as.numeric(DataTable$Sub_metering_2)
DataTable$Sub_metering_3 <- as.numeric(DataTable$Sub_metering_3)

par(mfrow=c(2,2))
par(mar=c(2,2,2,2))
with(DataTable,{
        plot(Stamp,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
        plot(Stamp,Voltage,type="l",xlab="datetime")
        plot(Stamp,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=" ")
        lines(Stamp,Sub_metering_2,type="l",col="red")
        lines(Stamp,Sub_metering_3,type="l",col="blue")
        legend("topright",lty=1 ,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Stamp,Global_reactive_power,type="l",xlab="datetime")
        
})
dev.copy(png,file="plot4.png")
dev.off()