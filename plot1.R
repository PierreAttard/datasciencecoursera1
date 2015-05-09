library(dplyr)
data<-read.csv("household_power_consumption.txt", sep = ";")    #load data
data<-mutate(data, "Index" = 1:2075259)
data1<-data[(data$Index>=(47*24*60-1043) & data$Index<=(47*24*60-1043+2*1440-1)),] #keep the good data
#head(data1)
#tail(data1)
par(mfrow = c(1,1))
with(data1,hist(as.numeric(as.character(Global_active_power)),col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", nclass = 13)) # plot

dev.copy(png, file = "plot1.png",height = 480, width = 480)  #save the plot
dev.off()   
