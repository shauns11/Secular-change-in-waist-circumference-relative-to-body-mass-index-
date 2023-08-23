***********************************************************************************************************************.
*Sex differences in the secular change in waist circumference relative to body mass index in the Americas and England. 
*Results from five national health examination surveys 1997-2020
*Luz M Sánchez-Romero, Janine Sagaceta, Álvaro Passi, Antonio Bernabé-Ortiz, Shaun Scholes 
************************************************************************************************************************.

*HSE analysis.
*Uses dataset created in SPSS syntax file: HSE dataset BMI & Waist.SPS

use "C:\Users\rmjdshc\OneDrive - University College London\Temp\HSEBMI97-18.dta", clear
count
renvars, lower
generate m = sex==1 
generate f = sex==2 

replace wstval=. if year1=="1999"  // EM boost


*use age when have continuous variable: use mid-point in later years (2015 onwards).
gen age_f= inlist(year2,2015,2016,2017,2018)

generate age2=age if age_f==0
replace age2=27 if (age2564g5==1) & age_f==1
replace age2=32 if (age2564g5==2) & age_f==1
replace age2=35 if (age2564g5==3) & age_f==1
replace age2=42 if (age2564g5==4) & age_f==1
replace age2=47 if (age2564g5==5) & age_f==1
replace age2=52 if (age2564g5==6) & age_f==1
replace age2=57 if (age2564g5==7) & age_f==1
replace age2=62 if (age2564g5==8) & age_f==1

generate age_c = (age2-25)
generate age_csq = (age_c^2)
generate bmi_c = (bmival-25)
generate bmi_csq = (bmi_c^2)

keep if bmival>0
count

*age 25-64.
*ALL analyses of BMI exclude outliers for BMI and height.
*Keep missing/out-of-range WC in dataset at this stage.

drop if (a==1)                            /* pregnant  */
keep if inrange(bmival,10,58)
keep if inrange(htval,130,200)

*Annual variable.
generate yearc=0
replace yearc=0 if year2==1997
replace yearc=1 if year2==1998
replace yearc=2 if year2==1999
replace yearc=3 if year2==2000
replace yearc=4 if year2==2001
replace yearc=5 if year2==2002
replace yearc=6 if year2==2003
replace yearc=7 if year2==2004
replace yearc=8 if year2==2005
replace yearc=9 if year2==2006
replace yearc=10 if year2==2007
replace yearc=11 if year2==2008
replace yearc=12 if year2==2009
replace yearc=13 if year2==2010
replace yearc=14 if year2==2011
replace yearc=15 if year2==2012
replace yearc=16 if year2==2013
replace yearc=17 if year2==2014
replace yearc=18 if year2==2015
replace yearc=19 if year2==2016
replace yearc=20 if year2==2017
replace yearc=21 if year2==2018




generate agegroup=0
replace agegroup=1 if age2564g5==1 
replace agegroup=2 if age2564g5==2
replace agegroup=3 if age2564g5==3
replace agegroup=4 if age2564g5==4
replace agegroup=5 if age2564g5==5
replace agegroup=6 if age2564g5==6
replace agegroup=7 if age2564g5==7
replace agegroup=8 if age2564g5==8

gen BMIclass=.
label define BMIclass 1 "Underweight" 2 "Normal" 3 "Overweight" 4 "ObeseI"  5 "ObeseII" 6 "ObeseIII", replace

replace BMIclass=1 if (bmival<18.50 & bmival!=.)
replace BMIclass=2 if (bmival>=18.50 & bmival<25.00)
replace BMIclass=3 if (bmival>=25.00 & bmival<30.00)
replace BMIclass=4 if (bmival>=30.00 & bmival<35.00)
replace BMIclass=5 if (bmival>=35.00 & bmival<40.00)
replace BMIclass=6 if (bmival>=40.00 & bmival!=.)
label define BMIclasslbl 1 "Underweight" 2 "Normal-weight" 3 "Overweight" 4 "ObeseI" 5 "ObeseII"  6 "ObeseIII"
label values BMIclass BMIclasslbl

gen BMIclass5=.
replace BMIclass5=1 if (bmival<18.50 & bmival!=.)
replace BMIclass5=2 if (bmival>=18.50 & bmival<25.00)
replace BMIclass5=3 if (bmival>=25.00 & bmival<30.00)
replace BMIclass5=4 if (bmival>=30.00 & bmival<35.00)
replace BMIclass5=5 if (bmival>=35.00 & bmival!=.)

label define BMIclass5lbl 1 "Underweight" 2 "Normal-weight" 3 "Overweight" 4 "ObeseI" 5 "ObeseII/III"  
label values BMIclass5 BMIclass5lbl


gen overwt= inrange(BMIclass,3,6)
gen obese= inrange(BMIclass,4,6)

*******************************************************
*Central obesity.
*WC ≥ 88 cm for women and WC ≥ 102 cm for men.
*set to missing is <50, >200.
*******************************************************

summ wstval
mvdecode wstval, mv(-1)
replace wstval=. if wstval!=. & (wstval<50|wstval>200)

generate raisedWC=.
replace raisedWC=0 if (sex==1) & inrange(wstval,0,101.99) 
replace raisedWC=1 if (sex==1) & (wstval>=102 & wstval!=.)
replace raisedWC=0 if (sex==2) & inrange(wstval,0,87.99) 
replace raisedWC=1 if (sex==2) & (wstval>=88 & wstval!=.)
bysort raisedWC: summ wstval if sex==1 & !missing(wstval)
bysort raisedWC: summ wstval if sex==2 & !missing(wstval)

    

preserve
keep if wstval!=. 
bysort yearc: summ age2
tab year2 sex     
restore

*age-standardised (2000 US Census Population).
*Klein.

generate std_weight=0
replace std_weight=0.1240 if agegroup==1
replace std_weight=0.1366 if agegroup==2
replace std_weight=0.1552 if agegroup==3
replace std_weight=0.1573 if agegroup==4
replace std_weight=0.1386 if agegroup==5
replace std_weight=0.1205 if agegroup==6
replace std_weight=0.0931 if agegroup==7
replace std_weight=0.0746 if agegroup==8

svyset [pweight=wt_int],psu(point1)

***************************************************************************************************************************************************
*Table S2A. Sample characteristics (aged 25-64y) and anthropometric outcomes (height, weight, BMI and BMI status) by first and last survey periods 
****************************************************************************************************************************************************

*age and sex are unweighted.
bysort yearc: summ age2
tab yearc sex, row   

***********
*height.
***********

svy:mean htval,stdize(agegroup) stdweight(std_weight) over(sex yearc)
lincom _b[c.htval@21.yearc#1.sex] - _b[c.htval@0.yearc#1.sex]      /* Men */
lincom _b[c.htval@21.yearc#2.sex] - _b[c.htval@0.yearc#2.sex]      /* Women */
*Women vs men
lincom (_b[c.htval@21.yearc#2.sex] - _b[c.htval@0.yearc#2.sex]) - (_b[c.htval@21.yearc#1.sex] - _b[c.htval@0.yearc#1.sex])

***********
*weight.
***********

svy:mean wtval,stdize(agegroup) stdweight(std_weight) over(sex yearc)
lincom _b[c.wtval@21.yearc#1.sex] - _b[c.wtval@0.yearc#1.sex]      /* Men */
lincom _b[c.wtval@21.yearc#2.sex] - _b[c.wtval@0.yearc#2.sex]      /* Women */
*Women vs men
lincom (_b[c.wtval@21.yearc#2.sex] - _b[c.wtval@0.yearc#2.sex]) - (_b[c.wtval@21.yearc#1.sex] - _b[c.wtval@0.yearc#1.sex])

***********
*BMI.
***********

svy:mean bmival,stdize(agegroup) stdweight(std_weight) over(sex yearc)
lincom _b[c.bmival@21.yearc#1.sex] - _b[c.bmival@0.yearc#1.sex]       /* Men */
lincom _b[c.bmival@21.yearc#2.sex] - _b[c.bmival@0.yearc#2.sex]      /* Women */
*Women vs men
lincom (_b[c.bmival@21.yearc#2.sex] - _b[c.bmival@0.yearc#2.sex]) - (_b[c.bmival@21.yearc#1.sex] - _b[c.bmival@0.yearc#1.sex])

*******************************************
*BMI status (5 categories) 
********************************************

svy,subpop(m): tab BMIclass5 yearc, stdize(agegroup) stdweight(std_weight) col per format(%3.1f) /* Men*/
svy,subpop(f): tab BMIclass5 yearc, stdize(agegroup) stdweight(std_weight) col per format(%3.1f)  /* Women*/

*Overwt incl. obesity.
svy:mean overwt,stdize(agegroup) stdweight(std_weight) over(sex yearc) 
lincom _b[c.overwt@21.yearc#1.sex] - _b[c.overwt@0.yearc#1.sex]            /* Men */
lincom _b[c.overwt@21.yearc#2.sex] - _b[c.overwt@0.yearc#2.sex]            /* Women */
*Women vs men
lincom (_b[c.overwt@21.yearc#2.sex] - _b[c.overwt@0.yearc#2.sex]) - (_b[c.overwt@21.yearc#1.sex] - _b[c.overwt@0.yearc#1.sex])

*Obesity.
svy:mean obese,stdize(agegroup) stdweight(std_weight) over(sex yearc)
lincom _b[c.obese@21.yearc#1.sex] - _b[c.obese@0.yearc#1.sex]              /* Men */
lincom _b[c.obese@21.yearc#2.sex] - _b[c.obese@0.yearc#2.sex]              /* Women */
*Women vs men
lincom (_b[c.obese@21.yearc#2.sex] - _b[c.obese@0.yearc#2.sex]) - (_b[c.obese@21.yearc#1.sex] - _b[c.obese@0.yearc#1.sex])


********************************************************************************************************************************************************************************
*Table S2B. Sample characteristics (aged 25-64y) and anthropometric outcomes (waist circumference and abdominal obesity) by first and last survey periods 
********************************************************************************************************************************************************************************

*age and sex are unweighted.

preserve
keep if inlist(raisedWC,0,1) 
bysort yearc: summ age2
tab yearc sex, row   
restore

**********************************************
*Mean WC.
*excludes outliers for BMI, height and WC.
**********************************************

svyset, clear
svyset [pweight=wt_nurse],psu(point1)
*no WC in 2000/2004 and few in 1999.
*1999 have to be excluded




generate nonmissWC = inlist(raisedWC,0,1) 
svy,subpop(nonmissWC):mean wstval,stdize(agegroup) stdweight(std_weight) over(sex yearc) 
lincom _b[c.wstval@21.yearc#1.sex] - _b[c.wstval@0.yearc#1.sex]      /* Men */
lincom _b[c.wstval@21.yearc#2.sex] - _b[c.wstval@0.yearc#2.sex]      /* Women */
*Women vs men
lincom (_b[c.wstval@21.yearc#2.sex] - _b[c.wstval@0.yearc#2.sex]) - (_b[c.wstval@21.yearc#1.sex] - _b[c.wstval@0.yearc#1.sex])

*Abdominal obesity.
svy,subpop(nonmissWC):mean raisedWC,stdize(agegroup) stdweight(std_weight) over(sex yearc)
lincom _b[c.raisedWC@21.yearc#1.sex] - _b[c.raisedWC@0.yearc#1.sex]       /* Men */
lincom _b[c.raisedWC@21.yearc#2.sex] - _b[c.raisedWC@0.yearc#2.sex]      /* Women */
*Women vs men
lincom (_b[c.raisedWC@21.yearc#2.sex] - _b[c.raisedWC@0.yearc#2.sex]) - (_b[c.raisedWC@21.yearc#1.sex] - _b[c.raisedWC@0.yearc#1.sex])


***********************************************************************************************************************************************
*Table 1. Predicted values of BMI (first and last) and difference (final minus first survey period) across centiles of BMI by sex and country
*Adjust for age and age-squared.
*Allow (ABSOLUTE) change in xth quantile to vary by sex.
*Year is annual: but entered as categorical
************************************************************************************************************************************************

*BMI: 5th centile.
qreg bmival c.age_c c.age_csq i.yearc##i.sex [pweight=wt_int], nolog quantile(0.05) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg bmival c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_int], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*BMI: 25th centile.
qreg bmival c.age_c c.age_csq i.yearc##i.sex [pweight=wt_int], nolog quantile(0.25) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg bmival c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_int], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*BMI: 50th centile.
qreg bmival c.age_c c.age_csq i.yearc##i.sex [pweight=wt_int], nolog quantile(0.50) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg bmival c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_int], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 21.yearc


*BMI: 75th centile.
qreg bmival c.age_c c.age_csq i.yearc##i.sex [pweight=wt_int], nolog quantile(0.75) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg bmival c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_int], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*BMI: 95th centile.
qreg bmival c.age_c c.age_csq i.yearc##i.sex [pweight=wt_int], nolog quantile(0.95) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg bmival c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_int], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*============================================.
*Table 2. Predicted values of waist circumference (first and last) and difference (final minus first survey period) across centiles of waist circumference by sex and country
*WC.
*Adjust for age and age-squared.
*allow change in xth quantile to vary by sex.
*NURSE_WT.
*============================================.

*WC: 5th centile.
qreg wstval c.age_c c.age_csq i.yearc##i.sex [pweight=wt_nurse], nolog quantile(0.05) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg wstval c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_nurse], quantile(0.05) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 21.yearc



*WC: 25th centile.
qreg wstval c.age_c c.age_csq i.yearc##i.sex [pweight=wt_nurse], nolog quantile(0.25) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg wstval c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_nurse], quantile(0.25) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*WC: 50th centile.
qreg wstval c.age_c c.age_csq i.yearc##i.sex [pweight=wt_nurse], nolog quantile(0.50) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg wstval c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_nurse], quantile(0.50) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*WC: 75th centile.
qreg wstval c.age_c c.age_csq i.yearc##i.sex [pweight=wt_nurse], nolog quantile(0.75) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg wstval c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_nurse], quantile(0.75) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*WC: 95th centile.
qreg wstval c.age_c c.age_csq i.yearc##i.sex [pweight=wt_nurse], nolog quantile(0.95) wlsiter(40)
margins, at(yearc=(0 21) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(yearc=(0 21) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 21.yearc
*difference in change (women vs men)
lincom 21.yearc#2.sex
qui:qreg wstval c.age_c c.age_csq i.yearc##ib2.sex [pweight=wt_nurse], quantile(0.95) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 21.yearc

*============================================================.
*Analysis 3A (mean).
*WC (outcome) and BMI (predictor).
*Adjust for age and age-squared.
*allow change in mean WC to vary by (continuous) BMI.
*Year as categorical: change between first and last.
*=========================================================.


svy:regress wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##i.sex c.bmi_csq##i.yearc##i.sex, nolog 
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend        /*BMI = 25 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend      /*BMI = 30 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend     /*BMI = 35 */

*Men
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5  + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10  + (21.yearc#c.bmi_csq)*100
*difference in change (women vs men)
lincom 21.yearc#2.sex                                                                         /*BMI = 25 */
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*5 + (21.yearc#2.sex#c.bmi_csq)*25         /*BMI = 30 */
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*10 + (21.yearc#2.sex#c.bmi_csq)*100       /*BMI = 35 */

qui: svy:regress wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##ib2.sex c.bmi_csq##i.yearc##ib2.sex, nolog 
*change over time for women: P-value and 95% CI. 
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5  + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10  + (21.yearc#c.bmi_csq)*100

*============================================================.
*Analysis 3B.
*WC and BMI.
*Adjust for age and age-squared.
*allow change in xth quantile of WC to vary by BMI.
*N=89,266
*Year as categorical (but annual)
*=========================================================.

set seed 472195

*5th
qui: bsqreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##i.sex c.bmi_csq##i.yearc##i.sex, quantile(0.05) wlsiter(40)
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5 + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10 + (21.yearc#c.bmi_csq)*100
*difference in change (women vs men)
lincom 21.yearc#2.sex
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*5 + (21.yearc#2.sex#c.bmi_csq)*25
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*10 + (21.yearc#2.sex#c.bmi_csq)*100
*Women
lincom  21.yearc + 21.yearc#2.sex
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*5) + ((21.yearc#2.sex#c.bmi_c)*5) + ((21.yearc#c.bmi_csq)*25) + ((21.yearc#2.sex#c.bmi_csq)*25)
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*10) + ((21.yearc#2.sex#c.bmi_c)*10) + ((21.yearc#c.bmi_csq)*100) + ((21.yearc#2.sex#c.bmi_csq)*100)

*25th
qui: bsqreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##i.sex c.bmi_csq##i.yearc##i.sex, quantile(0.25) wlsiter(40)
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */
*Men
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5 + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10 + (21.yearc#c.bmi_csq)*100
*difference in change (women vs men)
lincom 21.yearc#2.sex
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*5 + (21.yearc#2.sex#c.bmi_csq)*25
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*10 + (21.yearc#2.sex#c.bmi_csq)*100
*Women
lincom  21.yearc + 21.yearc#2.sex
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*5) + ((21.yearc#2.sex#c.bmi_c)*5) + ((21.yearc#c.bmi_csq)*25) + ((21.yearc#2.sex#c.bmi_csq)*25)
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*10) + ((21.yearc#2.sex#c.bmi_c)*10) + ((21.yearc#c.bmi_csq)*100) + ((21.yearc#2.sex#c.bmi_csq)*100)


*50th
qui: bsqreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##i.sex c.bmi_csq##i.yearc##i.sex, quantile(0.50) wlsiter(40)
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5 + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10 + (21.yearc#c.bmi_csq)*100
*difference in change (women vs men)
lincom 21.yearc#2.sex
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*5 + (21.yearc#2.sex#c.bmi_csq)*25
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*10 + (21.yearc#2.sex#c.bmi_csq)*100
*Women
lincom  21.yearc + 21.yearc#2.sex
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*5) + ((21.yearc#2.sex#c.bmi_c)*5) + ((21.yearc#c.bmi_csq)*25) + ((21.yearc#2.sex#c.bmi_csq)*25)
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*10) + ((21.yearc#2.sex#c.bmi_c)*10) + ((21.yearc#c.bmi_csq)*100) + ((21.yearc#2.sex#c.bmi_csq)*100)

*75th
qui: bsqreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##i.sex c.bmi_csq##i.yearc##i.sex, quantile(0.75) wlsiter(40)
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5 + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10 + (21.yearc#c.bmi_csq)*100
*difference in change (women vs men)
lincom 21.yearc#2.sex
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*5 + (21.yearc#2.sex#c.bmi_csq)*25
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*10 + (21.yearc#2.sex#c.bmi_csq)*100
*Women
lincom  21.yearc + 21.yearc#2.sex
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*5) + ((21.yearc#2.sex#c.bmi_c)*5) + ((21.yearc#c.bmi_csq)*25) + ((21.yearc#2.sex#c.bmi_csq)*25)
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*10) + ((21.yearc#2.sex#c.bmi_c)*10) + ((21.yearc#c.bmi_csq)*100) + ((21.yearc#2.sex#c.bmi_csq)*100)

*95th
qui: bsqreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.yearc##i.sex c.bmi_csq##i.yearc##i.sex, quantile(0.95) wlsiter(40)
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(yearc=(0 21) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 21.yearc
lincom (21.yearc) + (21.yearc#c.bmi_c)*5 + (21.yearc#c.bmi_csq)*25
lincom (21.yearc) + (21.yearc#c.bmi_c)*10 + (21.yearc#c.bmi_csq)*100
*difference in change (women vs men)
lincom 21.yearc#2.sex
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*5 + (21.yearc#2.sex#c.bmi_csq)*25
lincom (21.yearc#2.sex) + (21.yearc#2.sex#c.bmi_c)*10 + (21.yearc#2.sex#c.bmi_csq)*100
*Women
lincom  21.yearc + 21.yearc#2.sex
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*5) + ((21.yearc#2.sex#c.bmi_c)*5) + ((21.yearc#c.bmi_csq)*25) + ((21.yearc#2.sex#c.bmi_csq)*25)
lincom (21.yearc + 21.yearc#2.sex) + ((21.yearc#c.bmi_c)*10) + ((21.yearc#2.sex#c.bmi_c)*10) + ((21.yearc#c.bmi_csq)*100) + ((21.yearc#2.sex#c.bmi_csq)*100)
















