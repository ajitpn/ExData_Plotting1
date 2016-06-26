source("dataUtil.R")

plot1 <- function(hpc = NULL) {
    if(is.null(hpc))
        hpc <- loadData()
        
    png("./img/plot1.png", width=480, height=480)

    hist(hpc$Global_active_power, 
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         main="Global Active Power",
         col="red")
    
    dev.off()    
}