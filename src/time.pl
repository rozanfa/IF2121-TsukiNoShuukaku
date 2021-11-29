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


addTime :-  retract(time(CurrTime)),
            CurrTime < 23 -> NewTime is CurrTime + 1,  asserta(time(NewTime)), writeTime, decreasePotion;
            CurrTime = 23 -> NewTime is 1, asserta(time(NewTime)),writeTime, addDay, setAlchemist.

addDay :-   checkAnimal, (retract(day(CurrDay)), NewDay is CurrDay + 1,
            asserta(day(NewDay))), randomizeWeather,
           ( NewDay == 24 -> finishGame;
            S is mod(NewDay,6),  S == 0 -> addSeason;
            true), writeDay, true.

setAlchemist :- alchemistloc(X,Y,TP,TC), retract(alchemistloc(X,Y,TP,TC)),
            (TC > 0 ->
                NTC is TC - 1,
                (NTC =:= 0 ->
                    NTP is 2, NTC is 0;
                    NTP is TP);
             TP > 0 ->
                NTP is TP - 1,
                (NTP =:= 0 ->
                    NTC is 6, NTP is 0;
                    NTC is TC)),
                    asserta(alchemistloc(X,Y,NTP,NTC)).

decreasePotion :- potionEfect(E,ST),
        E =\= 0 -> NST is ST - 1, retract(potionEfect(E,ST)),
            (NST =\= 0 ->
                 asserta(potionEfect(E,NST));
                 (E =:= 1 -> retract(tempLevel(X,_,_,_)), retract(farminglevel(_,_)),
                             asserta(tempLevel(0,0,0,0)), asserta(farminglevel(_,X));
                  E =:= 2 -> retract(tempLevel(_,X,_,_)), retract(fishinglevel(_,_)),
                             asserta(tempLevel(0,0,0,0)), asserta(fishinglevel(_,X));
                  E =:= 3 -> retract(tempLevel(_,_,X,_)), retract(ranchinglevel(_,_)),
                             asserta(tempLevel(0,0,0,0)), asserta(ranchinglevel(_,X));
                  E =:= 4 -> retract(tempLevel(_,_,_,X)), retract(maxStamina(_,_)),
                             asserta(tempLevel(0,0,0,0)), asserta(maxStamina(_,X));
                  E =:= 5 -> retract(tempLevel(X,Y,Z,W)), asserta(tempLevel(0,0,0,0)),
                             retract(farminglevel(_,_)), asserta(farminglevel(_,X)),
                             retract(fishinglevel(_,_)), asserta(fishinglevel(_,Y)),
                             retract(ranchinglevel(_,_)), asserta(ranchinglevel(_,Z)),
                             retract(maxStamina(_,_)), asserta(maxStamina(_,W))
                 ), asserta(potionEfect(0,0));
             NST =:= 0 -> write('Efek potion sudah menghilang.')
            );
        true. 

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
