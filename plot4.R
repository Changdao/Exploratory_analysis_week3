#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#In scc file, these 
#Fuel Comb - Electric Generation - Coal
#Fuel Comb - Industrial Boilers, ICEs - Coal
#Fuel Comb - Comm/Institutional - Coal
emi<-readRDS('summarySCC_PM25.rds')
scc<-readRDS('Source_Classification_Code.rds')
scc_coal<-scc[(scc$EI.Sector %in% c('Fuel Comb - Electric Generation - Coal','Fuel Comb - Industrial Boilers, ICEs - Coal','Fuel Comb - Comm/Institutional - Coal')),]

emi_coal<-emi[(emi$SCC %in% scc_coal$SCC),]
emi_coal_total<-aggregate(Emissions~year,emi_coal,sum)
png('plot4.png')
plot(emi_coal_total$year,emi_coal_total$Emissions,type='l',xlab='Year',ylab='Emissions from coal (ton)')
dev.off()

