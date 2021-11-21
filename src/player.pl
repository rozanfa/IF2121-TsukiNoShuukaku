/* player.pl */

/* Job list */

isJob(farmer).
isJob(fisher).
isJob(rancher).

:- dynamic(createFarmer/1).
createFarmer(X) :-  asserta(class(X, farmer)),
                    asserta(farmingexp(X, 20)),
                    asserta(fishingexp(X, 0)),
                    asserta(ranchingexp(X, 0)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 0)),
                    asserta(farminglevel(X, 0)),
                    asserta(fishinglevel(X, 0)),
                    asserta(ranchinglevel(X, 0)),
                    asserta(gold(X, 1000)),
                    initInventoryFarmer.

:- dynamic(createFisher/1).
createFisher(X) :-  asserta(class(X, farmer)),
                    asserta(farmingexp(X, 0)),
                    asserta(fishingexp(X, 20)),
                    asserta(ranchingexp(X, 0)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 0)),
                    asserta(farminglevel(X, 0)),
                    asserta(fishinglevel(X, 0)),
                    asserta(ranchinglevel(X, 0)),
                    asserta(gold(X, 1000)),
                    initInventoryFisher.

:- dynamic(createRancher/1).
createRancher(X) :- asserta(class(X, rancher)),
                    asserta(farmingexp(X, 0)),
                    asserta(fishingexp(X, 0)),
                    asserta(ranchingexp(X, 20)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 0)),
                    asserta(farminglevel(X, 0)),
                    asserta(fishinglevel(X, 0)),
                    asserta(ranchinglevel(X, 0)),
                    asserta(gold(X, 1000)),
                    initInventoryRancher.



/* Definisi cek status */

checkStatus(Username) :-    write('Your status      : '), nl,
                            write('--------------------------------------------------'),nl,
                            write('Job              : '), job(Username, Job), write(Job), nl,
                            write('Level            : '), 
                            (level(Username, 5), write('MAX LEVEL!'), nl;
                            level(Username, Level), Level < 5, write(Level), nl),
                            write('Level farming    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            farminglevel(Username, Level), Level < 3, write(Level), nl),
                            write('Exp farming      : '), farmingexp(Username, Exp), write(Exp),
                            write('Level fishing    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            fishinglevel(Username, Level), Level < 3, write(Level), nl),
                            write('Exp fishing      : '), fishingexp(Username, Exp), write(Exp),
                            write('Level ranching    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            ranchinglevel(Username, Level), Level < 3, write(Level), nl),
                            write('Exp ranching      : '), ranchingexp(Username, Exp), write(Exp),
                            write('--------------------------------------------------'),nl,
                            write('Exp               : '), exp(Username, Exp), write(Exp),  write('/'), expRequired(Expr), write(Expr), nl.
                            write('Gold              : '), gold(Username, Gold), write(Gold), nl.


