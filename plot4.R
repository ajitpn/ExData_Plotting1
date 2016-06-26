source("dataUtil.R")

plot4 <- function(hpc=NULL) {
    if(is.null(hpc))
        hpc <- loadData()

    png("./img/plot4.png", width=480, height=480)

    par(mfrow=c(2,2))
    
    # Plot 1  - Global Active Power
    plot(hpc$Time, hpc$Global_active_power,
         xlab="",
         ylab="Global Active Power",
         type="l")
    
    # Plot 2 - Voltage
    plot(hpc$Time, hpc$Voltage,
         xlab="datetime", 
         ylab="Voltage",
         type="l")
    
    # Plot 3 - Sub Metering 1, 2, 3
    plot(hpc$Time, hpc$Sub_metering_1, col="black",
         xlab="", 
         ylab="Energy sub metering",
         type="l")
         
    lines(hpc$Time, hpc$Sub_metering_2, col="red")
    lines(hpc$Time, hpc$Sub_metering_3, col="blue")
    
    legend("topright", col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)
    
    # Plot 4 - Global reactive Power
    plot(hpc$Time, hpc$Global_reactive_power, type="n",
         xlab="datetime", ylab="Global_reactive_power")
    lines(hpc$Time, hpc$Global_reactive_power)
    
    dev.off()

}
