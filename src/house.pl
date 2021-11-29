/* declare dynamic predicates */
:- dynamic(inHouse/1).
:- dynamic(diaries/1).
:- dynamic(emptyDiary/1).

inHouse(0).
emptyDiary(0).
diaries([[0,'']]).

house:- playerloc(Xp,Yp), houseloc(Xh,Yh), (Xp =:= Xh, Yp =:= Yh -> getInHouse; write('Kamu tidak berada di tile Rumah!!\n')), !.
getInHouse:- inHouse(1), write('Kamu sudah berada di dalam rumah.\n'), !.
getInHouse:-
    retract(inHouse(_)),asserta(inHouse(1)),
    write('Tadaima. Apa yang ingin kamu lakukan?\n'),
    write('- bobo\n- tulisDiary\n- bacaDiary\n- keluar').

writeD:-
    day(D),
    diaries(C),
    write('Tulis diary untuk hari ke-'), write(D), write('\n'),
    read(X),
    /* writeFile(D) */
    retract(diaries(C)), asserta(diaries([[0,X]|C])),
    retract(diaries([[0,X]|C])), asserta(diaries([[D,X]|C])),
    emptyDiary(A), 
    A =:= 0 -> retract(emptyDiary(0)),asserta(emptyDiary(1)).

tulisDiary:-
    inHouse(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam rumah!');
    day(D),
    diaries([[Dc,_]|A]),
    Dc =:= D -> write('Menimpa Diary...\n'), retract(diaries([[Dc,_]|A])), asserta(diaries(A)), writeD;
    writeD.

showDiary(_,[[Day,_]|_]):- 
    Day =:= 0, write('Entri tidak ditemukan!'), !.
showDiary(X,[[Day,Entry]|Tail]):-
    X =:= Day -> write('Ini entri untuk hari ke-'), write(Day), write(':\n'), write(Entry) /* readFile(Day) */;
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
    inHouse(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam rumah!');
    write('Ini daftar diary-mu:\n'),
    diaries(Ds),
    showDiaryList(Ds).

bobo:-
    inHouse(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam rumah!');
    write('Kamu memilih untuk bobo, mimpi indah ^_^.\n\n'),
    addDay, retract(time(_)), asserta(time(0)),
    day(X), season(Y), isSeason(NamaMusim,Y),
    write('Day '), write(X), write(', Musim: '), write(NamaMusim),
    retract(inHouse(1)), asserta(inHouse(0)),
    username(Usr), maxStamina(Usr,MS), retract(stamina(Usr,_)), asserta(stamina(Usr,MS)).

/* ====================== SAVE - LOAD SECTION ======================*/

/* TEST 
username(claire). job(claire,farmer).
isiInventory([[amogus,1],[pepega,2]]).
time(6). day(8). season(2).
currentQuest([2,2,0,1,20]). inQuest(1). questCounter(1).
exp(claire, 50). farmingexp(claire, 18). fishingexp(claire, 8). ranchingexp(claire, 12).
level(claire, 7). farminglevel(claire, 5). fishinglevel(claire, 3). ranchinglevel(claire, 4).
gold(claire, 5000). maxStamina(claire, 15). stamina(claire, 12). diaries([1,'Pengen meninggal.']).

writeFile(N):-
    atom_concat(N,'.txt',FileName),
    open(FileName,write,Stream),
    username(X), job(X,Job),
    isiInventory(Inv),
    time(Time), day(Day), season(Season),
    currentQuest(CurrQ), inQuest(InQ), questCounter(CountQ),
    exp(X, XP), farmingexp(X, FarmXP), fishingexp(X, FishXP), ranchingexp(X, RanchXP), 
    level(X, Lvl), farminglevel(X, FarmLvl), fishinglevel(X, FishLvl), ranchinglevel(X, RanchLvl),
    gold(X, Gold), maxStamina(X, MaxSta), stamina(X, Sta), diaries(Diary),
    writeq(Stream,[X,Job,Inv,[Time,Day,Season],[CurrQ,InQ,CountQ],[XP, FarmXP, FishXP, RanchXP],[Lvl, FarmLvl, FishLvl, RanchLvl],Gold,MaxSta,Sta,Diary]), close(Stream).

readFile(N):-
    atom_concat(N,'.txt',FileName),
    open(FileName,read,Stream),
    read_atom(Stream, Lines),
    close(Stream),
    write(Lines).

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L). */