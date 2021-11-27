/* player.pl */

/* Job list */

isJob(farmer).
isJob(fisher).
isJob(rancher).

/* Dynamic Variables */
/*
:-dynamic(farmingexp/2).
:-dynamic(fishingexp/2).
:-dynamic(ranchingexp/2).
:-dynamic(exp/2).
:-dynamic(level/2).
:-dynamic(farminglevel/2).
:-dynamic(fishinglevel/2).
:-dynamic(ranchinglevel/2).
:-dynamic(gold/2).
:-dynamic(maxStamina/2). */
:-dynamic(stamina/2).


/* Create Job */

:- dynamic(createFarmer/1).
createFarmer(X) :-  asserta(job(X, farmer)),
                    asserta(farmingexp(X, 100)),
                    asserta(fishingexp(X, 0)),
                    asserta(ranchingexp(X, 0)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 1)),
                    asserta(farminglevel(X, 1)),
                    asserta(fishinglevel(X, 1)),
                    asserta(ranchinglevel(X, 1)),
                    asserta(gold(X, 1000)),
                    asserta(maxStamina(X, 6)),
                    asserta(stamina(X, 6)),
                    initInventoryFarmer.

:- dynamic(createFisher/1).
createFisher(X) :-  asserta(job(X, fisher)),
                    asserta(farmingexp(X, 0)),
                    asserta(fishingexp(X, 100)),
                    asserta(ranchingexp(X, 0)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 1)),
                    asserta(farminglevel(X, 1)),
                    asserta(fishinglevel(X, 1)),
                    asserta(ranchinglevel(X, 1)),
                    asserta(gold(X, 1000)),
                    asserta(maxStamina(X, 6)),
                    asserta(stamina(X, 6)),
                    initInventoryFisher.

:- dynamic(createRancher/1).
createRancher(X) :- asserta(job(X, rancher)),
                    asserta(farmingexp(X, 0)),
                    asserta(fishingexp(X, 0)),
                    asserta(ranchingexp(X, 100)),
                    asserta(exp(X, 0)),
                    asserta(level(X, 1)),
                    asserta(farminglevel(X, 1)),
                    asserta(fishinglevel(X, 1)),
                    asserta(ranchinglevel(X, 1)),
                    asserta(gold(X, 1000)),
                    asserta(maxStamina(X, 6)),
                    asserta(stamina(X, 6)),
                    initInventoryRancher.


/* Initialize Inventory */

initInventoryFarmer :- initIsiInventory('shovel',1).
initInventoryFisher :- initIsiInventory('fishing_rod',1).
initInventoryRancher :- retract(totalChicken(_)), asserta(totalChicken(1)).



/* Exp required each level */
expRequired(Username, Req) :-   level(Username, Level),
                                (
                                Level = 1 -> Req is 200;
                                Level = 2 -> Req is 400;
                                Level = 3 -> Req is 800;
                                Level = 4 -> Req is 1600;
                                Level = 5 -> Req is maximum
                                ).



/* Cek status */

checkStatus(Username) :-    write('Your status : '), nl,
                            write('--------------------------------------------------'),nl,
                            write('Name             : '), write(Username), nl,
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
                            write('Stamina          : '), stamina(Username, Stamina), write(Stamina), write('/'), maxStamina(Username, MaxStamina), write(MaxStamina), nl,
                            write('--------------------------------------------------'),nl,
                            write('Musim '), season(Season), isSeason(SeasonName, Season), write(SeasonName), nl,
                            write('Hari Ke-'), day(CurrDay), write(CurrDay), nl,
                            write('Waktu sekarang : '), time(CurrTime), write(CurrTime), write('/24.'), nl, !.


/* Stamina */

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

