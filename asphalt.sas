/* Generated Code (IMPORT) */
/* Source File: asphalt_binder.csv */
/* Source Path: /folders/myfolders */
/* Code generated on: 11/25/19, 11:08 AM */


FILENAME REFFILE '/folders/myfolders/asphalt_binder.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT1;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT1; RUN;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = saturates aromatics resins asptenes wax;
run;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = asptenes wax;
/*model srf_fr_eng = aromatics;
model srf_fr_eng = resins;
model srf_fr_eng = asptenes;
model srf_fr_eng = wax;*/
run;

/*proc sgscatter DATA=WORK.IMPORT1;
matrix srf_fr_eng saturates aromatics resins asptenes wax;
run;

proc corr DATA=WORK.IMPORT1;
var saturates aromatics resins asptenes wax;
run;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = saturates aromatics resins asptenes wax/p r influence;
run;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = saturates aromatics resins asptenes wax/selection = adjrsq cp sse;
run;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = saturates aromatics resins asptenes wax/selection = cp adjrsq aic bic sbc;
run;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = saturates aromatics resins asptenes wax/selection = stepwise;
run;

proc reg DATA=WORK.IMPORT1;
model srf_fr_eng = saturates aromatics resins asptenes wax/selection = backward;
run;*/