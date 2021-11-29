/* declare dynamic predicates */
:- dynamic(currentQuest/1).
:- dynamic(inQuest/1).
:- dynamic(questCounter/1).

currentQuest([0,0,0,0,0]).
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
    crop(X) -> currentQuest([Z,Y,_,_,_]), Ym is Y+1, retract(currentQuest([A,Y,B,C,D])), asserta(currentQuest([A,Ym,B,C,D])), questCheck(Z);
    fish(X) -> currentQuest([Z,_,Y,_,_]), Ym is Y+1, retract(currentQuest([A,B,Y,C,D])), asserta(currentQuest([A,B,Ym,C,D])), questCheck(Z);
    product(X) -> currentQuest([Z,_,_,Y,_]), Ym is Y+1, retract(currentQuest([A,B,C,Y,D])), asserta(currentQuest([A,B,C,Ym,D])), questCheck(Z).

questCheck(X):-
    questItems(X,A,B,C,G),
    currentQuest([X,D,E,F,_]),
    (D >= A, E >= B, F >= C) -> write('Quest Selesai!'), retract(currentQuest([_,_,_,_,_])), asserta(currentQuest([0,0,0,0,0])),
    retract(inQuest(1)), asserta(inQuest(0)),
    questCounter(P), Pm is P+1,
    retract(questCounter(P)), asserta(questCounter(Pm)),
    exp(Player,C), Cp is C+G,
    addExp(Player,Cp),
    Gm is (G * 2) + (G / 2),
    gold(Player,C), Cp is C+Gm,
    retract(gold(Player,C)), asserta(gold(Player,Cp))
    Pm =:= 5 -> write('Selamat! Kamu telah menyelesaikan seluruh quest!!'), nl.

quest:- playerloc(Xp,Yp), questloc(Xq,Yq), inQuest(S), (Xp =:= Xq, Yp =:= Yq, S =:= 0 -> initQuest;
    S =:= 1 -> write('Kamu sedang menjalankan quest lain!');
    write('Kamu sedang tidak berada di Tile Quest. \n')).
initQuest:-
    questCounter(C),
    Cp is C+1,
    (Cp =:= 6 -> write('Kamu sudah menjalankan seluruh Quest!!'), nl;
    questItems(Cp,X,Y,Z,_),
    write('Kamu mendapatkan quest baru!\n\n Kamu harus mengumpulkan: \n'),
    write('- '), write(X), write(' hasil panen\n'),
    write('- '), write(Y), write(' ikan\n'),
    write('- '), write(Z), write(' hasil ternak\n'),
    retract(inQuest(_)), asserta(inQuest(1)),
    retract(currentQuest([0,_,_,_,_])), asserta(currentQuest([Cp,_,_,_,_]))).