## Load full dataset
energy_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
energy_full$Date <- as.Date(energy_full$Date, format="%d/%m/%Y")

## Subsetting the data
energy <- subset(energy_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(energy_full)

## Deal with dates
datetime <- paste(as.Date(energy$Date), energy$Time)
energy$Datetime <- as.POSIXct(datetime)

## Make graph
with(energy, {
        plot(energy$Sub_metering_1~energy$Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines (energy$Sub_metering_2~energy$Datetime, col="Red")
        lines (energy$Sub_metering_3~energy$Datetime, col="Blue")
})

##Add Legend
legend("topright",cex=0.75, col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
