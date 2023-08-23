***********************************************************************************************************************.
*Sex differences in the secular change in waist circumference relative to body mass index in the Americas and England. 
*Results from five national health examination surveys 1997-2020
*Luz M Sánchez-Romero, Janine Sagaceta, Álvaro Passi, Antonio Bernabé-Ortiz, Shaun Scholes 
************************************************************************************************************************.


use "S:\FPHS_EPH_HSE_Shared\ESARU\Chile\Chile_Survey_Data_v2.dta", clear
gen sex=0
replace sex=2 if gender=="Female"
replace sex=1 if gender=="Male"
rename height_cm htval
rename weight_kg wtval

keep if bmi>0
keep if inrange(bmi,10,58)
keep if inrange(htval,130,200)

generate agegroup=0
replace agegroup=1 if inrange(age,25,29)
replace agegroup=2 if inrange(age,30,34)
replace agegroup=3 if inrange(age,35,39)
replace agegroup=4 if inrange(age,40,44)
replace agegroup=5 if inrange(age,45,49)
replace agegroup=6 if inrange(age,50,54)
replace agegroup=7 if inrange(age,55,59)
replace agegroup=8 if inrange(age,60,64)

gen BMIclass=.
label define BMIclass 1 "Underweight" 2 "Normal" 3 "Overweight" 4 "ObeseI"  5 "ObeseII" 6 "ObeseIII", replace

replace BMIclass=1 if (bmi<18.50 & bmi!=.)
replace BMIclass=2 if (bmi>=18.50 & bmi<25.00)
replace BMIclass=3 if (bmi>=25.00 & bmi<30.00)
replace BMIclass=4 if (bmi>=30.00 & bmi<35.00)
replace BMIclass=5 if (bmi>=35.00 & bmi<40.00)
replace BMIclass=6 if (bmi>=40.00 & bmi!=.)
label define BMIclasslbl 1 "Underweight" 2 "Normal-weight" 3 "Overweight" 4 "ObeseI" 5 "ObeseII"  6 "ObeseIII"
label values BMIclass BMIclasslbl
tab1 BMIclass

gen BMIclass5=.
replace BMIclass5=1 if (bmi<18.50 & bmi!=.)
replace BMIclass5=2 if (bmi>=18.50 & bmi<25.00)
replace BMIclass5=3 if (bmi>=25.00 & bmi<30.00)
replace BMIclass5=4 if (bmi>=30.00 & bmi<35.00)
replace BMIclass5=5 if (bmi>=35.00 & bmi!=.)
label define BMIclass5lbl 1 "Underweight" 2 "Normal-weight" 3 "Overweight" 4 "ObeseI" 5 "ObeseII/III" 
label values BMIclass5 BMIclass5lbl
tab1 BMIclass5



generate overwt=0
generate obese=0
replace overwt=1 if inrange(BMIclass,3,6)
replace obese=1 if inrange(BMIclass,4,6)

*===============================================.
*Central obesity.
*WC ≥ 88 cm for women and WC ≥ 102 cm for men.
*===============================================.

summ wstval
replace wstval=. if wstval!=. & (wstval<50|wstval>200)

generate raisedWC=.
replace raisedWC=0 if inrange(wstval,0,101.99) & (sex==1 & wstval!=.)
replace raisedWC=1 if (wstval>=102) & (sex==1 & wstval!=.)
replace raisedWC=0 if inrange(wstval,0,87.99) & (sex==2 & wstval!=.)
replace raisedWC=1 if (wstval>=88) & (sex==2 & wstval!=.)
bysort raisedWC: summ wstval if sex==1
bysort raisedWC: summ wstval if sex==2

*drop if (a==1)            /* pregnant  */

*=========================================.
*age 25-64.
*ALL analyses exclude outliers for BMI.
*=========================================.

bysort ens: summ age 
tab1 ens
tab ens sex, row                /* N=8,824 for BMI */ 

preserve
keep if wstval!=.
bysort ens: summ age 
tab ens sex , row          /* N=8,794 for BMI & WC */
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

svyset [pweight=fexp],psu(psu) strata(strata)
recode strata (20174=20173)

*=============================.
*Means by sex & year
*==============================.

svy:mean htval,stdize(agegroup) stdweight(std_weight) over(sex ens) 
lincom _b[c.htval@1bn.sex#3.ens] - _b[c.htval@1bn.sex#1.ens] /* Men */
lincom _b[c.htval@2.sex#3.ens] - _b[c.htval@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.htval@2.sex#3.ens] - _b[c.htval@2.sex#1.ens])-(_b[c.htval@1bn.sex#3.ens] - _b[c.htval@1bn.sex#1.ens])

svy:mean wtval,stdize(agegroup) stdweight(std_weight) over(sex ens)
lincom _b[c.wtval@1bn.sex#3.ens] - _b[c.wtval@1bn.sex#1.ens] /* Men */
lincom _b[c.wtval@2.sex#3.ens] - _b[c.wtval@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.wtval@2.sex#3.ens] - _b[c.wtval@2.sex#1.ens])-(_b[c.wtval@1bn.sex#3.ens] - _b[c.wtval@1bn.sex#1.ens])

svy:mean bmi,stdize(agegroup) stdweight(std_weight) over(sex ens) 
lincom _b[c.bmi@1bn.sex#3.ens] - _b[c.bmi@1bn.sex#1.ens] /* Men */
lincom _b[c.bmi@2.sex#3.ens] - _b[c.bmi@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.bmi@2.sex#3.ens] - _b[c.bmi@2.sex#1.ens])-(_b[c.bmi@1bn.sex#3.ens] - _b[c.bmi@1bn.sex#1.ens])

*==========================================================.
*BMI status (6 categories) by sex & year.
*==========================================================.

generate m = sex==1 
generate f = sex==2 

svy,subpop(m): tab BMIclass5 ens, stdize(agegroup) stdweight(std_weight) col per format(%3.1f)  /* Men*/
svy,subpop(f): tab BMIclass5 ens, stdize(agegroup) stdweight(std_weight) col per format(%3.1f) /* Women*/

*Overwt, inc. obesity.

svy:mean overwt,stdize(agegroup) stdweight(std_weight) over(sex ens) 
lincom _b[c.overwt@1.sex#3.ens] - _b[c.overwt@1.sex#1.ens] /* Men */
lincom _b[c.overwt@2.sex#3.ens] - _b[c.overwt@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.overwt@2.sex#3.ens] - _b[c.overwt@2.sex#1.ens])-(_b[c.overwt@1.sex#3.ens] - _b[c.overwt@1.sex#1.ens])

*obesity.

svy:mean obese,stdize(agegroup) stdweight(std_weight) over(sex ens) 
lincom _b[c.obese@1.sex#3.ens] - _b[c.obese@1.sex#1.ens] /* Men */
lincom _b[c.obese@2.sex#3.ens] - _b[c.obese@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.obese@2.sex#3.ens] - _b[c.obese@2.sex#1.ens])-(_b[c.obese@1.sex#3.ens] - _b[c.obese@1.sex#1.ens])

*========================.
*Mean WC (n=8794).
*=======================.

generate nonmissWC = inlist(raisedWC,0,1)
tab nonmissWC sex
tab nonmissWC sex if ens==1,row
tab nonmissWC sex if ens==3,row

svy,subpop(nonmissWC):mean wstval,stdize(agegroup) stdweight(std_weight) over(sex ens)
lincom _b[c.wstval@1bn.sex#3.ens] - _b[c.wstval@1bn.sex#1.ens] /* Men */
lincom _b[c.wstval@2.sex#3.ens] - _b[c.wstval@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.wstval@2.sex#3.ens] - _b[c.wstval@2.sex#1.ens])-(_b[c.wstval@1bn.sex#3.ens] - _b[c.wstval@1bn.sex#1.ens])

*=========================.
*Central obesity.
*==========================.

svy,subpop(nonmissWC):mean raisedWC,stdize(agegroup) stdweight(std_weight) over(sex ens) 
lincom _b[c.raisedWC@1bn.sex#3.ens] - _b[c.raisedWC@1bn.sex#1.ens] /* Men */
lincom _b[c.raisedWC@2.sex#3.ens] - _b[c.raisedWC@2.sex#1.ens]     /* Women */
*Women vs men
lincom (_b[c.raisedWC@2.sex#3.ens] - _b[c.raisedWC@2.sex#1.ens])-(_b[c.raisedWC@1bn.sex#3.ens] - _b[c.raisedWC@1bn.sex#1.ens])


**********************
*Regression analysis
**********************

bysort ens: summ age

generate age_c = (age-25)
generate age_csq = (age_c^2)
generate bmi_c = (bmi-25)
generate bmi_csq = (bmi_c^2)

*============================================.
*Analysis 1.
*BMI.
*change (first and last survey year)
*Adjust for age and age-squared.
*allow change in xth quantile to vary by sex.
*============================================.

*BMI: 5th centile.
qreg bmi c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.05) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg bmi c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*BMI: 25th centile.
qreg bmi c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.25) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg bmi c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*BMI: 50th centile.
qreg bmi c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.50) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg bmi c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*BMI: 75th centile.
qreg bmi c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.75) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg bmi c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*BMI: 95th centile.
qreg bmi c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.95) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg bmi c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens


*============================================.
*Analysis 2.
*WC.
*Adjust for age and age-squared.
*allow change in xth quantile to vary by sex.
*============================================.

*WC: 5th centile.
qreg wstval c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.05) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg wstval c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*WC: 525th centile.
qreg wstval c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.25) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg wstval c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens


*WC: 50th centile.
qreg wstval c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.50) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg wstval c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*WC: 75th centile.
qreg wstval c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.75) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg wstval c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens

*WC: 95th centile.
qreg wstval c.age_c c.age_csq i.ens##i.sex [pweight=fexp], nolog quantile(0.95) wlsiter(40)
margins, at(ens=(1 3) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(ens=(1 3) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 3.ens
*difference in change (women vs men)
lincom 3.ens#2.sex
qui:qreg wstval c.age_c c.age_csq i.ens##ib2.sex [pweight=fexp], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens


*============================================================.
*Analysis 3.
*WC (outcome) and BMI (predictor).
*Adjust for age and age-squared.
*allow change in mean WC to vary by (continuous) BMI.
*Year as categorical: change between first and last.
*=========================================================.

svy:regress wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##i.sex c.bmi_csq##i.ens##i.sex, nolog 
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend        /*BMI = 25 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend      /*BMI = 30 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend     /*BMI = 35 */
*Men
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100
*difference in change (women vs men)
lincom 3.ens#2.sex                                                                  /*BMI = 25 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*5 + (3.ens#2.sex#c.bmi_csq)*25         /*BMI = 30 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*10 + (3.ens#2.sex#c.bmi_csq)*100       /*BMI = 35 */
qui:svy:regress wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##ib2.sex c.bmi_csq##i.ens##ib2.sex, nolog 
*change over time for women: P-value and 95% CI. 
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100


*============================================================.
*Analysis 4.
*WC (outcome) and BMI (predictor).
*Adjust for age and age-squared.
*allow change in xth quantile of WC to vary by (continuous) BMI.
*Year as categorical: change between first and last.
*=========================================================.

*5th centile.
qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##i.sex c.bmi_csq##i.ens##i.sex [pweight=fexp], nolog quantile(0.05) wlsiter(40)
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */
*Men
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100
*difference in change (women vs men)
lincom 3.ens#2.sex                                                                 /* BMI = 25 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*5 + (3.ens#2.sex#c.bmi_csq)*25        /* BMI = 30 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*10 + (3.ens#2.sex#c.bmi_csq)*100      /* BMI = 35 */
qui: qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##ib2.sex c.bmi_csq##i.ens##ib2.sex [pweight=fexp], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100

*25th centile.
qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##i.sex c.bmi_csq##i.ens##i.sex [pweight=fexp], nolog quantile(0.25) wlsiter(40)
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100
*difference in change (women vs men)
lincom 3.ens#2.sex                                                                 /* BMI = 25 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*5 + (3.ens#2.sex#c.bmi_csq)*25        /* BMI = 30 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*10 + (3.ens#2.sex#c.bmi_csq)*100      /* BMI = 35 */
qui: qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##ib2.sex c.bmi_csq##i.ens##ib2.sex [pweight=fexp], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100

*50th centile.
qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##i.sex c.bmi_csq##i.ens##i.sex [pweight=fexp], nolog quantile(0.50) wlsiter(40)
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */
*Men
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100
*difference in change (women vs men)
lincom 3.ens#2.sex                                                                 /* BMI = 25 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*5 + (3.ens#2.sex#c.bmi_csq)*25        /* BMI = 30 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*10 + (3.ens#2.sex#c.bmi_csq)*100      /* BMI = 35 */
qui: qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##ib2.sex c.bmi_csq##i.ens##ib2.sex [pweight=fexp], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100


*75th centile.
qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##i.sex c.bmi_csq##i.ens##i.sex [pweight=fexp], nolog quantile(0.75) wlsiter(40)
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100
*difference in change (women vs men)
lincom 3.ens#2.sex                                                                 /* BMI = 25 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*5 + (3.ens#2.sex#c.bmi_csq)*25        /* BMI = 30 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*10 + (3.ens#2.sex#c.bmi_csq)*100      /* BMI = 35 */
qui: qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##ib2.sex c.bmi_csq##i.ens##ib2.sex [pweight=fexp], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100


*95th centile.

qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##i.sex c.bmi_csq##i.ens##i.sex [pweight=fexp], nolog quantile(0.95) wlsiter(40)
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(ens=(1 3) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */

*Men
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100
*difference in change (women vs men)
lincom 3.ens#2.sex                                                                 /* BMI = 25 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*5 + (3.ens#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (3.ens#2.sex) + (3.ens#2.sex#c.bmi_c)*10 + (3.ens#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg wstval bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.ens##ib2.sex c.bmi_csq##i.ens##ib2.sex [pweight=fexp], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 3.ens
lincom (3.ens) + (3.ens#c.bmi_c)*5  + (3.ens#c.bmi_csq)*25
lincom (3.ens) + (3.ens#c.bmi_c)*10  + (3.ens#c.bmi_csq)*100































 
