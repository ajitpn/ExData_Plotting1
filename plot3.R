source("dataUtil.R")

plot3 <- function(hpc = NULL) {
    if(is.null(hpc))
        hpc <- loadData()
        
    png("./img/plot3.png", width=480, height=480)

    plot(hpc$Time, hpc$Sub_metering_1, col="black",
         xlab="",    
         ylab="Energy sub metering",
         type="l")
         
    lines(hpc$Time, hpc$Sub_metering_2, col="red")
    lines(hpc$Time, hpc$Sub_metering_3, col="blue")
    
    legend("topright", col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)
    
    dev.off()    
}