* Encoding: UTF-8.
*****************************************************
*Secular change in WC relative to BMI.
*****************************************************

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse97ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj htval wtval wstval.
select if age>=16.
compute wt_int=1.
compute wt_nurse=1.
exe.
compute a=0.
if pregntj=1 a=1.
exe.

compute b=0.
if (bmival<10|bmival>58) b=1.
exe.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="1997".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.
compute year2=1997.

compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
exe.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.sav".
    

* 1998.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse98ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj htval wtval wstval.
select if age>=16.
compute wt_int=1.
compute wt_nurse=1.
exe.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="1998".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.
compute year2=1998.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp2.sav".

* 1999.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse99gp3.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj htval wtval wstval.
select if age>=16.
compute wt_int=1.
compute wt_nurse=1.
exe.
compute a=0.
if pregntj=1 a=1.
fre a.
compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="1999".
exe.
STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=1999.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp3.sav".

*2000.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse00ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj samptype htval wtval wstval.
select if age>=16.
sel if samptype=2.
compute wt_int=1.
compute wt_nurse=1.
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2000".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2000.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp4.sav".

* 2001.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse01ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj htval wtval wstval.
select if age>=16.
compute wt_int=1.
compute wt_nurse=1.
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2001".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2001.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp5.sav".

* 2002.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse02ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj samptype htval wtval wstval.
select if age>=16.
sel if samptype=2.
compute wt_int=1.
compute wt_nurse=1.
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2002".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2002.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp6.sav".

* 2003.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse03ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj int_wt nurse_wt htval wtval wstval.
select if age>=16.
compute wt_int=int_wt.
compute wt_nurse = nurse_wt.
exe. 
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2003".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2003.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp7.sav".

* 2004.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse04gpa.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj wt_int htval wtval wstval.
select if age>=16.
exe.
desc var wt_int.
compute wt_int2=wt_int/14.156832.
EXECUTE.
delete variables wt_int.
rename variables (wt_int2=wt_int).
exe.


*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2004".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2004.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp8.sav".

* 2005.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse05ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj wt_int wt_nurse samptype htval wtval wstval.
select if age>=16.
sel if samptype=1.
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2005".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2005.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp9.sav".


* 2006.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse06ai.sav"
/KEEP pserial psu sex age bmi bmiok bmival pregntj wt_int wt_nurse htval wtval wstval.
rename variables (psu = area).
exe.
select if age>=16.
fre sex.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2006".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2006.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp10.sav".

* 2007.


dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse07ai.sav"
/KEEP pserial area sex age bmi bmiok bmival pregntj wt_int wt_nurse htval wtval wstval.
select if age>=16.
fre sex.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2007".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2007.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp11.sav".


* 2008 (n=12,835).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse08ai.sav"
/KEEP pserial psu sex age bmival bmiok wt_int wt_nurse pregntj htval wtval wstval.
rename variables (psu = area).
exe.
select if age>=16.
exe.
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2008".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2008.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp12.sav".



* 2009 (4,100).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse09ai.sav"
/KEEP pserial psu sex age bmival bmiok wt_int wt_nurse pregntj htval wtval wstval.
rename variables (psu = area).
exe.
select if age>=16.
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2009".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2009.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp13.sav".


* 2010 (n=7,086).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse10ai.sav"
/KEEP pserial psu cluster sex age bmival bmiok wt_int wt_nurse pregntj htval wtval wstval ag16g10.

select if age>=16.
exe.

rename variables (psu = area).
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2010".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2010.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp14.sav".




* 2011 (7008).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse2011ai.sav"
/KEEP pserial psu sex age bmival bmiok wt_int wt_nurse pregntj htval wtval wstval.
rename variables (psu = area).
exe.
select if age>=16.
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

* point variable.

FORMAT area (F4).
EXE.
string areastr (a4).
compute AREAstr = STRING(area,F4).
exe.
compute AREAstr = LTRIM(areastr).
exe.
string year1 (a4).
compute year1="2011".
exe.

STRING point1 (A8).
COMPUTE point1 = CONCAT(year1,areastr).
EXECUTE.

compute year2=2011.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp15.sav".


* 2012 (6970).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse2012ai.sav"
/KEEP pserial psu sex age bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval.
select if age>=16.

STRING point1 (A8).
COMPUTE point1 =string(psu,F2.0).
EXECUTE.


rename var (bmival2 wtval2 = bmival wtval).
exe.
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

compute year2=2012.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp16.sav".


* 2013 (6970).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse2013ai.sav"
/KEEP pserial psu sex age bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval.
select if age>=16.
exe.

STRING point1 (A8).
COMPUTE point1 =string(psu,F2.0).
EXECUTE.


rename var (bmival2 wtval2 = bmival wtval).
exe.
*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.



compute year2=2013.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp17.sav".


* 2014 (6970).

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse2014ai.sav"
/KEEP pserial psu sex age90 bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval.
select if age90>=16.
rename var (bmival2 wtval2 age90 = bmival wtval age).
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

STRING point1 (A8).
COMPUTE point1 =string(psu,F7.0).
EXECUTE.
fre point1.



compute year2=2014.
compute age2564g5=0.
if range(age,25,29) age2564g5=1.
if range(age,30,34) age2564g5=2.
if range(age,35,39) age2564g5=3.
if range(age,40,44) age2564g5=4.
if range(age,45,49) age2564g5=5.
if range(age,50,54) age2564g5=6.
if range(age,55,59) age2564g5=7.
if range(age,60,64) age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp18.sav".



* 2015 (6970).


dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse2015ai.sav"
/KEEP seriala psu sex bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval age16g5.

STRING point1 (A8).
COMPUTE point1 =string(psu,F7.0).
EXECUTE.
fre point1.



select if age16g5>=1.
exe.
fre age16g5.

compute pserial=1.
exe.

rename var (bmival2 wtval2 = bmival wtval).
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

compute year2=2015.
compute age2564g5=0.
if age16g5=4 age2564g5=1.
if age16g5=5 age2564g5=2.
if age16g5=6  age2564g5=3.
if age16g5=7 age2564g5=4.
if age16g5=8  age2564g5=5.
if age16g5=9  age2564g5=6.
if age16g5=10  age2564g5=7.
if age16g5=11 age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp19.sav".

* 2016.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse2016_eul.sav"
/KEEP seriala psu sex bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval age16g5.
select if age16g5>=1.
exe.
fre age16g5.

STRING point1 (A8).
COMPUTE point1 =string(psu,F7.0).
EXECUTE.
fre point1.

* age-group.


compute pserial=1.
exe.

rename var (bmival2 wtval2 = bmival wtval).
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

compute year2=2016.
exe.

compute age2564g5=0.
if age16g5=4 age2564g5=1.
if age16g5=5 age2564g5=2.
if age16g5=6  age2564g5=3.
if age16g5=7 age2564g5=4.
if age16g5=8  age2564g5=5.
if age16g5=9  age2564g5=6.
if age16g5=10  age2564g5=7.
if age16g5=11 age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp20.sav".


* 2017.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse17i_eul_v1.sav"
/KEEP seriala psu sex bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval age16g5.
select if age16g5>=1.
exe.
fre age16g5.

STRING point1 (A8).
COMPUTE point1 =string(psu,F7.0).
EXECUTE.
fre point1.

* age-group.


compute pserial=1.
exe.

rename var (bmival2 wtval2 = bmival wtval).
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

compute year2=2017.
exe.
compute age2564g5=0.
if age16g5=4 age2564g5=1.
if age16g5=5 age2564g5=2.
if age16g5=6  age2564g5=3.
if age16g5=7 age2564g5=4.
if age16g5=8  age2564g5=5.
if age16g5=9  age2564g5=6.
if age16g5=10  age2564g5=7.
if age16g5=11 age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp21.sav".

*======================================.
*2018.
*==================================.

dataset close all.
GET FILE="C:\Users\rmjdshc\OneDrive - University College London\Archive datasets\hse_2018_eul.sav"
/KEEP seriala psu_scr sex bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval age16g5.

select if age16g5>=1.
exe.
fre age16g5.

STRING point1 (A8).
COMPUTE point1 =string(psu_scr,F7.0).
EXECUTE.
fre point1.

* age-group.

compute pserial=1.
exe.

rename var (bmival2 wtval2 = bmival wtval).
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

compute year2=2018.
exe.
compute age2564g5=0.
if age16g5=4 age2564g5=1.
if age16g5=5 age2564g5=2.
if age16g5=6  age2564g5=3.
if age16g5=7 age2564g5=4.
if age16g5=8  age2564g5=5.
if age16g5=9  age2564g5=6.
if age16g5=10  age2564g5=7.
if age16g5=11 age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp22.sav".



*======================================.
*2019.
*==================================.

dataset close all.
GET FILE='S:\FPHS_EPH_HSE_Shared\2 HSE 2016-19\HSE 2019\Data\archived data 220222\UKDA-8860-spss\spss\spss25\hse_2019_eul_20211006.sav'
/KEEP seriala psu_scr sex bmival2 bmiok wt_int wt_nurse pregntj htval wtval2 wstval age16g5.

select if age16g5>=1.
exe.
fre age16g5.

STRING point1 (A8).
COMPUTE point1 =string(psu_scr,F7.0).
EXECUTE.
fre point1.

* age-group.

compute pserial=1.
exe.

rename var (bmival2 wtval2 = bmival wtval).
exe.

*SELECT IF bmival>0.
exe.
fre pregntj.

compute a=0.
if pregntj=1 a=1.
fre a.

compute b=0.
if (bmival<10|bmival>58) b=1.
fre b.

compute year2=2019.
exe.
compute age2564g5=0.
if age16g5=4 age2564g5=1.
if age16g5=5 age2564g5=2.
if age16g5=6  age2564g5=3.
if age16g5=7 age2564g5=4.
if age16g5=8  age2564g5=5.
if age16g5=9  age2564g5=6.
if age16g5=10  age2564g5=7.
if age16g5=11 age2564g5=8.
exe.
val labels age2564g5 
1 "25-29"
2 "30-34"
3 "35-39"
4 "40-44"
5 "45-49"
6 "50-54"
7 "55-59"
8 "60-64".
fre age2564g5.
save outfile = "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp23.sav".

dataset close all.
get file =  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp1.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp2.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp3.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp4.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp5.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp6.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp7.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp8.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp9.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp10.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp11.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp12.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp13.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp14.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp15.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp16.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp17.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp18.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp19.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp20.sav".
add files/file=*/file= "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp21.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp22.sav".
add files/file=*/file=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\Temp23.sav".
exe.

* Select age 25 to 64.

select if range(age2564g5,1,8).
EXECUTE.
fre age2564g5.

compute year4=0.
if year2=1997|year2=1998 year4=1.
if year2=1999|year2=2000 year4=2.
if year2=2001|year2=2002 year4=3.
if year2=2003|year2=2004 year4=4.
if year2=2005|year2=2006 year4=5.
if year2=2007|year2=2008 year4=6.
if year2=2009|year2=2010 year4=7.
if year2=2011|year2=2012 year4=8.
if year2=2013|year2=2014 year4=9.
if year2=2015|year2=2016 year4=10.
if year2=2017|year2=2018 year4=11.
EXECUTE.

* Number interviewed (25-64).
fre year4.

compute agesex=0.
if sex=1 & age2564g5=1 agesex=1.
if sex=1 & age2564g5=2 agesex=2.
if sex=1 & age2564g5=3 agesex=3.
if sex=1 &  age2564g5=4 agesex=4.
if sex=1 &  age2564g5=5 agesex=5.
if sex=1 & age2564g5=6 agesex=6.
if sex=1 & age2564g5=7 agesex=7.
if sex=1 &  age2564g5=8 agesex=8.
if sex=2 & age2564g5=1 agesex=9.
if sex=2 &  age2564g5=2 agesex=10.
if sex=2 & age2564g5=3 agesex=11.
if sex=2 & age2564g5=4 agesex=12.
if sex=2 &  age2564g5=5 agesex=13.
if sex=2 &  age2564g5=6 agesex=14.
if sex=2 &  age2564g5=7 agesex=15.
if sex=2 &  age2564g5=8 agesex=16.
exe.
val labels agesex
1 "M 25-29"
2 "M 30-34"
3 "M 35-39"
4 "M 40-44"
5 "M 45-49"
6 "M 50-54"
7 "M 55-59"
8 "M 60-64"
9 "F 25-29"
10 "F 30-34"
11 "F 35-39"
12 "F 40-44"
13 "F 45-49"
14 "F 50-54"
15 "F 55-59"
16 "F 60-64".
EXECUTE.
fre agesex.

*sel if bmival>0.
*exe.
desc var bmival wstval.
SAVE OUTFILE= "C:\Users\rmjdshc\OneDrive - University College London\Temp\HSEBMI97-19.sav"
  /COMPRESSED.

*Contains missing BMI & missing wstval.

dataset close all.
get file =  "C:\Users\rmjdshc\OneDrive - University College London\Temp\HSEBMI97-19.sav".
 SAVE TRANSLATE OUTFILE=  "C:\Users\rmjdshc\OneDrive - University College London\Temp\HSEBMI97-19.dta"
  /TYPE=STATA
  /VERSION=8
  /EDITION=SE
  /MAP
  /REPLACE.





























































