/* Include necessary modules */
:- include(time).

/* declare dynamic predicates */
:- dynamic(houseOpCode/1).
:- dynamic(diaries/1).
:- dynamic(emptyDiary/1).

houseOpCode(0).
emptyDiary(0).
diaries([[0,'']]).

house:- houseOpCode(1), write('Kamu sudah berada di dalam rumah.\n'), !.
house:-
    houseOpCode(0),
    retract(houseOpCode(0)),asserta(houseOpCode(1)),
    write('Tadaima. Apa yang ingin kamu lakukan?\n'),
    write('- bobo\n- tulisDiary\n- bacaDiary\n- keluar').

writeD:-
    day(D),
    diaries(C),
    write('Tulis diary untuk hari ke-'), write(D), write('\n'),
    read(X),
    retract(diaries(C)), asserta(diaries([[0,X]|C])),
    retract(diaries([[0,X]|C])), asserta(diaries([[D,X]|C])),
    emptyDiary(A), 
    A =:= 0 -> retract(emptyDiary(0)),asserta(emptyDiary(1)).

tulisDiary:-
    currentDay(D),
    diaries([[Dc,_]|A]),
    Dc =:= D -> write('Menimpa Diary...\n'), retract(diaries([[Dc,_]|A])), asserta(diaries(A)), writeD;
    writeD.

showDiary(_,[[Day,_]|_]):- 
    Day =:= 0, write('Entri tidak ditemukan!'), !.
showDiary(X,[[Day,Entry]|Tail]):-
    X =:= Day -> write('Ini entri untuk hari ke-'), write(Day), write(':\n'), write(Entry);
    showDiary(X,Tail).

showDiaryList([[_,_]|_]):- 
    emptyDiary(A), A =:= 0, write('Diary-mu kosong, mungkin kamu mau menulis entri baru?'), !.
showDiaryList([[Day,_]|_]):- 
    Day =:= 0,
    read(X),
    diaries(Ds),
    showDiary(X,Ds), !.
showDiaryList([[Day,_]|Tail]):- 
    write('- Day '), write(Day), write('\n'),
    showDiaryList(Tail).

bacaDiary:-
    write('Ini daftar diary-mu:\n'),
    diaries(Ds),
    showDiaryList(Ds).

bobo:-
    write('Kamu memilih untuk bobo, mimpi indah ^_^.\n\n'),
    addTime,
    day(X), season(Y), isSeason(NamaMusim,Y),
    write('Day '), write(X), write(', Musim: '), write(NamaMusim),
    retract(houseOpCode(1)),asserta(houseOpCode(0)).