:- dynamic(houseOpCode/1).
:- dynamic(currentDay/1).
:- dynamic(currentseason/1).

% placeholders
currentseason(autumn).
currentDay(1).

houseOpCode(0).

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
    retract(houseOpCode(1)),asserta(houseOpCode(0)).