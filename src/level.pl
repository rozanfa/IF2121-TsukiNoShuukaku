/* file : level.pl */

/* menambah exp utama */
addExp(X,Add):-
    retract(exp(X,CurrentExp)), NewExp is CurrentExp + Add,
    asserta(exp(X,NewExp)), write('Selamat!!! kamu mendapat'),
    write(Add), write('Exp'), nl, levelUp(X,NewExp).

/* level utama meningkat */
levelUp(X,NewExp):-
     retract(level(X,Level)), retract(exp(X,_)),
     (Level < 2, NewExp >= 200 -> NewLevel is 2, ResetExp is 0,
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("Congratulation!!! you just growed up to level"), write(NewLevel));

     retract(level(X,Level)), retract(exp(X,_)),
     (Level < 3, NewExp >= 400 -> NewLevel is 3, ResetExp is 0,
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("Congratulation!!! you just growed up to level"), write(NewLevel));

     retract(level(X,Level)), retract(exp(X,_)),
     (Level < 4, NewExp >= 800 -> NewLevel is 4, ResetExp is 0,
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("You just hit to the max level"), write(NewLevel));

     retract(level(X,Level)),
     (Level =:= 4, NewExp >= 2000 -> NewLevel is 5,
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)),
     write("Opss you reach this level, you will the first who became a legendary farmer"));

     write('Don\'t stop grow up, there is a present for the diligent people').

/* menambah stat pemain */

addStat(Player,NewLevel):-
    (NewLevel =:= 2 -> retract(maxStamina(Player,_)),asserta(maxStamina(Player,8)));

    (NewLevel =:= 3 -> retract(maxStamina(Player,_)),asserta(maxStamina(Player,10)));

    (NewLevel =:= 4 -> retract(maxStamina(Player,_)),asserta(maxStamina(Player,11)));

    (NewLevel =:= 5 -> retract(maxStamina(Player,_)),asserta(maxStamina(Player,12))).

/* menambah exp skill */
addExpFarming(X,Add):-
    retract(farmingexp(X,CurrentExpFarming)), NewExpFarming is CurrentExpFarming + Add,
    asserta(farmingexp(X,NewExpFarming)), write('Selamat!!! kamu mendapat'),
    write(Add), write('ExpFarming'), nl, levelUpFarming(X,NewExpFarming).

addExpFishing(X,Add):-
    retract(fishingexp(X,CurrentExpFishing)), NewExpFishing is CurrentExpFishing + Add,
    asserta(fishingexp(X,NewExpFishing)), write('Selamat!!! kamu mendapat'),
    write(Add), write('ExpFishing'), nl, levelUpFishing(X,NewExpFishing).

addExpRanching(X,Add):-
    retract(ranchingexp(X,CurrentExpRanching)), NewExpRanching is CurrentExpRanching + Add,
    asserta(ranchingexp(X,NewExpRanching)), write('Selamat!!! kamu mendapat'),
    write(Add), write('ExpRanching'), nl, levelUpRanching(X,NewExpRanching).

/* level skill meningkat */
levelUpFarming(X,ExpFarming):-
    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    FarmingLvl < 2, ExpFarming >= 300 -> NewFarmingLvl is 2, ExpFarming is 0,
    asserta(farminglevel(X,NewFarmingLvl)), asserta(farmingexp(X,ExpFarming)),
    write('Farming levelmu meningkat');

    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    FarmingLvl =:= 2, ExpFarming >= 500 -> NewFarmingLvl is 3,
    asserta(farminglevel(X,NewFarmingLvl)),
    write('Selamat!!! kamu mencapai level farming maximal').

levelUpFishing(X,ExpFishing):-
    retract(fishinglevel(X,FishingLvl)), retract(fishingexp(X,_)),
    FishingLvl < 2, ExpFishing >= 300 -> NewFishingLvl is 2, ExpFishing is 0,
    asserta(fishinglevel(X,NewFishingLvl)), asserta(fishingexp(X,ExpFishing)),
    write('Fishing levelmu meningkat');

    retract(fishinglevel(X,FishingLvl)), retract(fishingexp(X,_)),
    FishingLvl =:= 2, ExpFishing >= 500 -> NewFishingLvl is 3,
    asserta(fishinglevel(X,NewFishingLvl)),
    write('Selamat!!! kamu mencapai level fishing maximal').

levelUpRanching(X,ExpRanching):-
    retract(ranchinglevel(X,RanchingLvl)), retract(ranchingexp(X,_)),
    RanchingLvl < 2, ExpRanching >= 300 -> NewRanchingLvl is 2, ExpRanching is 0,
    asserta(ranchinglevel(X,NewRanchingLvl)), asserta(ranchingexp(X,ExpRanching)),
    write('Raching levelmu meningkat');

    retract(ranchinglevel(X,RanchingLvl)), retract(ranchingexp(X,_)),
    RanchingLvl =:= 2, ExpRanching >= 500 -> NewRanchingLvl is 3,
    asserta(ranchinglevel(X,NewRanchingLvl)),
    write('Selamat!!! kamu mencapai level ranching maximal').
