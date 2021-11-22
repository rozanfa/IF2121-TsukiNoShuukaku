/* Include necessary modules */
:- include(map).
:- include(items).
:- include(house).

/* declare dynamic predicates */
:- dynamic(questItems/5).
:- dynamic(takenQuestItems/5).
:- dynamic(questStatus/1).

takenQuestItems(0,0,0,0,0)
/* Hardcoding list of quests */
questItems(_,0,0,0,C):-
    C =:= 0 -> 
    C =:= 2 -> retract(questItems(_,0,0,0,2)), asserta(questItems(_,0,0,0,3));

questItems(3,1,1,1,1).
questItems(7,2,2,1,1).
questItems(10,3,2,2,1).
questItems(14,3,3,3,1).
questItems(18,4,5,4,1).

initQuest:-
    currentDay(D),
    questItems(Dc,X,Y,Z,C),
    write('You have to collect: \n').

quest:-
    playerloc(Xp,Yp),
    questloc(Xq,Yq),
    (Xp =:= Xq, Yp =:= Yq) -> initQuest;
    write('You are not on the Quest tile. \n').
    