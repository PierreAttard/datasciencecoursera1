library(dplyr)
data<-read.csv("household_power_consumption.txt", sep = ";")  #load the file
data<-mutate(data, "Index" = 1:2075259)
data1<-data[(data$Index>=(47*24*60-1043) & data$Index<=(47*24*60-1043+2*1440-1)),]  #keep the good data
#head(data1)
#tail(data1)
par(mfrow = c(2,2)) # 4 parts in the plot

with(data1,plot(as.numeric(as.character(Global_active_power)),xaxt = "n",xlab="",ylab = "Global_active_power",type="l")) #plot the first plot
axis(1, at = seq(0, 2900, 1450), labels = c("Thu","Fri","Sar"), tck = -0.01)  #print axe of the first plot

with(data1,plot(as.numeric(as.character(Voltage)),xaxt = "n",ylab = "Voltage", xlab = "datetime",type="l"))              # plot the second plot(voltage)
axis(1, at = seq(0, 2900, 1450), labels = c("Thu","Fri","Sar"), tck = -0.01)  #print axe of the second plot
     
with(data1,plot(as.numeric(as.character(Sub_metering_1)), xaxt = "n", ylab ="Energy sub metering",xlab="", type="l"))  #plot sub_metering_1
with(data1,lines(as.numeric(as.character(Sub_metering_2)), col = "red"))                                               #plot sub_metering_2
with(data1,lines(as.numeric(as.character(Sub_metering_3)), col = "blue"))                                              #plot sub_metering_3

axis(1, at = seq(0, 2900, 1450), labels = c("Thu","Fri","Sar"), tck = -0.01)  #print axe of the 3rd plot
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty=1,col = c("black","red","blue"), cex = 0.6)  #legend

with(data1,plot(as.numeric(as.character(Global_reactive_power)),xaxt = "n",ylab = "Global_reactive_ower", xlab = "datetime",type="l"))  #plot the last plot
axis(1, at = seq(0, 2900, 1450), labels = c("Thu","Fri","Sar"), tck = -0.01)

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

