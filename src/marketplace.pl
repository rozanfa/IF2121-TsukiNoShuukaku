/* Include necessary modules */
:- include(quest).
:- include(house).
:- include(items).
:- include(player).

/* declare dynamic predicates */
:- dynamic(marketState/2).
:- dynamic(marketContent/3).
:- dynamic(money/1).
:- dynamic(exp/1).
:- dynamic(inMarketState/1).

inMarketState(0).

springMarketCrop([turnip, potato, cucumber, cabbage]).
summmerMarketCrop([tomato, corn, onion, pineapple]).
autumnMarketCrop([carrot, eggplant, sweet_potato, green_paper]).

showMarketCrop(_,[]):- !.
showMarketCrop(X,[Head|Tail]):-
    cropPurchasePrice(Head,Price),
    write(X), write('. '), write(Head), write(' ('), write(Price), write(' golds'), write('\n'),
    Y is X+1,
    showMarketCrop(Y,Tail).

showRanch:-
    write('5. Chicken (golds'), write('\n'),
    write('6. Sheep (golds'), write('\n'),
    write('7. Cow (golds'), write('\n'),

showTool:-
    toolPurchasePrice(shovel,X).
    toolPurchasePrice(fishing_rod,Y).
    write('8. Shovel ('), write(X), write(' golds'), write('\n'),
    write('9. fishing rod ('), write(Y), write(' golds'), write('\n'),

pickItem:-
    write('not implemented.')

buy:-
    write('Barang yang ingin dibeli?\n'),
    currentseason(X),
    write('Musim: '),
    write(X), write('\n'),
    X == spring -> springMarketContent(Y), showMarketCrop(1,Y), showRanch, showTool, pickItem;
    X == summer -> summmerMarketContent(Y), showMarketCrop(1,Y), showRanch, showTool, pickItem;
    X == autumn -> autumnMarketContent(Y), showMarketCrop(1,Y), showRanch, showTool, pickItem;
    X == winter -> winterMarketContent(Y), showMarketCrop(1,Y), showRanch, showTool, pickItem.
    

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