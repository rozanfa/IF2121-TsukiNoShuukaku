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
ranchloc(8,10).
houseloc(8,8).
marketplaceloc(12,3).


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
water(10,10).


/* Batas map */

isBorder(X, Y) :- X =:= 0, coordinate(X, Y).
isBorder(X, Y) :- Y =:= 0, coordinate(X, Y).
isBorder(X, Y) :- X =:= 16, coordinate(X, Y).
isBorder(X, Y) :- Y =:= 16, coordinate(X, Y).


/* Print map */

map(SX, SY)     :- (playerloc(SX, SY) -> write('P');
                    isBorder(SX, SY) -> write('#');
                    water(SX, SY) -> write('o');
                    questloc(SX, SY) -> write('Q');
                    ranchloc(SX, SY) -> write('R');
                    houseloc(SX, SY) -> write('H');
                    marketplaceloc(SX, SY) -> write('M');
                    crop(SX, SY) -> write('c');
                    digged(SX, SY) -> write('=');
                    write('-')), NewX is SX + 1,
                    (SX = 15, SY = 0 -> nl;
                    SX = 15 -> nl, X = 0, NewY is SY - 1, map(X, NewY);
                    map(NewY, SY)).
                    

/* Move player */
:- dynamic(playerloc/2).
w :-    write("Bergerak ke atas.."),
        retract(playerloc(PrevX, PrevY)), NewY is PrevY + 1,
        aserta(playerloc(PrevX, NewY)),
        isMoveValid(PrevX, PrevY, PrevX, NewY).
        
a :-    write("Bergerak ke kiri.."),
        retract(playerloc(PrevX, PrevY)), NewX is PrevX - 1,
        aserta(playerloc(NewX, PrevY)),
        isMoveValid(PrevX, PrevY, NewX, PrevY).

s :-    write("Bergerak ke bawah.."),
        retract(playerloc(PrevX, PrevY)), NewY is PrevY - 1,
        aserta(playerloc(PrevX, NewY)),
        isMoveValid(PrevX, PrevY, PrevX, NewY).

d :-    write("Bergerak ke kanan.."),
        retract(playerloc(PrevX, PrevY)), NewX is PrevX + 1,
        aserta(playerloc(NewX, PrevY)),
        isMoveValid(PrevX, PrevY, NewX, PrevY).


isMoveValid(PrevX, PrevY, NewX, NewY) :-    (marketplaceloc(NewX, NewY) -> write('Welcome to Marketplace'), openMarketplace;
                                            quest(NewX, NewY) -> write('Welcome to Quest Tile!'), nl, nl, getQuest;
                                            isBorder(NewX, NewY) -> retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)), 
                                            write('Batas map tidak bisa dilewati!'), nl, !, fail;
                                            retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)).