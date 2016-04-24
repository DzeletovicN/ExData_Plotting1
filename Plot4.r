library(plyr)
df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE) ##read file

##prepare data for ploting
df_filter <- subset(df,Date=="1/2/2007" | Date =="2/2/2007")
df_filter <- mutate(df_filter, Datetime = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))
df_filter <-mutate(df_filter,Global_active_power = as.numeric(as.character(Global_active_power)))
df_filter <-mutate(df_filter,Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
df_filter <-mutate(df_filter,Voltage = as.numeric(as.character(Voltage)))
df_filter <-mutate(df_filter,Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
df_filter <-mutate(df_filter,Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))

png("plot4.png") ##create file 
par(mfrow = c(2,2)) ##define 4plots
with(df_filter,plot(Datetime,Global_active_power,type = 'l', xlab = "", ylab = "Global active power",main = ""))  ##drow plot1
with(df_filter,plot(Datetime,Voltage,type = 'l', ylab = "Voltage",main = ""))   ##drow plot2
##drow plot3
with(df_filter,plot(Datetime,Sub_metering_1,type = "l",main = "", ylab = "Energy dub metering", xlab = ""))
with(df_filter,points(Datetime,Sub_metering_2,type = "l", col  = "red"))
with(df_filter,points(Datetime,Sub_metering_3,type = "l", col  = "blue"))
legend("topright", bty = "n",pch = "-", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(df_filter,plot(Datetime,Global_reactive_power,type = 'l', ,main = "")) ##drow plot4
dev.off() ##close connection