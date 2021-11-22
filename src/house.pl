:- dynamic(houseOpCode/1).
:- dynamic(currentDay/1).
:- dynamic(currentSeason/1).

% placeholders
currentSeason(spring).
currentDay(1).
dayCap(24).

houseOpCode(0).

checkDay(D):-
    D >= 7, D < 13 -> retract(currentseason(spring)), asserta(currentseason(summer));
    D >= 13, D < 19 -> retract(currentseason(summer)), asserta(currentseason(autumn));
    D >= 19, D < 25 -> retract(currentseason(autumn)), asserta(currentseason(winter));
    write('You have worked hard, but in the end result is all that matters. May God bless you in the future with kind people!').

house:- houseOpCode(1), write('You\'re already inside your house.\n'), !.
house:-
    houseOpCode(0),
    retract(houseOpCode(0)),asserta(houseOpCode(1)),
    write('Welcome to the House! What would you like to do?\n'),
    write('- sleep\n-writeDiary\n-readDiary\n-exit').

sleep:-
    write('You went to sleep, have a nice dream.'),
    retract(currentseason(autumn)),asserta(currentseason(winter)),
    currentDay(X),
    Y is X+1,
    retract(currentDay(X)),asserta(currentDay(Y)),
    checkDay(Y).
    retract(houseOpCode(1)),asserta(houseOpCode(0)).