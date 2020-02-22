/* Generated Code (IMPORT) */
/* Source File: top2018.csv */
/* Source Path: /folders/myfolders */
/* Code generated on: 12/3/19, 2:13 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/top2018.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;

proc sgscatter DATA=WORK.IMPORT;
matrix loudness danceability energy key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms;
run;

proc corr DATA=WORK.IMPORT;
var loudness danceability energy key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms;
run;

/*proc reg DATA=WORK.IMPORT;
model danceability = energy loudness key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/selection = adjrsq cp sse;
run;

proc reg DATA=WORK.IMPORT;
model energy = danceability loudness key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/selection = adjrsq cp sse;
run;*/

proc reg DATA=WORK.IMPORT;
model loudness = danceability energy key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/p r influence;
run;

proc reg DATA=WORK.IMPORT;
model loudness = danceability energy key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/selection = adjrsq cp sse;
run;

proc reg DATA=WORK.IMPORT;
model loudness = danceability energy key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/selection = stepwise;
run;

proc reg DATA=WORK.IMPORT;
model loudness = danceability energy key liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/selection = backward;
run;


/*proc reg DATA=WORK.IMPORT;
model time_signature = danceability energy key liveness speechiness valence
tempo instrumentalness loudness mode duration_ms/selection = adjrsq cp sse;
run;

proc reg DATA=WORK.IMPORT;
model key = danceability loudness energy liveness speechiness valence
tempo instrumentalness time_signature mode duration_ms/selection = adjrsq cp sse;
run;

proc reg DATA=WORK.IMPORT;
model instrumentalness = danceability loudness key liveness speechiness valence
tempo energy time_signature mode duration_ms/selection = adjrsq cp sse;
run;

proc reg DATA=WORK.IMPORT;
model valence = danceability loudness key liveness speechiness instrumentalness
tempo energy time_signature mode duration_ms/selection = adjrsq cp sse;
run;*/



%web_open_table(WORK.IMPORT);