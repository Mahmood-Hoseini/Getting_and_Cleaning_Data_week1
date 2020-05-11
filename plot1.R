library("data.table")

#Reads in data from file then subsets data for specified dates
dt <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

dt <- dt[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plotting
hist(dt[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()