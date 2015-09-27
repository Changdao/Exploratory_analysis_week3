#Emissions from moter vehicles
#Mobile - On-Road Gasoline Light Duty Vehicles     
#Mobile - On-Road Gasoline Heavy Duty Vehicles     
#Mobile - On-Road Diesel Light Duty Vehicles       
#Mobile - On-Road Diesel Heavy Duty Vehicles
emi<-readRDS('summarySCC_PM25.rds')
scc<-readRDS('Source_Classification_Code.rds')
scc_coal<-scc[(scc$EI.Sector %in% c('Mobile - On-Road Gasoline Light Duty Vehicles',
    'Mobile - On-Road Gasoline Heavy Duty Vehicles ',
    'Mobile - On-Road Diesel Light Duty Vehicles',
    'Mobile - On-Road Diesel Heavy Duty Vehicles')),]

emi_coal<-emi[(emi$SCC %in% scc_coal$SCC),]
emi_coal_total<-aggregate(Emissions~year,emi_coal,sum)
png('plot5.png')
plot(emi_coal_total$year,emi_coal_total$Emissions,type='l',xlab='Year',ylab='Emissions from coal (ton)')
dev.off()
