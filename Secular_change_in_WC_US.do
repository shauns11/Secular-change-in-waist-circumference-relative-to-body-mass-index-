***********************************************************************************************************************.
*Sex differences in the secular change in waist circumference relative to body mass index in the Americas and England. 
*Results from five national health examination surveys 1997-2020
*Luz M Sánchez-Romero, Janine Sagaceta, Álvaro Passi, Antonio Bernabé-Ortiz, Shaun Scholes 
************************************************************************************************************************.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count
tab1 ridreth1

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American"  3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age

*MEC: 18+.

keep if ridstatr==2
keep if (age>=18)
generate year=1
keep seqn year sex age sddsrvyr wtmec2yr wtmec4yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*==========================.
*BMI & waist (1999-2000).
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX.XPT", clear
sort seqn
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr wtmec4yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_1.dta", replace

*==========================.
* Demographics (2001-02).
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_B.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
keep if ridstatr==2
keep if (age>=18)

generate year=2
count
keep seqn year sex age wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC sddsrvyr wtmec4yr
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*==========================.
*BMI & waist (2001-02).
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_B.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age wtmec2yr sddsrvyr wtmec4yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_2.dta", replace

*==========================.
*Demographics (2003-04).
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_C.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age

keep if ridstatr==2
keep if (age>=18)
generate year=3
count
keep seqn year sex age wtmec2yr sddsrvyr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*======================.
*BMI & waist (2003-04).
*=======================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_C.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age wtmec2yr sddsrvyr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_3.dta", replace

*======================.
*Demographics: 2005-06.
*======================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_D.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
tab1 sex
summ age
keep if ridstatr==2
keep if (age>=18)
generate year=4
count
keep seqn year sex age wtmec2yr sddsrvyr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*=======================.
* BMI & waist (2005-06).
*=======================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_D.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age wtmec2yr sddsrvyr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_4.dta", replace

*=======================.
*Demographics: 2007-08.
*=======================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_E.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age

keep if ridstatr==2
keep if (age>=18)
generate year=5
count
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*======================.
*BMI & waist (2007-08).
*=======================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_E.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_5.dta", replace

*==========================.
*Demographics: 2009-10.
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_F.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
keep if ridstatr==2
keep if (age>=18)
generate year=6
count
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*=============================.
*BMI & waist (2009-10).
*=============================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_F.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_6.dta", replace

*==========================.
*Demographics: 2011-12.
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_G.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
keep if ridstatr==2
keep if (age>=18)

generate year=7
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*=========================.
*BMI & waist (2011-12).
*==========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_G.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_7.dta", replace

*=============================.
*Demographics: 2013-14.
*=============================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_H.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
keep if ridstatr==2
keep if (age>=18)
generate year=8
count
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*========================.
*BMI & waist (2013-14).
*========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_H.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_8.dta", replace

*=======================================.
*Demographics: 2015-16.
*=======================================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_I.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
keep if ridstatr==2
keep if (age>=18)
generate year=9
count
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*=========================.
* BMI & waist (2015-16).
*=========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_I.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_9.dta", replace

*=======================================.
*Demographics: 2017-18.
*=======================================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\DEMO_J.XPT", clear
label variable seqn "Respondent sequence number"
sort seqn
count

generate ETHNIC = 0
replace ETHNIC = 2 if ridreth1==1
replace ETHNIC = 1 if ridreth1==3
replace ETHNIC = 3 if ridreth1==4
replace ETHNIC = 4 if ridreth1==2|ridreth1==5
tab1 ETHNIC

label define ethniclbl 1 "Non-Hispanic White" 2 "Mexican American" 3 "Non-Hispanic Black" 4 "Other race"
label values ETHNIC ethniclbl
tab1 ETHNIC

rename riagendr sex
rename ridageyr age
keep if ridstatr==2
keep if (age>=18)
generate year=10
count
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra ridexprg ETHNIC
sort seqn
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta", replace

*=========================.
* BMI & waist (2017-18).
*=========================.

import sasxport5 "C:\Users\rmjdshc\OneDrive - University College London\NHANES\BMX_J.XPT", clear
sort seqn
count
merge 1:1 seqn using "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.dta"
keep if _merge==3
drop _merge
sort seqn
keep seqn year sex age sddsrvyr wtmec2yr sdmvpsu sdmvstra bmxbmi bmxwaist bmxht bmxwt ridexprg ETHNIC
save "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_10.dta", replace

*==============================.
*Append NHANES datasets.
*==============================.

use "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_1.dta", clear
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_2.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_3.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_4.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_5.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_6.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_7.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_8.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_9.dta"
append using "C:\Users\rmjdshc\OneDrive - University College London\Temp\NHANES_10.dta"
drop year

drop if (ridexprg==1)

*=========================================.
*age 25-64.
*ALL analyses exclude outliers for BMI.
*=========================================.

keep if inrange(age,25,64) 
keep if inrange(bmxbmi,10,58)
keep if inrange(bmxht,130,200)
tab sddsrvyr

*4-yr cycles

generate year=-2
replace year=0 if inlist(sddsrvyr,1,2)
replace year=1 if inlist(sddsrvyr,3,4)
replace year=2 if inlist(sddsrvyr,5,6)
replace year=3 if inlist(sddsrvyr,7,8)
replace year=4 if inlist(sddsrvyr,9,10)

bysort year: summ age if ETHNIC==1
bysort year: summ age if ETHNIC==2
bysort year: summ age if ETHNIC==3

tab year sex                /* N=33,108 for BMI */ 
tab year sex if ETHNIC==1, row
tab year sex if ETHNIC==2, row
tab year sex if ETHNIC==3, row

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
gen BMIclass5=.
label define BMIclass 1 "Underweight" 2 "Normal" 3 "Overweight" 4 "ObeseI"  5 "ObeseII" 6 "ObeseIII", replace

replace BMIclass=1 if (bmxbmi<18.50 & bmxbmi!=.)
replace BMIclass=2 if (bmxbmi>=18.50 & bmxbmi<25.00)
replace BMIclass=3 if (bmxbmi>=25.00 & bmxbmi<30.00)
replace BMIclass=4 if (bmxbmi>=30.00 & bmxbmi<35.00)
replace BMIclass=5 if (bmxbmi>=35.00 & bmxbmi<40.00)
replace BMIclass=6 if (bmxbmi>=40.00 & bmxbmi!=.)
label define BMIclasslbl 1 "Underweight" 2 "Normal-weight" 3 "Overweight" 4 "ObeseI" 5 "ObeseII"  6 "ObeseIII"
label values BMIclass BMIclasslbl
tab1 BMIclass

replace BMIclass5=1 if (bmxbmi<18.50 & bmxbmi!=.)
replace BMIclass5=2 if (bmxbmi>=18.50 & bmxbmi<25.00)
replace BMIclass5=3 if (bmxbmi>=25.00 & bmxbmi<30.00)
replace BMIclass5=4 if (bmxbmi>=30.00 & bmxbmi<35.00)
replace BMIclass5=5 if (bmxbmi>=35.00 & bmxbmi!=.)
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

replace bmxwaist=. if bmxwaist!=. & (bmxwaist<50|bmxwaist>200)

generate raisedWC=.
replace raisedWC=0 if inrange(bmxwaist,0,101.9) & (sex==1 & bmxwaist!=.)
replace raisedWC=1 if (bmxwaist>=102) & (sex==1 & bmxwaist!=.)
replace raisedWC=0 if inrange(bmxwaist,0,87.9) & (sex==2 & bmxwaist!=.)
replace raisedWC=1 if (bmxwaist>=88) & (sex==2 & bmxwaist!=.)
bysort raisedWC: summ bmxwaist if sex==1
bysort raisedWC: summ bmxwaist if sex==2

*Valid BMI
foreach num of numlist 0 4 {
	tab ETHNIC sex if year==`num',row
}

*Valid BMI and WC.
preserve
keep if bmxwaist!=.
bysort year: summ age if ETHNIC==1
bysort year: summ age if ETHNIC==2
bysort year: summ age if ETHNIC==3
tab year sex           /* N=32,074 for BMI & WC */
foreach num of numlist 0 4 {
	tab ETHNIC sex if year==`num',row
}
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


*******************************
*analytical guidelines (p.26).
*******************************

replace wtmec4yr = (1/2) * wtmec2yr if inlist(sddsrvyr,3,4)
replace wtmec4yr = (1/2) * wtmec2yr if inlist(sddsrvyr,5,6)
replace wtmec4yr = (1/2) * wtmec2yr if inlist(sddsrvyr,7,8)
replace wtmec4yr = (1/2) * wtmec2yr if inlist(sddsrvyr,9,10)

svyset [pweight=wtmec4yr],psu(sdmvpsu) strata(sdmvstra)
 
svy:mean bmxht,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year) 
lincom _b[c.bmxht@1.sex#1.ETHNIC#4.year] - _b[c.bmxht@1.sex#1.ETHNIC#0.year] /* Men: NH-White */
lincom _b[c.bmxht@2.sex#1.ETHNIC#4.year] - _b[c.bmxht@2.sex#1.ETHNIC#0.year] /* Women: NH-White */
lincom _b[c.bmxht@1.sex#2.ETHNIC#4.year] - _b[c.bmxht@1.sex#2.ETHNIC#0.year] /* Men: MA */
lincom _b[c.bmxht@2.sex#2.ETHNIC#4.year] - _b[c.bmxht@2.sex#2.ETHNIC#0.year] /* Women: MA */
lincom _b[c.bmxht@1.sex#3.ETHNIC#4.year] - _b[c.bmxht@1.sex#3.ETHNIC#0.year] /* Men: NHB */
lincom _b[c.bmxht@2.sex#3.ETHNIC#4.year] - _b[c.bmxht@2.sex#3.ETHNIC#0.year] /* Women: NHB */
*Women vs men by ethnic group.
lincom (_b[c.bmxht@1.sex#1.ETHNIC#4.year] - _b[c.bmxht@1.sex#1.ETHNIC#0.year]) - (_b[c.bmxht@2.sex#1.ETHNIC#4.year] - _b[c.bmxht@2.sex#1.ETHNIC#0.year])
lincom (_b[c.bmxht@1.sex#2.ETHNIC#4.year] - _b[c.bmxht@1.sex#2.ETHNIC#0.year]) - (_b[c.bmxht@2.sex#2.ETHNIC#4.year] - _b[c.bmxht@2.sex#2.ETHNIC#0.year])
lincom (_b[c.bmxht@1.sex#3.ETHNIC#4.year] - _b[c.bmxht@1.sex#3.ETHNIC#0.year]) - (_b[c.bmxht@2.sex#3.ETHNIC#4.year] - _b[c.bmxht@2.sex#3.ETHNIC#0.year])

svy:mean bmxwt,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year) 
lincom _b[c.bmxwt@1.sex#1.ETHNIC#4.year] - _b[c.bmxwt@1.sex#1.ETHNIC#0.year] /* Men: NH-White */
lincom _b[c.bmxwt@2.sex#1.ETHNIC#4.year] - _b[c.bmxwt@2.sex#1.ETHNIC#0.year] /* Women: NH-White */
lincom _b[c.bmxwt@1.sex#2.ETHNIC#4.year] - _b[c.bmxwt@1.sex#2.ETHNIC#0.year] /* Men: MA */
lincom _b[c.bmxwt@2.sex#2.ETHNIC#4.year] - _b[c.bmxwt@2.sex#2.ETHNIC#0.year] /* Women: MA */
lincom _b[c.bmxwt@1.sex#3.ETHNIC#4.year] - _b[c.bmxwt@1.sex#3.ETHNIC#0.year] /* Men: NHB */
lincom _b[c.bmxwt@2.sex#3.ETHNIC#4.year] - _b[c.bmxwt@2.sex#3.ETHNIC#0.year] /* Women: NHB */
*Women vs men by ethnic group.
lincom (_b[c.bmxwt@1.sex#1.ETHNIC#4.year] - _b[c.bmxwt@1.sex#1.ETHNIC#0.year]) - (_b[c.bmxwt@2.sex#1.ETHNIC#4.year] - _b[c.bmxwt@2.sex#1.ETHNIC#0.year])
lincom (_b[c.bmxwt@1.sex#2.ETHNIC#4.year] - _b[c.bmxwt@1.sex#2.ETHNIC#0.year]) - (_b[c.bmxwt@2.sex#2.ETHNIC#4.year] - _b[c.bmxwt@2.sex#2.ETHNIC#0.year])
lincom (_b[c.bmxwt@1.sex#3.ETHNIC#4.year] - _b[c.bmxwt@1.sex#3.ETHNIC#0.year]) - (_b[c.bmxwt@2.sex#3.ETHNIC#4.year] - _b[c.bmxwt@2.sex#3.ETHNIC#0.year])

svy:mean bmxbmi,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year) 
lincom _b[c.bmxbmi@1.sex#1.ETHNIC#4.year] - _b[c.bmxbmi@1.sex#1.ETHNIC#0.year] /* Men: NH-White */
lincom _b[c.bmxbmi@2.sex#1.ETHNIC#4.year] - _b[c.bmxbmi@2.sex#1.ETHNIC#0.year] /* Women: NH-White */
lincom _b[c.bmxbmi@1.sex#2.ETHNIC#4.year] - _b[c.bmxbmi@1.sex#2.ETHNIC#0.year] /* Men: MA */
lincom _b[c.bmxbmi@2.sex#2.ETHNIC#4.year] - _b[c.bmxbmi@2.sex#2.ETHNIC#0.year] /* Women: MA */
lincom _b[c.bmxbmi@1.sex#3.ETHNIC#4.year] - _b[c.bmxbmi@1.sex#3.ETHNIC#0.year] /* Men: NHB */
lincom _b[c.bmxbmi@2.sex#3.ETHNIC#4.year] - _b[c.bmxbmi@2.sex#3.ETHNIC#0.year] /* Women: NHB */
*Women vs men by ethnic group.
lincom (_b[c.bmxbmi@1.sex#1.ETHNIC#4.year] - _b[c.bmxbmi@1.sex#1.ETHNIC#0.year]) - (_b[c.bmxbmi@2.sex#1.ETHNIC#4.year] - _b[c.bmxbmi@2.sex#1.ETHNIC#0.year])
lincom (_b[c.bmxbmi@1.sex#2.ETHNIC#4.year] - _b[c.bmxbmi@1.sex#2.ETHNIC#0.year]) - (_b[c.bmxbmi@2.sex#2.ETHNIC#4.year] - _b[c.bmxbmi@2.sex#2.ETHNIC#0.year])
lincom (_b[c.bmxbmi@1.sex#3.ETHNIC#4.year] - _b[c.bmxbmi@1.sex#3.ETHNIC#0.year]) - (_b[c.bmxbmi@2.sex#3.ETHNIC#4.year] - _b[c.bmxbmi@2.sex#3.ETHNIC#0.year])


*==========================================================.
*BMI status (6 categories) by sex, race/ethnicity & year.
*==========================================================.


generate m_NHWhite = sex==1 & ETHNIC==1
generate f_NHWhite = sex==2 & ETHNIC==1
generate m_MexAm = sex==1 & ETHNIC==2
generate f_MexAm = sex==2 & ETHNIC==2
generate m_NHBlack = sex==1 & ETHNIC==3
generate f_NHBlack = sex==2 & ETHNIC==3

svy,subpop(m_NHWhite): tab BMIclass5 year, stdize(agegroup) stdweight(std_weight) col  per format(%3.1f) /* Men*/
svy,subpop(f_NHWhite): tab BMIclass5 year, stdize(agegroup) stdweight(std_weight) col per format(%3.1f) /* Women*/
svy,subpop(m_MexAm): tab BMIclass5 year, stdize(agegroup) stdweight(std_weight) col per format(%3.1f) /* Men*/
svy,subpop(f_MexAm): tab BMIclass5 year, stdize(agegroup) stdweight(std_weight) col  per format(%3.1f)/* Women*/
svy,subpop(m_NHBlack): tab BMIclass5 year, stdize(agegroup) stdweight(std_weight) col per format(%3.1f) /* Men*/
svy,subpop(f_NHBlack): tab BMIclass5 year, stdize(agegroup) stdweight(std_weight) col per format(%3.1f) /* Women*/


*==========================================================.
*Overweight (incl. obesity) by sex, race/ethnicity & year.
*==========================================================.

svy:mean overwt,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year) 
lincom _b[c.overwt@1.sex#1.ETHNIC#4.year] - _b[c.overwt@1.sex#1.ETHNIC#0.year]  /* Men: NH-White */
lincom _b[c.overwt@2.sex#1.ETHNIC#4.year] - _b[c.overwt@2.sex#1.ETHNIC#0.year]      /* Women: NH-White */
lincom _b[c.overwt@1.sex#2.ETHNIC#4.year] - _b[c.overwt@1.sex#2.ETHNIC#0.year]  /* Men: Mex-Amer */
lincom _b[c.overwt@2.sex#2.ETHNIC#4.year] - _b[c.overwt@2.sex#2.ETHNIC#0.year]      /* Women: Mex-Amer */
lincom _b[c.overwt@1.sex#3.ETHNIC#4.year] - _b[c.overwt@1.sex#3.ETHNIC#0.year]  /* Men: NH-black */
lincom _b[c.overwt@2.sex#3.ETHNIC#4.year] - _b[c.overwt@2.sex#3.ETHNIC#0.year]      /* Women: NH-black */

*Men vs women.
lincom (_b[c.overwt@2.sex#1.ETHNIC#4.year] - _b[c.overwt@2.sex#1.ETHNIC#0.year]) - (_b[c.overwt@1.sex#1.ETHNIC#4.year] - _b[c.overwt@1.sex#1.ETHNIC#0.year])
lincom (_b[c.overwt@2.sex#2.ETHNIC#4.year] - _b[c.overwt@2.sex#2.ETHNIC#0.year]) - (_b[c.overwt@1.sex#2.ETHNIC#4.year] - _b[c.overwt@1.sex#2.ETHNIC#0.year])
lincom (_b[c.overwt@2.sex#3.ETHNIC#4.year] - _b[c.overwt@2.sex#3.ETHNIC#0.year]) - (_b[c.overwt@1.sex#3.ETHNIC#4.year] - _b[c.overwt@1.sex#3.ETHNIC#0.year])

*====================.
*Obesity (30+).
*====================.

svy:mean obese,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year) 
lincom _b[c.obese@1.sex#1.ETHNIC#4.year] - _b[c.obese@1.sex#1.ETHNIC#0.year]  /* Men: NH-White */
lincom _b[c.obese@2.sex#1.ETHNIC#4.year] - _b[c.obese@2.sex#1.ETHNIC#0.year]      /* Women: NH-White */
lincom _b[c.obese@1.sex#2.ETHNIC#4.year] - _b[c.obese@1.sex#2.ETHNIC#0.year]  /* Men: Mex-Amer */
lincom _b[c.obese@2.sex#2.ETHNIC#4.year] - _b[c.obese@2.sex#2.ETHNIC#0.year]      /* Women: Mex-Amer */
lincom _b[c.obese@1.sex#3.ETHNIC#4.year] - _b[c.obese@1.sex#3.ETHNIC#0.year]  /* Men: NH-black */
lincom _b[c.obese@2.sex#3.ETHNIC#4.year] - _b[c.obese@2.sex#3.ETHNIC#0.year]      /* Women: NH-black */


*Women vs men.
lincom _b[c.obese@2.sex#1.ETHNIC#4.year] - _b[c.obese@2.sex#1.ETHNIC#0.year] - (_b[c.obese@1.sex#1.ETHNIC#4.year] - _b[c.obese@1.sex#1.ETHNIC#0.year])
lincom _b[c.obese@2.sex#2.ETHNIC#4.year] - _b[c.obese@2.sex#2.ETHNIC#0.year] - (_b[c.obese@1.sex#2.ETHNIC#4.year] - _b[c.obese@1.sex#2.ETHNIC#0.year])
lincom _b[c.obese@2.sex#3.ETHNIC#4.year] - _b[c.obese@2.sex#3.ETHNIC#0.year] - (_b[c.obese@1.sex#3.ETHNIC#4.year] - _b[c.obese@1.sex#3.ETHNIC#0.year])


*========================.
*Mean WC.
*excludes outliers for BMI.
*=======================.

generate nonmissWC = inlist(raisedWC,0,1)

svy,subpop(nonmissWC):mean bmxwaist,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year)
lincom _b[c.bmxwaist@1.sex#1.ETHNIC#4.year] - _b[c.bmxwaist@1.sex#1.ETHNIC#0.year] /* Men: NH-White */
lincom _b[c.bmxwaist@2.sex#1.ETHNIC#4.year] - _b[c.bmxwaist@2.sex#1.ETHNIC#0.year] /* Women: NH-White */
lincom _b[c.bmxwaist@1.sex#2.ETHNIC#4.year] - _b[c.bmxwaist@1.sex#2.ETHNIC#0.year] /* Men: MA */
lincom _b[c.bmxwaist@2.sex#2.ETHNIC#4.year] - _b[c.bmxwaist@2.sex#2.ETHNIC#0.year] /* Women: MA */
lincom _b[c.bmxwaist@1.sex#3.ETHNIC#4.year] - _b[c.bmxwaist@1.sex#3.ETHNIC#0.year] /* Men: NHB */
lincom _b[c.bmxwaist@2.sex#3.ETHNIC#4.year] - _b[c.bmxwaist@2.sex#3.ETHNIC#0.year] /* Women: NHB */
*Women vs men by ethnic group.
lincom (_b[c.bmxwaist@1.sex#1.ETHNIC#4.year] - _b[c.bmxwaist@1.sex#1.ETHNIC#0.year]) - (_b[c.bmxwaist@2.sex#1.ETHNIC#4.year] - _b[c.bmxwaist@2.sex#1.ETHNIC#0.year])
lincom (_b[c.bmxwaist@1.sex#2.ETHNIC#4.year] - _b[c.bmxwaist@1.sex#2.ETHNIC#0.year]) - (_b[c.bmxwaist@2.sex#2.ETHNIC#4.year] - _b[c.bmxwaist@2.sex#2.ETHNIC#0.year])
lincom (_b[c.bmxwaist@1.sex#3.ETHNIC#4.year] - _b[c.bmxwaist@1.sex#3.ETHNIC#0.year]) - (_b[c.bmxwaist@2.sex#3.ETHNIC#4.year] - _b[c.bmxwaist@2.sex#3.ETHNIC#0.year])


*=========================.
*Abd. obesity.
*==========================.

svy,subpop(nonmissWC):mean raisedWC,stdize(agegroup) stdweight(std_weight) over(sex ETHNIC year) 
lincom _b[c.raisedWC@1.sex#1.ETHNIC#4.year] - _b[c.raisedWC@1.sex#1.ETHNIC#0.year]  /* Men: NH-White */
lincom _b[c.raisedWC@2.sex#1.ETHNIC#4.year] - _b[c.raisedWC@2.sex#1.ETHNIC#0.year]      /* Women: NH-White */
lincom _b[c.raisedWC@1.sex#2.ETHNIC#4.year] - _b[c.raisedWC@1.sex#2.ETHNIC#0.year]  /* Men: Mex-Amer */
lincom _b[c.raisedWC@2.sex#2.ETHNIC#4.year] - _b[c.raisedWC@2.sex#2.ETHNIC#0.year]      /* Women: Mex-Amer */
lincom _b[c.raisedWC@1.sex#3.ETHNIC#4.year] - _b[c.raisedWC@1.sex#3.ETHNIC#0.year]  /* Men: NH-black */
lincom _b[c.raisedWC@2.sex#3.ETHNIC#4.year] - _b[c.raisedWC@2.sex#3.ETHNIC#0.year]      /* Women: NH-black */


*Women vs men.
lincom _b[c.raisedWC@2.sex#1.ETHNIC#4.year] - _b[c.raisedWC@2.sex#1.ETHNIC#0.year] - (_b[c.raisedWC@1.sex#1.ETHNIC#4.year] - _b[c.raisedWC@1.sex#1.ETHNIC#0.year])
lincom _b[c.raisedWC@2.sex#2.ETHNIC#4.year] - _b[c.raisedWC@2.sex#2.ETHNIC#0.year] - (_b[c.raisedWC@1.sex#2.ETHNIC#4.year] - _b[c.raisedWC@1.sex#2.ETHNIC#0.year])
lincom _b[c.raisedWC@2.sex#3.ETHNIC#4.year] - _b[c.raisedWC@2.sex#3.ETHNIC#0.year] - (_b[c.raisedWC@1.sex#3.ETHNIC#4.year] - _b[c.raisedWC@1.sex#3.ETHNIC#0.year])

******************************
*Regression analysis
******************************

*centre variables.
generate age_c = (age-25)
generate age_csq = (age_c^2)
generate bmi_c = (bmxbmi-25)
generate bmi_csq = (bmi_c^2)


*============================================.
*Analysis 1.
*BMI.
*Adjust for age and age-squared.
*allow change in xth quantile to vary by sex.
*============================================.


****************
**** NH-White***
****************

*BMI: 5th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 25th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 50th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year


*BMI: 75th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 95th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

****************
**** Mex-Amer***
****************

*BMI: 5th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 25th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 50th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 75th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 95th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year


****************
****N-H BLack***
****************

*BMI: 5th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 25th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year


*BMI: 50th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 75th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year

*BMI: 95th centile.
qreg bmxbmi c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxbmi c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year


*============================================.
*Analysis 2.
*WC.
*Adjust for age and age-squared.
*allow change in xth quantile to vary by sex.
*============================================.

****************
****N-H White***
****************

*WC: 5th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.05) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 25th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.25) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 50th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.50) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 75th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.75) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 95th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year


****************
****Mex-Amer***
****************

*WC: 5th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.05) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 25th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.25) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 50th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.50) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 75th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.75) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 95th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.95) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

****************
****N-H Black***
****************

*WC: 5th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.05) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 25th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.25) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year



*WC: 50th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.50) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 75th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.75) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*WC: 95th centile.
qreg bmxwaist c.age_c c.age_csq i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1) age_c=0 age_csq=0) noatlegend
margins, at(year=(0 4) sex=(2) age_c=0 age_csq=0) noatlegend
*change over time for men
lincom 4.year
*difference in change (women vs men)
lincom 4.year#2.sex
qui:qreg bmxwaist c.age_c c.age_csq i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.95) wlsiter(40) 
*change over time for women: P-value and 95% CI. 
lincom 4.year

*============================================================.
*Analysis 3.
*WC (outcome) and BMI (predictor).
*Adjust for age and age-squared.
*allow change in mean WC to vary by (continuous) BMI.
*Year as categorical: change between first and last.
*=========================================================.

generate NHWhite = ETHNIC==1
generate MexAm = ETHNIC==2
generate NHBlack = ETHNIC==3


*NH White.

svy,subpop(NHWhite) :regress bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex, nolog 
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend        /*BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend      /*BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend     /*BMI = 35 */
*Men
lincom 4.year
lincom (4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                  /*BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25         /*BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100       /*BMI = 35 */

qui: svy,subpop(NHWhite) :regress bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex, nolog 
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


*Mex-Am.
svy,subpop(MexAm): regress bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex, nolog 
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend        /*BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend      /*BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend     /*BMI = 35 */

*Men
lincom 4.year
lincom (4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                  /*BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25         /*BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100       /*BMI = 35 */
qui: svy,subpop(MexAm) :regress bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex, nolog 
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100

*NH Black
svy,subpop(NHBlack): regress bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex, nolog 
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend        /*BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend      /*BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend     /*BMI = 35 */
*Men
lincom 4.year
lincom (4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                  /*BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25         /*BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100       /*BMI = 35 */

qui:svy,subpop(NHBlack) :regress bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex, nolog 
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100



***************************
*N-H White: 5th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*N-H White: 25th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*N-H White: 50th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*N-H White: 75th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*N-H White: 95th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==1 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==1 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


********************
*NH Black
********************

***************************
*NH Black: 5th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*NH Black: 25th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*NH Black: 50th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*NH Black: 75th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*NH Black: 95th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==3 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==3 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100

***************************
*Mex-AM: 5th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.05) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.05) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*Mex-AM: 25th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.25) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.25) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*Mex-AM: 50th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.50) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.50) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*Mex-AM: 75th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.75) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.75) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


***************************
*Mex-AM: 95th centile.
***************************

qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##i.sex c.bmi_csq##i.year##i.sex if ETHNIC==2 [pweight=wtmec4yr], nolog quantile(0.95) wlsiter(40)
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=0 bmi_csq=0) noatlegend     /* BMI = 25 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=5 bmi_csq=25)  noatlegend   /* BMI = 30 */
margins, at(year=(0 4) sex=(1 2) age_c=0 age_csq=0 bmi_c=10 bmi_csq=100) noatlegend    /* BMI = 35 */


*Men
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100
*difference in change (women vs men)
lincom 4.year#2.sex                                                                 /* BMI = 25 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*5 + (4.year#2.sex#c.bmi_csq)*25    /* BMI = 30 */
lincom (4.year#2.sex) + (4.year#2.sex#c.bmi_c)*10 + (4.year#2.sex#c.bmi_csq)*100    /* BMI = 35 */
qui: qreg bmxwaist bmi_c bmi_csq c.age_c c.age_csq c.bmi_c##i.year##ib2.sex c.bmi_csq##i.year##ib2.sex if ETHNIC==2 [pweight=wtmec4yr], quantile(0.95) wlsiter(40)
*change over time for women: P-value and 95% CI. 
lincom 4.year
lincom (1*4.year) + (4.year#c.bmi_c)*5  + (4.year#c.bmi_csq)*25
lincom (1*4.year) + (4.year#c.bmi_c)*10  + (4.year#c.bmi_csq)*100


********************
*FINISHED
********************































