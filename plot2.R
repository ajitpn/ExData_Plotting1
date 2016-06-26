source("dataUtil.R")

plot2 <- function(hpc = NULL) {
    if(is.null(hpc))
        hpc <- loadData()
        
    png("./img/plot2.png", width=480, height=480)

    plot(hpc$Time, hpc$Global_active_power,
         xlab="",    
         ylab="Global Active Power (kilowatts)",
         type="l")
    
    dev.off()    
}