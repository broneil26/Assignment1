
## Load full dataset
energy_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
energy_full$Date <- as.Date(energy_full$Date, format="%d/%m/%Y")

## Subsetting the data
energy <- subset(energy_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(energy_full)

## Create histogram #1
hist(energy$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col ="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
     