/* Include necessary modules */
:- include(map).
:- include(items).
:- include(house).
:- include(player).
:- include(level).

/* declare dynamic predicates */
:- dynamic(currentQuest/5).
:- dynamic(inQuest/1).
:- dynamic(questCounter/1).

currentQuest(0,0,0,0,0).
inQuest(0).
questCounter(0).

/* Hardcoding list of quests */
questItems(1,1,1,1,10).
questItems(2,2,2,1,20).
questItems(3,3,2,2,30).
questItems(4,3,3,3,40).
questItems(5,4,5,4,50).

progQuest(X):- inQuest(Chk), Chk =:= 0, !.
progQuest(X):-
    crop(X) -> currentQuest(Z,Y,_,_,_), Ym is Y+1, retract(currentQuest(_,Y,_,_,_)), asserta(currentQuest(_,Ym,_,_,_)), questCheck(Z);
    fish(X) -> currentQuest(Z,_,Y,_,_), Ym is Y+1, retract(currentQuest(_,_,Y,_,_)), asserta(currentQuest(_,_,Ym,_,_)), questCheck(Z);
    product(X) -> currentQuest(Z,_,_,Y,_), Ym is Y+1, retract(currentQuest(_,_,_,Y,_)), asserta(currentQuest(_,_,_,Ym,_)), questCheck(Z).

questCheck(X):-
    questItems(X,A,B,C,G),
    currentQuest(X,D,E,F,_),
    (A =:= D, B =:= E, C =:= F) -> write('Quest Selesai!'), retract(currentQuest(_,_,_,_,_)), asserta(currentQuest(0,0,0,0,0)),
    retract(inQuest(1)), asserta(inQuest(0)),
    questCounter(P), Pm is P+1,
    retract(questCounter(P)), asserta(questCounter(Pm)),
    exp(Player,C), Cp is C+G,
    addExp(Player,Cp),
    Gm is (G * 2) + (G / 2),
    gold(Player,C), Cp is C+Gm,
    retract(gold(Player,C)), asserta(gold(Player,Cp)).

initQuest:-
    questCounter(C),
    Cp is C+1,
    retract(questCounter(C)), asserta(questCounter(Cp)),
    questItems(Cp,X,Y,Z,_),
    write('Kamu mendapatkan quest baru!\n\n Kamu harus mengumpulkan: \n'),
    write('- '), write(X), write(' hasil panen\n'),
    write('- '), write(Y), write(' ikan\n'),
    write('- '), write(Z), write(' hasil ternak\n'),
    retract(inQuest(0)), asserta(inQuest(1)),
    retract(currentQuest(0,_,_,_,_)), asserta(currentQuest(Cp,_,_,_,_)).

quest:-
    playerloc(Xp,Yp),
    questloc(Xq,Yq),
    inQuest(S),
    (Xp =:= Xq, Yp =:= Yq, S =:= 0) -> initQuest;
    S =:= 1 -> write('Kamu sedang menjalankan quest lain!');
    write('Kamu sedang tidak berada di Tile Quest. \n').