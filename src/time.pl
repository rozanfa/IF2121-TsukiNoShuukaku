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
time(22).
day(5).
season(1).

addTime :-  retract(time(CurrTime)), 
            CurrTime < 23 -> NewTime is CurrTime + 1,  asserta(time(NewTime));
            CurrTime = 23 -> NewTime is 1, asserta(time(NewTime)), addDay, checkCrops.

checkCrops :-   forall(cropLoc(X, Y, CropName, HarvestTime)),
                retract(cropLoc(X, Y, CropName, HarvestTime)),
                asserta(ReadyCropLoc(cropLoc(X, Y, CropName, HarvestTime))).


addDay :-   retract(day(CurrDay)), NewDay is CurrDay + 1,
            asserta(day(NewDay)), writeDay,
            NewDay == 24 -> finishGame, !,
            S is mod(A,B), T is  == 0 -> addSeason.
            

addSeason :-    retract(season(CurrSeason)),
                NewSeason is CurrSeason + 1, asserta(season(NewSeason)),!.

writeDay :-    ( write('-----------------------------------------------------------------------'), nl, 
                write('---------------------------- Musim '), season(CurrSeason), isSeason(SeasonName, CurrSeason), write(SeasonName), write(' ----------------------------'),nl, 
                write('----------------------------- Hari Ke-'), day(CurrDay), write(CurrDay), write(' -----------------------------'),nl, 
                write('-----------------------------------------------------------------------'),nl, true).

writeTime :- write('Waktu sekarang : '), time(CurrTime), write(CurrTime), write('/24.'), nl.              

finishGame :- write('Kamu telah berusaha, namun sayang sekali kamu masih jauh dari kesuksesan. Silakan coba lagi dan tetap semangat!').