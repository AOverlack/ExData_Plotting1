
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

## creata a plot1
plot1 <- hist(DataTable2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
## copy to png named "Plot1"
dev.copy(png,file="plot1.png")
## switch back to screed device to get png
dev.off()
