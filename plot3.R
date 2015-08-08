
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

##Create plot 3
plot3 <- plot(DataTable$Stamp,DataTable$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=" ")
lines(DataTable$Stamp,DataTable$Sub_metering_2,type="l",col="red")
lines(DataTable$Stamp,DataTable$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1 ,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Copy to png file
dev.copy(png,file="plot3.png")
## Switch back to screen device to save the file.
dev.off()