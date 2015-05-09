library(dplyr)
data<-read.csv("household_power_consumption.txt", sep = ";")  #load the data
data<-mutate(data, "Index" = 1:2075259)
data1<-data[(data$Index>=(47*24*60-1043) & data$Index<=(47*24*60-1043+2*1440-1)),]  #keep the good data
#head(data1)
#tail(data1)

par(mfrow = c(1,1))

with(data1,plot(as.numeric(as.character(Global_active_power)),xaxt = "n",xlab ="",ylab = "Global Active Power (kilowatts)", type = "l")) #plot
axis(1, at = seq(0, 2900, 1450), labels = c("Thu","Fri","Sar"), tck = -0.01) #print the good axe

dev.copy(png, file = "plot2.png",height = 480, width = 480)  #save file
dev.off()
