/* player.pl */

/* Job list */

/* Dynamic Variables */

:-dynamic(stamina/2).


/* Create Job */

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

initInventoryFarmer :- cheatInventory('shovel',1).
initInventoryFisher :- cheatInventory('fishing_rod',1).
initInventoryRancher :- retract(totalChicken(_)), asserta(totalChicken(1)), cheatInventory('egg',1).



/* Exp required each level */
expRequired(Username, Req) :-   level(Username, Level),
                                (
                                Level = 1 -> Req is 200;
                                Level = 2 -> Req is 400;
                                Level = 3 -> Req is 800;
                                Level = 4 -> Req is 2000;
                                Level = 5 -> Req is maximum
                                ).



/* Cek status */

checkStatus(Username) :-    write('Status kamu : '), nl,
                            write('--------------------------------------------------'),nl,
                            write('Nama             : '), write(Username), nl,
                            write('Pekerjaan        : '), job(Username, Job), write(Job), nl,
                            write('Level            : '), 
                            (level(Username, 5), write('MAX LEVEL!'), nl;
                            level(Username, Level), Level < 5, write(Level), nl),
                            write('Level farming    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            farminglevel(Username, LevelFarming), Level < 3, write(LevelFarming), nl, !),
                            write('Exp farming      : '), farmingexp(Username, ExpFarming), write(ExpFarming), nl,
                            write('Level fishing    : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            fishinglevel(Username, LevelFishing), Level < 3, write(LevelFishing), nl, !),
                            write('Exp fishing      : '), fishingexp(Username, ExpFishing), write(ExpFishing), nl,
                            write('Level ranching   : '), 
                            (level(Username, 3), write('MAX LEVEL!'), nl;
                            ranchinglevel(Username, LevelRanching), Level < 3, write(LevelRanching), nl, !),
                            write('Exp ranching     : '), ranchingexp(Username, ExpRanching), write(ExpRanching), nl,
                            write('--------------------------------------------------'),nl,
                            write('Exp              : '), exp(Username, Exp), write(Exp),  write('/'), expRequired(Username, Expr), write(Expr), nl,
                            write('Gold             : '), gold(Username, Gold), write(Gold), nl,
                            write('Stamina          : '), stamina(Username, Stamina), write(Stamina), write('/'), maxStamina(Username, MaxStamina), write(MaxStamina), nl,
                            write('--------------------------------------------------'),nl,
                            write('Musim '), season(Season), isSeason(SeasonName, Season), write(SeasonName), nl,
                            write('Hari Ke-'), day(CurrDay), write(CurrDay), nl,
                            write('Waktu saat ini : '), time(CurrTime), write(CurrTime), write('/24'), nl,
                            write('Cuaca : '), weather(CurrWeather), write(CurrWeather), nl, !.

status :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
status :- isStarted(0) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn, mabok gan??!'), !.
status :- isStarted(1) -> username(Username), checkStatus(Username).

/* Stamina */

decreaseStamina:-  ( retract(stamina(Username, CurrStamina)),
                    NewStamina is CurrStamina - 1),
                    (NewStamina > 0 -> asserta(stamina(Username, NewStamina));
                    NewStamina =< 0 -> (maxStamina(Username, MaxStamina), asserta(stamina(Username, MaxStamina)), goToHome)).

goToHome    :- retract(playerloc(_,_)),
                houseloc(X,Y),
                asserta(playerloc(X,Y)),
                addDay,addDay,
                write('Kamu tiba-tiba pingsan!'), nl,
                write('Sekarang kamu berada di rumah.'), nl,
                write('Dua hari sudah berlalu.'), nl,
                write('Perhatikan stamina kamu. Jangan sampai terlalu lelah ya!'), nl, !.

