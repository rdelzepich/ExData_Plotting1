# file:   plot2.R
# course: Exploratory Data Analysis
#         course project 1
# author: Ralph Delzepich
#         13.07.2014
# output: plot2.png, 480x480 (px)

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
png("ExData_Plotting1/plot2.png", width=480, height=480)
# plot 2
# line graph/timeline of Global Active Power (kilowatts) over time
# create empty graph with labels
plot(epc_feb_07$DateTime,epc_feb_07$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
# add line graph
lines(epc_feb_07$DateTime,epc_feb_07$Global_active_power)
# set device back to screen / set device png off
dev.off()