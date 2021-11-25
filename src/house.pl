/* declare dynamic predicates */
:- dynamic(houseOpCode/1).
:- dynamic(currentDay/1).
:- dynamic(currentSeason/1).
:- dynamic(diaries/1).
:- dynamic(emptyDiary/1).

/* Central Time Control */
currentSeason(semi).
currentDay(1).

/* init season */
season(semi).
season(panas).
season(gugur).
season(dingin).

houseOpCode(0).
emptyDiary(0).
diaries([[0,'']]).

checkDay(D):-
    D == 0, D < 7 -> currentSeason(X), write('musim: '), write(X);
    D == 7 -> retract(currentSeason(_)), asserta(currentSeason(panas)), write('musim: panas');
    D == 13 -> retract(currentSeason(_)), asserta(currentSeason(gugur)), write('musim: gugur');
    D == 19 -> retract(currentSeason(_)), asserta(currentSeason(dingin)), write('musim: dingin');
    D == 25 -> write('Kamu telah berusaha, namun sayang sekali kamu masih jauh dari kesuksesan. Silakan coba lagi dan tetap semangat!');
    currentSeason(X), write('musim: '), write(X).

house:- houseOpCode(1), write('Kamu sudah berada di dalam rumah.\n'), !.
house:-
    houseOpCode(0),
    retract(houseOpCode(0)),asserta(houseOpCode(1)),
    write('Tadaima. Apa yang ingin kamu lakukan?\n'),
    write('- bobo\n- tulisDiary\n- bacaDiary\n- keluar').

writeD:-
    currentDay(D),
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
    write('Kamu memilih untuk bobo, mimpi indah ^_^.\n'),
    currentDay(X),
    Y is X+1,
    retract(currentDay(X)),asserta(currentDay(Y)),
    checkDay(Y),
    retract(houseOpCode(1)),asserta(houseOpCode(0)).