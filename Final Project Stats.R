library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("psych")
library("Hmisc")
library("IDPmisc")

# Data Information

summary(ChicagoPublicSchools)

#New Data Set for Analysis
ChiData1 <- subset(ChicagoPublicSchools,select = c(`ZIP Code`, `CPS Performance Policy Level`, `Supportive Environment`,`Effective Leaders`,`Ambitious Instruction`, Safe, `School Community`,`Quality of Facilities`,
             `NWEA Math Growth Percentile All Grades`, `NWEA Reading Growth Percentile All Grades`,`NWEA Math Attainment Percentile All Grades`, `NWEA Reading Attainment Percentile All Grades`,`Suspensions Per 100 students 2013`,
             `Student Attendance Percentage 2013`,`Grade 3-8 On-Track Percentage 2013`))
ChiData1
# Preparing Data for Regression Models
str(ChiData1)
ChiData1$`CPS Performance Policy Level`= as.factor(ChiData1$`CPS Performance Policy Level`)
ChiData1$`Supportive Environment`= as.factor(ChiData1$`Supportive Environment`)
ChiData1$`Effective Leaders` = as.factor(ChiData1$`Effective Leaders`)
ChiData1$`Ambitious Instruction`= as.factor(ChiData1$`Ambitious Instruction`)
ChiData1$Safe= as.factor(ChiData1$Safe)
ChiData1$`School Community`= as.factor(ChiData1$`School Community`)
ChiData1$`Quality of Facilities`= as.factor(ChiData1$`Quality of Facilities`)
ChiData1$`CPS Performance Policy Level`= as.numeric(ChiData1$`CPS Performance Policy Level`)
str(ChiData1)
ChiDataR <- NaRV.omit(ChiData1)
summary(ChiDataR)
str(ChiDataR)
# Backwards Stepwise Regression Model
FitAll = lm(`CPS Performance Policy Level` ~ ., data = ChiDataR)
summary(FitAll)
step(FitAll, direction = "backward")
fitsome = lm(`CPS Performance Policy Level` ~ `ZIP Code` + `Supportive Environment` + 
               `NWEA Math Growth Percentile All Grades` + `NWEA Math Attainment Percentile All Grades` + 
               `NWEA Reading Attainment Percentile All Grades` + `Student Attendance Percentage 2013`, 
             data = ChiDataR)
summary(fitsome)

# Forward Stepwise Regression Model
fitstart = lm(`CPS Performance Policy Level` ~ 1, data = ChiDataR)
summary(fitstart)

step(fitstart, direction = 'forward', scope = (formula(FitAll)))
fitsome2 = lm(formula = `CPS Performance Policy Level` ~ `NWEA Math Attainment Percentile All Grades` + 
                `Student Attendance Percentage 2013` + `NWEA Reading Growth Percentile All Grades` + 
                `ZIP Code` + `Supportive Environment` + `NWEA Reading Attainment Percentile All Grades` + 
                `NWEA Math Growth Percentile All Grades`, data = ChiDataR)
summary(fitsome2)
 

