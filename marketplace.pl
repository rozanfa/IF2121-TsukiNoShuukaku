/* declare dynamic predicates */
:- dynamic(marketState/2).
:- dynamic(marketContent/3).
:- dynamic(money/1).
:- dynamic(exp/1).
:- dynamic(inMarket/1).
:- dynamic(tempList/1).
:- dynamic(shovellevel/1).
:- dynamic(fishing_rodlevel/1).



shovellevel(1).
fishing_rodlevel(1).

upTool(X) :- X == shovel -> shovellevel(Y), Ym is Y+1, retract(shovellevel(Y)), asserta(shovellevel(Ym));
             X == fishing_rod -> fishing_rodlevel(Y), Ym is Y+1, retract(fishing_rodlevel(Y)), asserta(fishing_rodlevel(Ym));

inMarket(0).

tempList([]).

springMarketCrop([turnip_seed, potato_seed, cucumber_seed, cabbage_seed]).
summmerMarketCrop([tomato_seed, corn_seed, onion_seed, pineapple_seed]).
autumnMarketCrop([carrot_seed, eggplant_seed, spinach_seed, pumpkin_seed]).



/* Normal */
formList([A,B,C,D]):-
    retract(tempList(_)), asserta(tempList([A,B,C,D,chicken,cow,sheep,shovel,fishing_rod])).

showList(_,[]):- !.
showList(X,[Head|Tail]):-
    X >= 10 -> potionPrice(Head,Pr) ,No is X - 9, write(No), write('. '), mkstr(Head,Str), write(Str),
               potionCount(Head,Count),(Count > 0 ->
                                            write(' '), write(Count), write(' botol'), write(' ('), write(Pr), write(' golds per botol)\n');
                                            write('(habis)\n')) , Xn is X+1, showList(Xn,Tail);
    X >= 8, X < 10, shovellevel(P), fishing_rodlevel(Q), write('8. Sekop Level '), write(P), write(' (300 golds)\n9. Alat Pancing Level '), write(Q), write(' (500 golds)\n');
    X >= 1, X < 5, cropPurchasePrice(Head,Pr), write(X), write('. '), mkstr(Head,Str), write(Str), write(' ('), write(Pr), write(' golds)\n'), Xn is X+1, showList(Xn,Tail);
    X >= 5, X < 8, animalPrice(Head,Pr), write(X), write('. '), mkstr(Head,Str), write(Str), write(' ('), write(Pr), write(' golds)\n'), Xn is X+1, showList(Xn,Tail).

/* Winter */
formListWinter:-
    retract(tempList(_)), asserta(tempList([chicken,cow,sheep,shovel,fishing_rod])).
showListWinter(_,[]):- !.
showListWinter(X,[Head|Tail]):-
    X >= 4 -> shovellevel(P), fishing_rodlevel(Q), write('8. Sekop Level '), write(P), write(' (300 golds)\n9. Alat Pancing Level '), write(Q), write(' (500 golds)\n\n');
    animalPrice(Head,Pr), write(X), write('. '), mkstr(Head,Str), write(Str), write(' ('), write(Pr), write(' golds)\n'), Xn is X+1, showListWinter(Xn,Tail).

pickfromTemp(_,[],Item):- Item is nan, !.
pickfromTemp(X,_,Item):- X < 0, Item is nan, !.
pickfromTemp(X,[Head|_],Head):- Xm is X-1, Xm =:= 0, !.
pickfromTemp(X,[_|Tail],Item):-
    Xm is X-1, pickfromTemp(Xm,Tail,Item).

processItem(Item,Pr,Am):-
    Total is Pr * Am,
    gold(_,X),
    Am < 0 -> write('Jumlah tidak valid, ulang kembali masukan!\n'), read(Am), processItem(Item,Pr,Am);
    X < Total -> write('Jumlah gold kamu tidak cukup untuk membeli barang ini!\n\n'), buy;
    tool(Item) -> upTool(Item), buy;
    GLeft is X - Total,
    retract(gold(Player,X)), asserta(gold(Player,GLeft)),
    addItem(Item,Am), mkstr(Item,Str),
    write('Kamu berhasil membeli '), write(Am), write(' '), write(Str), write('.\nKamu membayar sebesar '), write(Total), write(' gold\n\n'), buy.

pickItem:-
    read(X),
    tempList(List),
    pickfromTemp(X,List,Item), C is X,
    (C >= 1, C < 5 -> cropPurchasePrice(Item,Pr), write('Berapa banyak yang ingin kamu beli?\n'), read(Am), processItem(Item,Pr,Am);
    C >= 5, C < 8 -> animalPrice(Item,Pr), write('Berapa banyak yang ingin kamu beli?\n'), read(Am), processItem(Item,Pr,Am);
    C >= 8 ->  toolPurchasePrice(Item,Pr), processItem(Item,Pr,1);
    write('Item tidak ditemukan.\n\n'), buy).

buy:-
    inMarket(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam market!');
    write('Barang yang ingin dibeli?\n'),
    season(X),
    write('Musim: '), isSeason(NamaMusim,X),
    write(NamaMusim), nl,
    X =:= 1 -> springMarketCrop(Y), formList(Y), tempList(List), showList(1,List), pickItem;
    X =:= 2 -> summmerMarketCrop(Y), formList(Y), tempList(List), showList(1,List), pickItem;
    X =:= 3 -> showRanch, autumnMarketCrop(Y), tempList(List), showList(1,List), pickItem;
    X =:= 4 -> formListWinter, showListWinter, write('\n(Tidak ada tanaman yang sedang dijual.)\n'), pickItem.

sell:-
    inMarket(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam market!');
    write('Daftar item di dalam inventory'), nl,
    write('Barang yang ingin dijual?'), nl,
    read(X),
    write(X), nl.

market:- playerloc(Xp,Yp), marketplaceloc(Xm,Ym), (Xp =:= Xm, Yp =:= Ym -> getInMarket; write('Kamu tidak berada di tile Market!!\n')), !.
getInMarket:-
    retract(inMarket(0)), asserta(inMarket(1)),
    write('Apa yang ingin kamu lakukan?\n1. (buy) Beli barang\n2. (sell) Jual barang').

exitShop:-
    write('Terima kasih sudah datang, silakan datang kembali!'),
    retract(tempList(_)), asserta(tempList([])),
    retract(inMarket(_)), asserta(inMarket(0)).

