/* player.pl */

/* Job list */

isJob(farmer).
isJob(fisher).
isJob(rancher).

:-dynamic(stamina/2).
:- dynamic(createFarmer/1).
createFarmer(X) :-  asserta(job(X, farmer)),
                    asserta(farmingexp(X, 20)),
                    asserta(fishingexp(X, 0)),
                    asserta(ranchingexp(X, 0)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 1)),
                    asserta(farminglevel(X, 1)),
                    asserta(fishinglevel(X, 1)),
                    asserta(ranchinglevel(X, 1)),
                    asserta(gold(X, 1000)),
                    asserta(maxStamina(X, 8)),
                    initInventoryFarmer.

:- dynamic(createFisher/1).
createFisher(X) :-  asserta(job(X, farmer)),
                    asserta(farmingexp(X, 0)),
                    asserta(fishingexp(X, 20)),
                    asserta(ranchingexp(X, 0)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 1)),
                    asserta(farminglevel(X, 1)),
                    asserta(fishinglevel(X, 1)),
                    asserta(ranchinglevel(X, 1)),
                    asserta(gold(X, 1000)),
                    asserta(maxStamina(X, 8)),
                    initInventoryFisher.

:- dynamic(createRancher/1).
createRancher(X) :- asserta(job(X, rancher)),
                    asserta(farmingexp(X, 0)),
                    asserta(fishingexp(X, 0)),
                    asserta(ranchingexp(X, 20)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 1)),
                    asserta(farminglevel(X, 1)),
                    asserta(fishinglevel(X, 1)),
                    asserta(ranchinglevel(X, 1)),
                    asserta(gold(X, 1000)),
                    asserta(maxStamina(X, 8)),
                    initInventoryRancher.

/* DUMMY */
expRequired(a,200).
stamina(a, 5).
initInventoryFarmer.
initInventoryFisher.
initInventoryRancher.
/* END DUMMY */

/* Definisi cek status */

checkStatus(Username) :-    write('Your status : '), nl,
                            write('--------------------------------------------------'),nl,
                            write('Job              : '), job(Username, Job), write(Job), nl,
                            write('Level            : '), 
                            (level(Username, 5), write('MAX LEVEL!'), nl;
                            level(Username, Level), Level < 5, write(Level), nl),
                            write('Level farming    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            farminglevel(Username, Level), Level < 3, write(Level), nl, !),
                            write('Exp farming      : '), farmingexp(Username, ExpFarming), write(ExpFarming), nl,
                            write('Level fishing    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            fishinglevel(Username, Level), Level < 3, write(Level), nl, !),
                            write('Exp fishing      : '), fishingexp(Username, ExpFishing), write(ExpFishing), nl,
                            write('Level ranching   : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            ranchinglevel(Username, Level), Level < 3, write(Level), nl, !),
                            write('Exp ranching     : '), ranchingexp(Username, ExpRanching), write(ExpRanching), nl,
                            write('--------------------------------------------------'),nl,
                            write('Exp              : '), exp(Username, Exp), write(Exp),  write('/'), expRequired(Username, Expr), write(Expr), nl,
                            write('Gold             : '), gold(Username, Gold), write(Gold), nl,
                            write('Stamina          : '), stamina(Username, Stamina), write(Stamina), write('/'), maxStamina(Username, MaxStamina), write(MaxStamina), nl, !.


decreaseStamina:-  ( retract(stamina(Username, CurrStamina)),
                    NewStamina is CurrStamina - 1),
                    (NewStamina > 0 -> asserta(stamina(Username, NewStamina));
                    NewStamina =< 0 -> goToHome).

goToHome    :- retract(playerloc(_,_)),
                houseloc(X,Y),
                asserta(playerloc(X,Y)),
                maxStamina(Username, MaxStamina),
                retract(stamina(Username, _)),
                asserta(maxStamina(Username, MaxStamina)),
                addDay,
                write("Kamu tiba-tiba pingsan!"), nl,
                write("Sekarang kamu berada di rumah."), nl,
                write("Satu hari sudah berlalu."), nl,
                write("Perhatikan stamina kamu. Jangan sampai terlalu lelah ya!"), nl, !.

