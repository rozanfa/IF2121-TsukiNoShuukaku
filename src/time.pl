/* declare dynamic predicates */
:- dynamic(time/1).
:- dynamic(day/1).
:- dynamic(season/1).

isSeason('Semi',1).
isSeason('Panas',2).
isSeason('Gugur',3).
isSeason('Dingin',4).
isSeason('Semi',5).

/* Init time */
time(0).
day(0).
season(1).



/*DUMMY*/
:- dynamic(cropLoc/4).
:- dynamic(readyCropLoc/4).
cropLoc(1, 2, aaa, 3).
cropLoc(2, 2, bbb, 3).
cropLoc(3, 2, ccc, 3).
/*DUMMY*/


addTime :-  retract(time(CurrTime)), 
            CurrTime < 23 -> NewTime is CurrTime + 1,  asserta(time(NewTime));
            CurrTime = 23 -> NewTime is 1, asserta(time(NewTime)), addDay, checkCrops.

checkCrops :-   forall(cropLoc(X, Y, CropName, HarvestTime),
                ((day(CurrDay), HarvestTime == CurrDay), 
                retract(cropLoc(X, Y, CropName, HarvestTime)),
                asserta(readyCropLoc(X, Y, CropName, HarvestTime)))); true.


addDay :-   (retract(day(CurrDay)), NewDay is CurrDay + 1,
            asserta(day(NewDay))),
           ( NewDay == 24 -> finishGame;
            S is mod(NewDay,6),  S == 0 -> addSeason;
            true), writeDay, true.
            
            

addSeason :-    retract(season(CurrSeason)),
                NewSeason is CurrSeason + 1, asserta(season(NewSeason)).

writeDay :-    ( write('-----------------------------------------------------------------------'), nl, 
                write('----------------------------- Musim '), season(CurrSeason), isSeason(SeasonName, CurrSeason), write(SeasonName), write(' -----------------------------'),nl, 
                write('------------------------------ Hari Ke-'), day(CurrDay), write(CurrDay), write(' ------------------------------'),nl, 
                write('-----------------------------------------------------------------------'), nl), true, !.

writeTime :- write('Waktu sekarang : '), time(CurrTime), write(CurrTime), write('/24.'), nl.              

finishGame :- write('Kamu telah berusaha, namun sayang sekali kamu masih jauh dari kesuksesan. Silakan coba lagi dan tetap semangat!'). 