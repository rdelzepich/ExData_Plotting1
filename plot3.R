# file:   plot3.R
# course: Exploratory Data Analysis
#         course project 1
# author: Ralph Delzepich
#         13.07.2014
# output: plot3.png, 480x480 (px)

# read the comlete set of data from the given data file
epc <-read.csv("household_power_consumption.txt", sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# create a new column DateTime with timestamp
epc$DateTime <- strptime(paste(epc$Date, " ", epc$Time), "%d/%m/%Y %T")
# convert Date column to "real" date format; format in file: dd/mm/yyyy
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
# filter by date, just use 1st and 2nd of February 2007
epc_feb_07 <- epc[epc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
# now the data is filtered and can be plotted
# set graphic device to png; default values of width and height are 480, but
# to make it sure the output has the correct dimensions I'll just add both params
png("ExData_Plotting1/plot3.png", width=480, height=480)
# plot 3
# line graph/timeline of Energy sub metering for all three sub meters over time
# create empty graph with labels
with(epc_feb_07, plot(DateTime, Sub_metering_1, type = "n",xlab="",ylab="Energy sub metering"))
# add line graphs
with(epc_feb_07, lines(DateTime, Sub_metering_1, col = "black"))
with(epc_feb_07, lines(DateTime, Sub_metering_2, col = "red"))
with(epc_feb_07, lines(DateTime, Sub_metering_3, col = "blue"))
# add labels for all three submeters (see above for color coding)
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))# set device back to screen / set device png off
# set device back to screen / set device png off
dev.off()