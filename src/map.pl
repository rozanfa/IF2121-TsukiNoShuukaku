/* map.pl */

/* Posisi tile bangunan */

questloc(2,5).
ranchloc(2,12).
houseloc(2,10).
marketplaceloc(12,3).
:- dynamic(alchemistloc/4).
alchemistloc(9,1,0,6).


cannotbeDigged(X,Y) :-  questloc(X,Y);
                        ranchloc(X,Y);
                        houseloc(X,Y);
                        marketplaceloc(X,Y);
                        croploc(X,Y,_,_);
                        digloc(X,Y);
                        alchemistloc(X,Y,TP,_),
                        (TP > 0 -> true; false).

/* Posisi Player */
:- dynamic(playerloc/2).

/* Posisi Tanaman */
:- dynamic(croploc/4).
:- dynamic(digloc/2).

/* Posisi tile air */

water(15,15).
water(15,14).
water(15,13).
water(15,12).
water(15,11).
water(15,10).
water(14,15).
water(14,14).
water(14,13).
water(14,12).
water(14,11).
water(13,15).
water(13,14).
water(13,13).
water(13,12).
water(13,11).
water(12,15).
water(12,14).
water(12,13).
water(12,12).
water(12,11).
water(12,10).
water(11,14).
water(11,13).
water(11,12).
water(11,11).
water(11,10).
water(10,14).
water(10,13).
water(10,12).
water(10,11).
water(9,15).
water(9,14).
water(9,13).
water(9,12).
water(8,15).
water(8,14).
water(8,13).


/* Batas map */

isBorder(X, _) :- X < 1.
isBorder(_, Y) :- Y < 1.
isBorder(X, _) :- X > 14.
isBorder(_, Y) :- Y > 14.

isWater(X,Y) :- water(X,Y).

/* Print map */

printMap(SX, SY) :- (playerloc(SX, SY) -> write('P');
                    isBorder(SX, SY) -> write('#');
                    water(SX, SY) -> write('o');
                    questloc(SX, SY) -> write('Q');
                    ranchloc(SX, SY) -> write('R');
                    houseloc(SX, SY) -> write('H');
                    marketplaceloc(SX, SY) -> write('M');
                    croploc(SX,SY,_,_) -> write('c');
                    digloc(SX, SY) -> write('=');
                    alchemistloc(SX, SY, TP, _) ->
                        (TP > 0 -> write('A');
                                   write('-'));
                    write('-')), NewX is SX + 1,
                    (SX = 15, SY = 0 -> nl;
                    SX = 15 -> nl, X = 0, NewY is SY - 1, printMap(X, NewY);
                    printMap(NewX, SY)).

map :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
map :- isStarted(0) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn, mabok gan??!'), !.
map :- isStarted(1) -> printMap(0,15), !.


/* Move player */
w :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
w :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.
w :-    write('Bergerak ke atas..'), nl,
        retract(playerloc(PrevX, PrevY)), NewY is PrevY + 1,
        asserta(playerloc(PrevX, NewY)),
        isMoveValid(PrevX, PrevY, PrevX, NewY), !.

a :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
a :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.
a :-    write('Bergerak ke kiri..'), nl,
        retract(playerloc(PrevX, PrevY)), NewX is PrevX - 1,
        asserta(playerloc(NewX, PrevY)),
        isMoveValid(PrevX, PrevY, NewX, PrevY), !.

s :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
s :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.
s :-    write('Bergerak ke bawah..'), nl,
        retract(playerloc(PrevX, PrevY)), NewY is PrevY - 1,
        asserta(playerloc(PrevX, NewY)),
        isMoveValid(PrevX, PrevY, PrevX, NewY), !.

d :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
d :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.
d :-    write('Bergerak ke kanan..'), nl,
        retract(playerloc(PrevX, PrevY)), NewX is PrevX + 1,
        asserta(playerloc(NewX, PrevY)),
        isMoveValid(PrevX, PrevY, NewX, PrevY), !.


isMoveValid(PrevX, PrevY, NewX, NewY) :-    (marketplaceloc(NewX, NewY) -> write('Selamat datang di Marketplace!'), nl,addTime;
                                            questloc(NewX, NewY) -> write('Selamat datang di Quest!'), nl,addTime;
                                            houseloc(NewX, NewY) -> write('Sekarang kamu berada di rumah!'), nl,addTime;
                                            ranchloc(NewX, NewY) -> write('Sekarang kamu berada di kandang!'), nl,addTime;
                                            alchemistloc(NewX, NewY,TP,_) ->
                                                (TP > 0 -> write('Sekarang kamu berada di alchemist!'), nl, !;
                                                           true), addTime;
                                            isBorder(NewX, NewY) -> retract(playerloc(NewX,NewY)), asserta(playerloc(PrevX, PrevY)), 
                                            write('Batas map tidak bisa dilewati!'), nl, !;
                                            isWater(NewX, NewY) -> retract(playerloc(NewX, NewY)), asserta(playerloc(PrevX, PrevY)),
                                            write('Kamu tidak bisa berjalan di atas air!'), nl, !;
                                            (\+ isWater(NewX, NewY), \+ isBorder(NewX, NewY)) -> addTime).


/* Teleport */

gachaPeriTidur :-       random(1,6,X),
                        (X = 2 -> periTidur;
                        \+ X = 2 -> true).

teleport :-     write('    ____________'),nl,
                write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                write('|                                                                                   |'),nl,
                write('|  Kamu ingin pergi ke mana?                                                        |'),nl,
                write('|                                                                                   |'),nl,
                write('|-----------------------------------------------------------------------------------|'),nl,
                write('Masukkan koordinat x: '), read(XT),
                write('Masukkan koordinat y: '), read(YT),
                (isBorder(XT, YT) ->
                        write('    ____________'),nl,
                        write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                        write('|                                                                                   |'),nl,
                        write('|  Tempat itu terlalu jauh.                                                         |'),nl,
                        write('|  Aku hanya bisa membawamu pergi ke sekitar desa ini saja.                         |'),nl,
                        write('|-----------------------------------------------------------------------------------|'),nl, teleport;
                isWater(XT, YT) ->
                        write('    ____________'),nl,
                        write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                        write('|                                                                                   |'),nl,
                        write('|  Itu adalah tile air!                                                             |'),nl,
                        write('|  Kamu kan tidak bisa berenang :(                                                  |'),nl,
                        write('|-----------------------------------------------------------------------------------|'),nl, teleport;

                (\+ isBorder(XT, YT), \+ isWater(XT, YT)) -> 
                        write('    ____________'),nl,
                        write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                        write('|                                                                                   |'),nl,
                        write('|  Baiklah! Aku akan membawamu ke sana..                                            |'),nl,
                        write('|                                                                                   |'),nl,
                        write('|-----------------------------------------------------------------------------------|'),nl,
                        write('ketik \"next.\" untuk lanjut'),  nl, read(_),
                        retract(playerloc(_,_)), asserta(playerloc(XT,YT)),
                        write('    ____________'),nl,
                        write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                        write('|                                                                                   |'),nl,
                        write('|  Sudah sampai!                                                                    |'),nl,
                        write('|  Semoga harimu menyenangkan!                                                      |'),nl,
                        write('|-----------------------------------------------------------------------------------|'),nl
                ), !. 

periTidur :-      nl,
                write('-----------------------------[ Kamu bertemu Peri Tirur ]-----------------------------'), nl,
                write('    ____________'),nl,
                write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                write('|                                                                                   |'),nl,
                write('|  Halo, Claire! Selamat pagi..                                                     |'),nl,
                write('|                                                                                   |'),nl,
                write('|-----------------------------------------------------------------------------------|'),nl,
                write('ketik \"next.\" untuk lanjut'),  nl, read(_),

                write('    ____________'),nl,
                write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                write('|                                                                                   |'),nl,
                write('|  Aku adalah peri tidur. Aku bisa membawamu kemanapun yang kau mau di desa ini.    |'),nl,
                write('|                                                                                   |'),nl,
                write('|-----------------------------------------------------------------------------------|'),nl,
                write('ketik \"next.\" untuk lanjut'),  nl, read(_),


                write('    ____________'),nl,
                write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                write('|                                                                                   |'),nl,
                write('|  Apakah kamu sedang ingin pergi ke suatu tempat?                                  |'),nl,
                write('|                                                                                   |'),nl,
                write('|-----------------------------------------------------------------------------------|'),nl,
                write('Jawabanmu (ya/tidak): '), read(Choice), nl,
                (Choice = ya  -> teleport;
                Choice = y  -> teleport;
                Choice = yes  -> teleport;
                (\+ Choice = ya, \+ Choice = y, \+ Choice = yes)  -> 
                        write('    ____________'),nl,
                        write('|--[ Peri Tidur ]-------------------------------------------------------------------|'),nl,
                        write('|                                                                                   |'),nl,
                        write('|  Baiklah kalau begitu. Semoga harimu menyenangkan!                                |'),nl,
                        write('|  Selamat tinggal..                                                                |'),nl,
                        write('|-----------------------------------------------------------------------------------|'),nl), !.