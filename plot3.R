source("check.R") ## Check data if present

## Ranxel Almario's submission for the ExData_Plotting1 assignment
## plot3.R script

# Read the data from 2007-02-01 and 2007-02-02 only
hpc <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, 
                  nrows = 2880, na.strings = "?")

# Added header names for the hpc dataset
names(hpc) <- 
        c("Date", "Time", "Global_active_power", "Global_reactive_power", 
          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
          "Sub_metering_3") 

# Added column "DT" in hpc from strptime-ing "Date" and "Time" of hpc
hpc$DT <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Initialize png graphics device
png("plot3.png", width=480, height=480)

# Plotting initial line plot, followed by 2 line layers
plot(x = hpc$DT, y= hpc$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l")
lines(x = hpc$DT, y = hpc$Sub_metering_2, col="red")
lines(x = hpc$DT, y = hpc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", 
                              "Sub_metering_3"), lwd=c(1,1), lty=c(1,1), 
                              col=c("black","red","blue"))

# Close the connection
dev.off()

message("plot3.png exported...")