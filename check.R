## Small script to check data is present; not part of the assignment

# Download, save and extract the source data to the working directory
sourceUrl <- 
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
sourceZip <- "hpconsumption.zip"
sourceData <- "household_power_consumption.txt"

if (!file.exists(sourceData)) {
	if (!file.exists(sourceZip)) {
		download.file(sourceUrl, sourceZip)
	}
	unzip(sourceZip)
        message("Needed file ready...")
} else {
	message("Needed file found...")
}
