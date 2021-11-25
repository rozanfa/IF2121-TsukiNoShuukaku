/* declare dynamic predicates */
:- dynamic(houseOpCode/1).
:- dynamic(currentDay/1).
:- dynamic(currentSeason/1).
:- dynamic(diaries/1).
:- dynamic(emptyDiary/1).

/* Central Time Control */
currentSeason(spring).
currentDay(1).
dayCap(24).
houseOpCode(0).
emptyDiary(0).
diaries([[0,'']]).

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

writeD:-
    currentDay(D),
    diaries(C),
    write('Write your diary for Day '), write(D), write('\n'),
    read(X),
    retract(diaries(C)), asserta(diaries([[0,X]|C])),
    retract(diaries([[0,X]|C])), asserta(diaries([[D,X]|C])),
    emptyDiary(A), 
    A =:= 0 -> retract(emptyDiary(0)),asserta(emptyDiary(1)).

writeDiary:-
    currentDay(D),
    diaries([[Dc,_]|A]),
    Dc =:= D -> write('Overwritting Diary...'), retract(diaries([[Dc,_]|A])), asserta(diaries(A)), writeD;
    writeD.

showDiary(_,[[Day,_]|_]):- 
    Day =:= 0, write('Entry not found!'), !.
showDiary(X,[[Day,Entry]|Tail]):-
    X =:= Day -> write('Here is your entry for day 1:\n'), write(Entry);
    showDiary(X,Tail).

showDiaryList([[_,_]|_]):- 
    emptyDiary(A), A =:= 0, write('Diary is empty, How about writing a new entry?'), !.
showDiaryList([[Day,_]|_]):- 
    Day =:= 0,
    read(X),
    diaries(Ds),
    showDiary(X,Ds), !.

showDiaryList([[Day,_]|Tail]):- 
    write('- Day '), write(Day), write('\n'),
    showDiaryList(Tail).

readDiary:-
    write('Here are the list of your entries:\n'),
    diaries(Ds),
    showDiaryList(Ds).


sleep:-
    write('You went to sleep, have a nice dream.'),
    retract(currentseason(autumn)),asserta(currentseason(winter)),
    currentDay(X),
    Y is X+1,
    retract(currentDay(X)),asserta(currentDay(Y)),
    checkDay(Y),
    retract(houseOpCode(1)),asserta(houseOpCode(0)).