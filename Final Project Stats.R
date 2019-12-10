library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("psych")
library("Hmisc")

# Data Information
summary(ChicagoPublicSchools)

#New Data Set for Analysis
ChiData1 <- subset(ChicagoPublicSchools,select = c(`ZIP Code`, `CPS Performance Policy Level`, `Supportive Environment`,`Effective Leaders`,`Ambitious Instruction`, Safe, `School Community`,`Quality of Facilities`,
             `NWEA Math Growth Percentile All Grades`, `NWEA Reading Growth Percentile All Grades`,`NWEA Math Attainment Percentile All Grades`, `NWEA Reading Attainment Percentile All Grades`,`Suspensions Per 100 students 2013`,
             `Student Attendance Percentage 2013`,`Grade 3-8 On-Track Percentage 2013`))
ChiData1
# Preparing Data for Regression Models
str(ChiData1)
ChiData1$`CPS Performance Policy Level`= as.numeric(ChiData1$`CPS Performance Policy Level`)
ChiData1$`Supportive Environment`= as.factor(ChiData1$`Supportive Environment`)
ChiData1$`Effective Leaders` = as.factor(ChiData1$`Effective Leaders`)
ChiData1$`Ambitious Instruction`= as.factor(ChiData1$`Ambitious Instruction`)
ChiData1$Safe= as.factor(ChiData1$Safe)
ChiData1$`School Community`= as.factor(ChiData1$`School Community`)
ChiData1$`Quality of Facilities`= as.factor(ChiData1$`Quality of Facilities`)
str(ChiData1)
ChiData3 <-na.omit(ChiData1)
summary(ChiData3)
str(ChiData3)
# Backwards Stepwise Regression Model
FitAll = lm(`CPS Performance Policy Level` ~ ., data = ChiData3)
summary(FitAll)
step(FitAll, direction = "backward")


