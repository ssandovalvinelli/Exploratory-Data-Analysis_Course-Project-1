### Plot 1 ### 

##Reading and selecting data for plot 1

setwd("C:/Users/santiago.sandoval/Documents/courseraR/exdata_data_household_power_consumption")
data <-  read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
as.Date(data$Date,format =  "%d%b%Y")
strptime(data$Time, format = "%H:%M:%S")
objective_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

###Constructing a histogram for global active power and exporting it as .png

png("plot1.png", width = 480, height = 480)

hist(as.numeric(objective_data$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main= "Global Active Power")

dev.off()
