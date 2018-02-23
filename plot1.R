source("check.R") ## Check data if present

## Ranxel Almario's submission for the ExData_Plotting1 assignment
## plot1.R script

# Read the data from 2007-02-01 and 2007-02-02 only
hpc <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, 
                  nrows = 2880, na.strings = "?")

# Added header names for the hpc dataset
names(hpc) <- 
        c("Date", "Time", "Global_active_power", "Global_reactive_power", 
          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
          "Sub_metering_3") 

# converted column "Date" in hpc into Date classes
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Initialize png graphics device
png("plot1.png", width=480, height=480)

# Plotting histogram
hist(hpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close the connection
dev.off()

message("plot1.png exported...")