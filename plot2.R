
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

#create a plot2
Plot2 <- plot(DataTable$Stamp,DataTable[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")
## copy to png named "plot2" 
dev.copy(png,file="plot2.png")
## switch back to screen device to get png
dev.off()