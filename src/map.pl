/* map.pl */

/* Generate koordinat map */
:- dynamic(coordinate/2).
:- dynamic(width/1).
:- dynamic(height/1).

generate(X,Y) :-    (X = 0, Y = 0 -> asserta(coordinate(0, 0));
                    X = 0 -> asserta(coordinate(0,Y)), newY is Y - 1, generate(X, NewY);
                    Y = 0 -> asserta(coordinate(X,Y)), NewY = 15, NewX is X-1, generate(NewX, NewY);
                    asserta(coordinate(X,Y)), NewY is Y-1, generate(X, NewY)).

/* Posisi tile bangunan */

questloc(2,5).
ranchloc(2,12).
houseloc(2,10).
marketplaceloc(12,3).

isBuilding(X,Y) :-  questloc(X,Y);
                    ranchloc(X,Y);
                    houseloc(X,Y);
                    marketplaceloc(X,Y).

/* Posisi Player */
:- dynamic(playerloc/2).



/* Posisi tanaman dan tanah tergali */
:- dynamic(cropLoc/2).
:- dynamic(readyCropLoc/2).
:- dynamic(digged/2).


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

isBorder(X, _) :- X == 0.
isBorder(_, Y) :- Y == 0.
isBorder(X, _) :- X == 15.
isBorder(_, Y) :- Y == 15.

isWater(X,Y) :- water(X,Y).

/* Print map */

printMap(SX, SY) :- (playerloc(SX, SY) -> write('P');
                    isBorder(SX, SY) -> write('#');
                    water(SX, SY) -> write('o');
                    questloc(SX, SY) -> write('Q');
                    ranchloc(SX, SY) -> write('R');
                    houseloc(SX, SY) -> write('H');
                    marketplaceloc(SX, SY) -> write('M');
                    cropLoc(SX, SY) -> write('c');
                    readyCropLoc(SX, SY) -> write('C');
                    digged(SX, SY) -> write('=');
                    write('-')), NewX is SX + 1,
                    (SX = 15, SY = 0 -> nl;
                    SX = 15 -> nl, X = 0, NewY is SY - 1, printMap(X, NewY);
                    printMap(NewX, SY)).
                    




/* Move player */

w :-    write('Bergerak ke atas..'), nl, 
        retract(playerloc(PrevX, PrevY)), NewY is PrevY + 1,
        asserta(playerloc(PrevX, NewY)),
        isMoveValid(PrevX, PrevY, PrevX, NewY), !.
        
a :-    write('Bergerak ke kiri..'), nl,
        retract(playerloc(PrevX, PrevY)), NewX is PrevX - 1,
        asserta(playerloc(NewX, PrevY)),
        isMoveValid(PrevX, PrevY, NewX, PrevY), !.

s :-    write('Bergerak ke bawah..'), nl,
        retract(playerloc(PrevX, PrevY)), NewY is PrevY - 1,
        asserta(playerloc(PrevX, NewY)),
        isMoveValid(PrevX, PrevY, PrevX, NewY), !.

d :-    write('Bergerak ke kanan..'), nl,
        retract(playerloc(PrevX, PrevY)), NewX is PrevX + 1,
        asserta(playerloc(NewX, PrevY)),
        isMoveValid(PrevX, PrevY, NewX, PrevY), !.


isMoveValid(PrevX, PrevY, NewX, NewY) :-    (marketplaceloc(NewX, NewY) -> write('Selamat datang di Marketplace!'), nl,addTime;
                                            questloc(NewX, NewY) -> write('Selamat datang di Quest!'), nl,addTime;
                                            houseloc(NewX, NewY) -> write('Sekarang kamu berada di rumah!'), nl,addTime;
                                            ranchloc(NewX, NewY) -> write('Sekarang kamu berada di kandang!'), nl,addTime;
                                            isBorder(NewX, NewY) -> retract(playerloc(NewX,NewY)), asserta(playerloc(PrevX, PrevY)), 
                                            write('Batas map tidak bisa dilewati!'), nl, fail, !;
                                            isWater(NewX, NewY) -> retract(playerloc(NewX, NewY)), asserta(playerloc(PrevX, PrevY)),
                                            write('Kamu tidak bisa berjalan di atas air!'), nl, fail, !;
                                            (\+ isWater(NewX, NewY), \+ isBorder(NewX, NewY)) -> addTime).