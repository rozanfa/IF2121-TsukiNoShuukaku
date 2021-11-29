/* declare dynamic predicates */
:- dynamic(inMarket/1).
:- dynamic(tempList/1).
:- dynamic(shovellevel/1).
:- dynamic(fishing_rodlevel/1).

shovellevel(1).
fishing_rodlevel(1).

upTool(X) :- X == shovel -> shovellevel(Y), Ym is Y+1, retract(shovellevel(Y)), asserta(shovellevel(Ym));
             X == fishing_rod -> fishing_rodlevel(Y), Ym is Y+1, retract(fishing_rodlevel(Y)), asserta(fishing_rodlevel(Ym)).

inMarket(0).
inAlchemitsState(0).
tempList([]).

springMarketCrop([turnip_seed, potato_seed, cucumber_seed, cabbage_seed]).
summmerMarketCrop([tomato_seed, corn_seed, onion_seed, pineapple_seed]).
autumnMarketCrop([carrot_seed, eggplant_seed, spinach_seed, pumpkin_seed]).

alchemitsPotion([farming_potion,fishing_potion,ranching_potion,stamina_potion,all_potion]).

/* Normal */
formList([A,B,C,D]):-
    retract(tempList(_)), asserta(tempList([A,B,C,D,chicken,cow,sheep,shovel,fishing_rod])).

showList(_,[]):- !.
showList(X,[Head|Tail]):-
    X >= 10 -> potionPrice(Head,Pr) , No is X - 9, write(No), write('. '), mkstr(Head,Str), write(Str), write(' ('), write(Pr), write(' golds)\n'), Xn is X+1, showList(Xn,Tail);
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

pickfromTemp(_,[],Item):- Item = nan, !.
pickfromTemp(X,_,Item):- X < 0, Item = nan, !.
pickfromTemp(X,[Head|_],Head):- Xm is X-1, Xm =:= 0, !.
pickfromTemp(X,[_|Tail],Item):-
    Xm is X-1, pickfromTemp(Xm,Tail,Item).

buyItem(Item,Pr,Am):-
    Total is Pr * Am,
    username(Usr), gold(Usr,X),
    (Am < 0 -> write('Jumlah tidak valid, ulangi kembali masukan!\n'), read(Am), buyItem(Item,Pr,Am);
    X < Total -> write('Jumlah gold kamu tidak cukup untuk membeli barang ini!\n\n'), buy;
    GLeft is X - Total,
    retract(gold(Usr,X)), asserta(gold(Usr,GLeft)),
    addItem(Item,Am), mkstr(Item,Str),
    write('Kamu berhasil membeli '), write(Am), write(' '), write(Str), write('.\nKamu membayar sebesar '), write(Total), write(' gold\n\n'), buy).

processTool(Item,Pr):-
    isiInventory(Isi),
    username(Usr), gold(Usr,X),
    GLeft is X - Pr, 
    retract(gold(Usr,_)), 
    asserta(gold(Usr,GLeft)),
    mkstr(Item,Str),
    (member([Item,_],Isi) -> 
        (Item == shovel -> 
            (shovellevel(Lv), Lv =:= 3 -> write('Sekop sudah mencapai level maksimal!'), nl;
            upTool(Item), Lvl is Lv + 1, write(Str), write(' berhasil di-upgrade ke level '), write(Lvl), nl, buy);
        Item == fishing_rod -> 
            (fishing_rodlevel(Lv), Lv =:= 3 -> write('Alat pancing sudah mencapai level maksimal!'), nl;
            upTool(Item), Lvl is Lv + 1, write(Str), write(' berhasil di-upgrade ke level '), write(Lvl), nl, buy));
    addItem(Item,1), write('Kamu membeli '), write(Str), write(' level 1!!'), nl, buy).

pickItem:-
    read(X),
    tempList(List),
    pickfromTemp(X,List,Item), C is X,
    (C >= 1, C < 5 -> cropPurchasePrice(Item,Pr), write('Berapa banyak yang ingin kamu beli?\n'), read(Am), buyItem(Item,Pr,Am);
    C >= 5, C < 8 -> animalPrice(Item,Pr), write('Berapa banyak yang ingin kamu beli?\n'), read(Am), buyItem(Item,Pr,Am);
    C >= 8 ->  toolPurchasePrice(Item,Pr), processTool(Item,Pr);
    write('Item tidak ditemukan.\n\n')).

buy:-
    inMarket(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam market!');
    write('Barang yang ingin dibeli? Ketikkan \"exitShop\" untuk keluar\n'),
    season(X),
    write('Musim: '), isSeason(NamaMusim,X),
    write(NamaMusim), nl,
    (X =:= 1 -> springMarketCrop(Y), formList(Y), tempList(List), showList(1,List), pickItem;
    X =:= 2 -> summmerMarketCrop(Y), formList(Y), tempList(List), showList(1,List), pickItem;
    X =:= 3 -> showRanch, autumnMarketCrop(Y), tempList(List), showList(1,List), pickItem;
    X =:= 4 -> formListWinter, showListWinter, write('\n(Tidak ada tanaman yang sedang dijual.)\n'), pickItem).

inInvChk(X,Isi,[Name,Count]):-
    member([X,_],Isi) -> member([X,Y],Isi), Name = X, Count is Y;
    Name = nan.

sellItem(Name,Count,Pr,Am):-
    Total is Pr * Am,
    (Am < 0 -> write('Jumlah tidak valid, ulangi kembali masukan!\n'), read(Am), sellItem(Name,Count,Pr,Am);
    Am =:= 0 -> write('Kamu batal menjual item.'), nl, sell;
    Count < Am -> write('Jumlah item yang kamu miliki tidak cukup!\n'), sell;
    username(Usr), gold(Usr, X),
    AmLeft is Count - Am,
    GAdd is X + Total,
    retract(gold(Usr,X)), asserta(gold(Usr,GAdd)),
    dropItem(Name,Am), mkstr(Name,Str),
    write('Kamu berhasil menjual '), write(Am), write(' '), write(Str), nl,
    write('Kamu mendapatkan '), write(Total), write(' gold dari hasil penjualan! Sisa item yang kamu jual sebanyak '), write(AmLeft), write(' buah.'), nl, sell).

sell:-
    inMarket(X),
    X =:= 0 -> write('Kamu tidak sedang berada di dalam market!');
    write('Daftar item di dalam inventory'), nl,
    isiInventory(Isi), printInventory(Isi),
    write('Barang yang ingin dijual? Ketikkan \"exitShop\" untuk keluar\n'), nl,
    read(Input),
    mkstr(Input, X),
    inInvChk(X,Isi,[Name,Count]),
    (crop(Name) -> cropSellPrice(Name, Pr), write('Berapa banyak yang ingin kamu jual?\n'), read(Am), sellItem(Name,Count,Pr,Am);
    product(Name) -> productPrice(Name, Pr), write('Berapa banyak yang ingin kamu jual?\n'), read(Am), sellItem(Name,Count,Pr,Am);
    fish(Name) -> fishPrice(Name, Pr), write('Berapa banyak yang ingin kamu jual?\n'), read(Am), sellItem(Name,Count,Pr,Am);
    write('Item ini tidak ada di dalam inventory!\n')).

market:- playerloc(Xp,Yp), marketplaceloc(Xm,Ym), (Xp =:= Xm, Yp =:= Ym -> getInMarket; write('Kamu tidak berada di tile Market!!\n')), !.
getInMarket:- inMarket(1), write('Kamu sudah berada di dalam market!.\n'), !.
getInMarket:-
    retract(inMarket(_)), asserta(inMarket(1)),
    write('Apa yang ingin kamu lakukan?\n1. (buy) Beli barang\n2. (sell) Jual barang\n3. (exitShop) Keluar dari market.\n').

exitShop:-
    write('Terima kasih sudah datang, silakan datang kembali!'),
    retract(tempList(_)), asserta(tempList([])),
    retract(inMarket(_)), asserta(inMarket(0)).