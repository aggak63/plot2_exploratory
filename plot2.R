
## plot2: requires to datetime global active power. Read the file and subset in same way as done in
## plot1. However, there is need to convert date from character to date and use time to create 
## detetime variable, in dmy format. Time is in hms

x<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, quote= "", 
strip.white=TRUE, 
stringsAsFactors = F, na.strings = "?")
x<- subset(x, (x$Date == "1/2/2007" | x$Date== "2/2/2007")) 

## create datetime variable
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
x$DateTime <- as.POSIXct(paste(x$Date, x$Time))

png("plot2.png", width=480, height= 480)
plot(x$DateTime, x$Global_active_power, type= "l", 
     lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off() 


