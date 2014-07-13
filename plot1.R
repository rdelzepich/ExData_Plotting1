# file:   plot1.R
# course: Exploratory Data Analysis
#         course project 1
# author: Ralph Delzepich
#         13.07.2014
# output: plot1.png, 480x480 (px)

# read the comlete set of data from the given data file
epc <-read.csv("household_power_consumption.txt", sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# convert Date column to "real" date format; format in file: dd/mm/yyyy
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
# filter by date, just use 1st and 2nd of February 2007
epc_feb_07 <- epc[epc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
# now the data is filtered and can be plotted
# set graphic device to png; default values of width and height are 480, but
# to make it sure the output has the correct dimensions I'll just add both params
png("ExData_Plotting1/plot1.png", width=480, height=480)
# plot 1
# histogram ofGlobal Active Power (kilowatts) 
hist(epc_feb_07$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
# set device back to screen / set device png off
dev.off()