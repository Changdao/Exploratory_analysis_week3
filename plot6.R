#Emissions from moter vehicles
#Mobile - On-Road Gasoline Light Duty Vehicles     
#Mobile - On-Road Gasoline Heavy Duty Vehicles     
#Mobile - On-Road Diesel Light Duty Vehicles       
#Mobile - On-Road Diesel Heavy Duty Vehicles
emi<-readRDS('summarySCC_PM25.rds')
scc<-readRDS('Source_Classification_Code.rds')
scc_motor<-scc[(scc$EI.Sector %in% c('Mobile - On-Road Gasoline Light Duty Vehicles',
    'Mobile - On-Road Gasoline Heavy Duty Vehicles ',
    'Mobile - On-Road Diesel Light Duty Vehicles',
    'Mobile - On-Road Diesel Heavy Duty Vehicles')),]

emi_motor_ba<-emi[(emi$SCC %in% scc_motor$SCC & emi$fips=='24510'),]
emi_motor_ba_total<-aggregate(Emissions~year,emi_motor_ba,sum)

emi_motor_ca<-emi[(emi$SCC %in% scc_motor$SCC & emi$fips=='06037'),]
emi_motor_ca_total<-aggregate(Emissions~year,emi_motor_ca,sum)

ggplot() +
       geom_line(data = emi_moter_ba_total, aes(x = year, y = Emissions))+
       geom_line(data = emi_motor_ca_total, aes(x = year, y = Emissions,colour="red"))

dev.print(file="plot6.png", device=png, width=800)
