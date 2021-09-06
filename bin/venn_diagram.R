library(VennDiagram)

outl.bay.8sites <- read.delim("../results/databases/bayes_outliers_8sites", sep = " ")
outl.bay.8sites <- outl.bay.8sites[,7]

outl.bay.2pop <- read.delim("../results/databases/bayes_outliers_2pop", sep = " ")
outl.bay.2pop <- outl.bay.2pop[,7]


outl.pcadapt <- read.delim("../results/databases/pcadapt_outliers", sep = " ")
outl.pcadapt <- outl.pcadapt[,2]


outl.snpstats.8sites <- read.csv("../results/databases/pop.99.fst.snps.79.2_8sitios.csv")
outl.snpstats.8sites <- outl.snpstats.8sites[,1]

outl.snpstats.2pop <- read.csv("../results/databases/pop2.99.fst.snps.79.2_2poblaciones.csv")
outl.snpstats.2pop <- outl.snpstats.2pop[,1]
class(outl.snpstats.2pop)

outliers <- intersect(outl.bay.2pop, outl.bay.8sites, outl.snpstats.2pop, outl.snpstats.8sites, outl.pcadapt)
class(outliers)

outliers_intersect <- Reduce(intersect, list(outl.bay.2pop, outl.bay.8sites, outl.snpstats.2pop, outl.snpstats.8sites, outl.pcadapt))
outliers_intersect

venn.diagram( x = list(outl.bay.2pop, outl.bay.8sites, outl.snpstats.2pop, outl.snpstats.8sites, outl.pcadapt), 
             category.names = c("Bayescan2pop" ,"Bayescan8sites", "SnpStat2pop", "SnpStat8sites", "PCAdapt"),
             filename = "../results/figures/venn.outl.bay.snpstat.pcadapt.2pop.8sites.png",
             output = TRUE ,
             imagetype="png" ,
             resolution = 600,
             compression = "lzw",
             lwd = 1,
             lty = "blank",
             fill = c("blue", "red", "yellow", "green","pink"),
             cex = 1,
             fontfamily = "times",
             cat.cex = .8,
             cat.default.pos = "outer",
             #cat.pos = c(-15, 15),
             #cat.dist = c(0.055, 0.055, 0.055),
            # cat.fontfamily = "times"
)


