#   dataUtil.R

#   Reads source data file (zip), Unzips it, loads the household_power_consumption data into a data table

loadData <- function() {
    fileName <- "../Data/household_power_consumption.txt"
    url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipFile <- "../Data/inData.zip" 

    # Check if the data is already downloaded and if not, download it
    if (!file.exists(fileName)) {
        download.file(url, destfile = zipFile)
        unzip(zipFile)
        file.remove(zipFile)
    }

    # Reading the file
    df <- read.table(fileName, sep = ";", header = TRUE, na="?",
                colClasses = c("character", "character", rep("numeric",7)))
    
    # Convert Date and Time columns from character to Date and Datetime respectively
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

                
    # Selecting only data between dates 2007-02-01 and 2007-02-01
    dateRange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dateRange)
    
    return(df)
}