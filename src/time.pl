/* declare dynamic predicates */
:- dynamic(time/1).
:- dynamic(day/1).
:- dynamic(season/1).

isSeason('Semi',1).
isSeason('Panas',2).
isSeason('Gugur',3).
isSeason('Dingin',4).

/* Init time */
time(1).
day(1).
season(1).

addTime :-  retract(time(CurrTime)), 
            CurrTime < 23 -> NewTime is CurrTime + 1,  asserta(time(NewTime));
            CurrTime >= 23 -> NewTime is 0, asserta(time(NewTime)),
            retract(day(CurrDay)), NewDay is CurrDay + 1,
            NewDay == 24 -> finishGame, !. 
            asserta(day(NewDay)),
            NewDay mod 6 == 0 -> retract(season(CurrSeason)),
            NewSeason is CurrSeason + 1, asserta(season(NewSeason)).

finishGame :- write('Kamu telah berusaha, namun sayang sekali kamu masih jauh dari kesuksesan. Silakan coba lagi dan tetap semangat!').