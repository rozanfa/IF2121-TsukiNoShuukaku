:- include(quest).

:- dynamic(marketState/2).
:- dynamic(marketContent/3).
:- dynamic(money/1).
:- dynamic(exp/1).
:- dynamic(currentseason/1).

season(spring).
season(summer).
season(autumn).
season(winter).

currentseason(autumn).

springMarketContent([cabbage, lettuce]).
summmerMarketContent([tomato, lettuce]).
autumnMarketContent([potato, lettuce]).
winterMarketContent([carrot, lettuce]). 

showMarketContent(_,[]):- !.
showMarketContent(X,[Head|Tail]):-
    write(X),
    write('. '),
    write(Head),
    write('\n'),
    Y is X+1,
    showMarketContent(Y,Tail).


buy:-
    write('What do you want to buy?\n'),
    currentseason(X),
    write('Current Season: '),
    write(X), write('\n'),
    X == spring -> springMarketContent(Y), showMarketContent(1,Y);
    X == summer -> summmerMarketContent(Y), showMarketContent(1,Y);
    X == autumn -> autumnMarketContent(Y), showMarketContent(1,Y);
    X == winter -> winterMarketContent(Y), showMarketContent(1,Y).
    

sell:-
    write('Here are the items in your inventory'), write('\n'),
    write
    write('What do you want to sell?'), write('\n'),
    read(X),
    write(X), write('\n').

market:-
    write('What do you want to do?\n1. Buy\n2. Sell').