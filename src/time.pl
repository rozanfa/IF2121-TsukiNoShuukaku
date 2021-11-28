/* declare dynamic predicates */
:- dynamic(time/1).
:- dynamic(day/1).
:- dynamic(season/1).
:- dynamic(weather/1).


/* Musim */
isSeason('Semi',1).
isSeason('Panas',2).
isSeason('Gugur',3).
isSeason('Dingin',4).
isSeason('Semi',5).

/* Init time */
time(0).
day(0).
season(1).


/* Weather */
setSpringWeather(X) :-  X = 1 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 2 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 3 -> (retract(weather(_)), asserta(weather('berawan')));
                        X = 4 -> (retract(weather(_)), asserta(weather('berawan')));
                        X = 5 -> (retract(weather(_)), asserta(weather('hujan')));
                        X = 6 -> (retract(weather(_)), asserta(weather('hujan'))). %Buffer

setSummerWeather(X) :-  X = 1 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 2 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 3 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 4 -> (retract(weather(_)), asserta(weather('berawan')));
                        X = 5 -> (retract(weather(_)), asserta(weather('berawan')));
                        X = 6 -> (retract(weather(_)), asserta(weather('hujan'))). %Buffer

setFallWeather(X) :-    X = 1 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 2 -> (retract(weather(_)), asserta(weather('berawan')));
                        X = 3 -> (retract(weather(_)), asserta(weather('berangin')));
                        X = 4 -> (retract(weather(_)), asserta(weather('berangin')));
                        X = 5 -> (retract(weather(_)), asserta(weather('hujan')));
                        X = 6 -> (retract(weather(_)), asserta(weather('hujan'))). %Buffer

setWinterWeather(X) :-  X = 1 -> (retract(weather(_)), asserta(weather('salju')));
                        X = 2 -> (retract(weather(_)), asserta(weather('salju')));
                        X = 3 -> (retract(weather(_)), asserta(weather('salju')));
                        X = 4 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 5 -> (retract(weather(_)), asserta(weather('cerah')));
                        X = 6 -> (retract(weather(_)), asserta(weather('cerah'))). %Buffer


/* Init weather */
weather('cerah').


/*DUMMY*/
:- dynamic(cropLoc/4).
:- dynamic(readyCropLoc/4).
cropLoc(1, 2, aaa, 3).
cropLoc(2, 2, bbb, 3).
cropLoc(3, 2, ccc, 3).
/*DUMMY*/


addTime :-  retract(time(CurrTime)), 
            CurrTime < 23 -> NewTime is CurrTime + 1,  asserta(time(NewTime)), writeTime;
            CurrTime = 23 -> NewTime is 1, asserta(time(NewTime)),writeTime, addDay, checkCrops.

checkCrops :-   forall(cropLoc(X, Y, CropName, HarvestTime),
                ((day(CurrDay), HarvestTime == CurrDay), 
                retract(cropLoc(X, Y, CropName, HarvestTime)),
                asserta(readyCropLoc(X, Y, CropName, HarvestTime)))); true.


addDay :-   (retract(day(CurrDay)), NewDay is CurrDay + 1,
            asserta(day(NewDay))), randomizeWeather,
           ( NewDay == 24 -> finishGame;
            S is mod(NewDay,6),  S == 0 -> addSeason;
            true), writeDay, true.
            
            

addSeason :-    retract(season(CurrSeason)),
                NewSeason is CurrSeason + 1, asserta(season(NewSeason)).

writeDay :-    ( write('-----------------------------------------------------------------------'), nl, 
                write('----------------------------- Musim '), season(CurrSeason), isSeason(SeasonName, CurrSeason), write(SeasonName), write(' -----------------------------'),nl, 
                write('------------------------------ Hari Ke-'), day(CurrDay), write(CurrDay), write(' ------------------------------'),nl, 
                write('---------------------------- Cuaca : '), weather(CurrWeather), write(CurrWeather), write(' ----------------------------'), nl,
                write('-----------------------------------------------------------------------'), nl, true, !).

writeTime :- write('Waktu sekarang : '), time(CurrTime), write(CurrTime), write('/24.'), nl.              

finishGame :-   gold(_, currentGold), 
                currentGold >= 20000 ->
                write('Kamu telah berusaha, namun sayang sekali kamu masih jauh dari kesuksesan. \nSilakan coba lagi dan tetap semangat!'), halt;
                currentGold < 20000 ->
                write('Selamat! Kamu akhirnya berhasil mengumpulkan 20000 gold!\n'), halt.

randomizeWeather :- season(S), random(1,6,X), setWeather(S, X).

setWeather(S, X) :- season(S), 
                    S =:= 1 -> (setSpringWeather(X));
                    S =:= 2 -> (setSummerWeather(X));
                    S =:= 3 -> (setFallWeather(X));
                    S =:= 4 -> (setWinterWeather(X));
                    S =:= 5 -> (setSpringWeather(X)).