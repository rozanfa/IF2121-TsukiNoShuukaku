/* Include necessary modules */
:- include(map).
:- include(items).
:- include(house).

/* declare dynamic predicates */
:- dynamic(takenQuestItems/5).
:- dynamic(questStatus/1).
:- dynamic(inQuest/1).
:- dynamic(questCounter/1).

currentQuest(0,0,0,0).
inQuest(0).
questCounter(0).

/* Hardcoding list of quests */
questItems(1,1,1,1).
questItems(2,2,2,1).
questItems(3,3,2,2).
questItems(4,3,3,3).
questItems(5,4,5,4).

progQuest(X):-
    crop(X) -> currentQuest(Z,Y,_,_), Ym is Y+1, retract(currentQuest(_,Y,_,_)), asserta(currentQuest(_,Ym,_,_)), questCheck(Z);
    isFish(X) -> currentQuest(Z,_,Y,_), Ym is Y+1, retract(currentQuest(_,_,Y,_)), asserta(currentQuest(_,_,Ym,_)), questCheck(Z);
    isProduct(X) -> currentQuest(Z,_,_,Y), Ym is Y+1, retract(currentQuest(_,_,_,Y)), asserta(currentQuest(_,_,_,Ym)), questCheck(Z).

questCheck(X):-
    questItems(X,A,B,C),
    currentQuest(X,D,E,F),
    (A =:= D, B =:= E, C =:= F) -> write('Quest Cleared!'), retract(currentQuest(_,_,_,_)), asserta(currentQuest(0,0,0,0)),
    retract(inQuest(1)), asserta(inQuest(0)).

initQuest:-
    questCounter(C),
    Cp is C+1,
    retract(questCounter(C)), asserta(questCounter(Cp)),
    questItems(Cp,X,Y,Z),
    write('You got a new quest!\n\nYou have to collect: \n'),
    write('- '), write(X), write(' harvest item\n'),
    write('- '), write(Y), write(' fish\n'),
    write('- '), write(Z), write(' ranch item\n'),
    retract(inQuest(0)), asserta(inQuest(1)),
    retract(currentQuest(0,_,_,_)), asserta(currentQuest(Cp,_,_,_)).

quest:-
    playerloc(Xp,Yp),
    questloc(Xq,Yq),
    inQuest(S),
    (Xp =:= Xq, Yp =:= Yq, S =:= 0) -> initQuest;
    S =:= 1 -> write('You have an ongoing quest!');
    write('You are not on the Quest tile. \n').