emi<-readRDS('summarySCC_PM25.rds')
emi_ba<-emi[emi$fips=='24510',]
yte_ba<-aggregate(Emissions~type+year,emi_ba,sum)
ggplot() +
       geom_line(data = yte_ba[yte_ba$type=='ON-ROAD',], aes(x = year, y = Emissions))+
       geom_line(data = yte_ba[yte_ba$type=='NON-ROAD',], aes(x = year, y = Emissions))+
       geom_line(data = yte_ba[yte_ba$type=='NONPOINT',], aes(x = year, y = Emissions))+
       geom_line(data = yte_ba[yte_ba$type=='POINT',], aes(x = year, y = Emissions))
dev.print(file="plot3.png", device=png, width=800)