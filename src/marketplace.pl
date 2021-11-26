/* Include necessary modules */
:- include(quest).
:- include(house).
:- include(items).
:- include(player).
:- include(time).

/* declare dynamic predicates */
:- dynamic(marketState/2).
:- dynamic(marketContent/3).
:- dynamic(money/1).
:- dynamic(exp/1).
:- dynamic(inMarketState/1).

inMarketState(0).

springMarketCrop([turnip_seed, potato_seed, cucumber_seed, cabbage_seed]).
summmerMarketCrop([tomato_seed, corn_seed, onion_seed, pineapple_seed]).
autumnMarketCrop([carrot_seed, eggplant_seed, sweet_potato_seed, green_pepper_seed]).


showMarketCrop(_,[]):- !.
showMarketCrop(X,[Head|Tail]):-
    cropPurchasePrice(Head,Price),
    write(X), write('. '), write(Head), write(' ('), write(Price), write(' golds'), write('\n'),
    Y is X+1,
    showMarketCrop(Y,Tail).

showRanch:-
    write('3. Chicken ('), animalPrice(chicken, X), write(X),  write(' golds'), write('\n'),
    write('4. Cow ('), animalPrice(cow, X), write(X), write(' golds'), write('\n'),
    write('5. Sheep ('), animalPrice(sheep, X), write(X), write(' golds'), write('\n'),

showTool:-
    toolPurchasePrice(shovel,X).
    toolPurchasePrice(fishing_rod,Y).
    write('1. Shovel ('), write(X), write(' golds'), write('\n'),
    write('2. Fishing Rod ('), write(Y), write(' golds'), write('\n'),

pickItem:-
    write('not implemented.')

buy:-
    write('Barang yang ingin dibeli?\n'),
    season(X),
    write('Musim: '), isSeason(NamaMusim,X)
    write(NamaMusim), write('\n'),
    X =:= 1 -> showTool, showRanch, springMarketContent(Y), showMarketCrop(6,Y), pickItem;
    X =:= 2 -> showTool, showRanch, summmerMarketContent(Y), showMarketCrop(6,Y), pickItem;
    X =:= 3 -> showTool, showRanch, autumnMarketContent(Y), showMarketCrop(6,Y), pickItem;
    X =:= 4 -> showTool, showRanch, write('\n(Tidak ada crop yang sedang dijual.)\n'), pickItem.
    

sell:-
    write('Daftar item di dalam inventory'), write('\n'),
    write
    write('Barang yang ingin dijual?'), write('\n'),
    read(X),
    write(X), write('\n').

market:-
    retract(inMarketState(0)), asserta(inMarketState(1)),
    playerloc(Xp,Yp),
    marketplaceloc(Xm,Ym),
    (Xp =:= Xq, Yp =:= Yq) -> initMarket;
    write('Kamu tidak sedang berada di Marketplace. \n').
    write('Apa yang ingin kamu lakukan?\n1. Beli barang\n2. Jual barang').

exitShop:-
    write('Terima kasih sudah datang, silakan datang kembali!'),
    retract(inMarketState(_)), asserta(inMarketState(0)),