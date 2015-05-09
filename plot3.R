library(dplyr)
data<-read.csv("household_power_consumption.txt", sep = ";")  #load data
data<-mutate(data, "Index" = 1:2075259)
data1<-data[(data$Index>=(47*24*60-1043) & data$Index<=(47*24*60-1043+2*1440-1)),]  #keep the good data
#head(data1)
#tail(data1)

par(mfrow = c(1,1))

with(data1,plot(as.numeric(as.character(Sub_metering_1)), xaxt = "n",xlab ="", ylab ="Energy sub metering",type="l"))  #plot sub_metering_1
with(data1,lines(as.numeric(as.character(Sub_metering_2)), col = "red"))                                               #plot sub_metering_2
with(data1,lines(as.numeric(as.character(Sub_metering_3)), col = "blue"))                                              #plot sub_metering_3

axis(1, at = seq(0, 2900,1450), labels = c("Thu","Fri","Sar"), tck = -0.01)                                            #print axes
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty=1,col = c("black","red","blue")) #print the legend

dev.copy(png, file = "plot3.png",height = 480, width = 480)   #save the file
dev.off()
