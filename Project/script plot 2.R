### Plot 2 ### 

### Reading and selecting data for plot 2

setwd("C:/Users/santiago.sandoval/Documents/courseraR/exdata_data_household_power_consumption")
data <-  read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
objective_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

### Formating variables as date and time
objective_data$Date <- as.Date(objective_data$Date,format =  "%d/%m/%Y")
objective_data$Time <- strptime(objective_data$Time, format = "%H:%M:%S")
objective_data[1:1440,"Time"] <- format(objective_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
objective_data[1441:2880,"Time"] <- format(objective_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

### Ploting a line graph and exporting it as .png

png("plot2.png", width = 480, height = 480)

plot(objective_data$Time, as.numeric(objective_data$Global_active_power), type="l", col="black", ylab = "Global Active Power (kilowatts)", xlab="")


dev.off()
