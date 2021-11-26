:- dynamic(time/1).
:- dynamic(day/1).
:- dynamic(season/1).

addTime :-  retract(time(currTime)), 
            currTime < 23 -> newTime is currTime + 1,  asserta(time(newTime));
            currTime >= 23 -> newTime is 0, asserta(time(newTime)),
            retract(day(currDay)), newDay is currDay + 1,
            newDay == 24 -> finishGame, !. 
            asserta(day(newDay)),
            newDay mod 6 == 0 -> retract(season(currSeason)),
            newSeason is currSeason + 1, asserta(season(newSeason)).
            

