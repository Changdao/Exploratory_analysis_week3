## plot the PM emissions of Baltimore City, Maryland by year.
scc<-readRDS('summarySCC_PM25.rds')
scc_ba<-scc[scc$fips=='24510',]
ye_ba<-aggregate(Emissions~year,scc_ba,sum)
png('plot2.png')
plot(ye_ba,type='l',xlab='Year',ylab='Emissions (tons)')
dev.off()