ChiData1 <- select(ChicagoPublicSchools,`Name of School`, `ZIP Code`, `CPS Performance Policy Level`, `Supportive Environment`,`Effective Leaders`,`Ambitious Instruction`, `Collaborative Teachers`, `Safe`, `School Community`,`Quality of Facilities`,
             `NWEA Math Growth Percentile All Grades`, `NWEA Reading Growth Percentile All Grades`,`NWEA Math Attainment Percentile All Grades`, `NWEA Reading Attainment Percentile All Grades`)

# Histogram for the start of exploration
CPSH <- ggplot(ChiData1, aes(x =`NWEA Math Growth Percentile All Grades`))
CPSH + geom_histogram()
