/* file : level.pl */

/* menambah exp utama */
addExp(X,Add):-
    retract(exp(X,CurrentExp)), NewExp is CurrentExp + Add,
    asserta(exp(X,NewExp)), write('Congratulation!!! you got'),
    write(Add), write('Exp'), nl, levelUp(X,NewExp).

/* level utama meningkat */
levelUp(X,NewExp):-
     retract(level(X,Level)), retract(exp(X,_)),
     (Level < 1, NewExp >= 100 -> NewLevel is 1, ResetExp is 0,
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("Congratulation!!! you just growed up to level"), write(NewLevel));

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
    (NewLevel =:= 1 -> retract(stamina(Player,_)),asserta(stamina(Player,6)));

    (NewLevel =:= 2 -> retract(stamina(Player,_)),asserta(stamina(Player,8)));

    (NewLevel =:= 3 -> retract(stamina(Player,_)),asserta(stamina(Player,10)));

    (NewLevel =:= 4 -> retract(stamina(Player,_)),asserta(stamina(Player,11)));

    (NewLevel =:= 5 -> retract(stamina(Player,_)),asserta(stamina(Player,12))).

/* menambah exp skill */
addExpFarming(X,Add):-
    retract(farmingexp(X,CurrentExpFarming)), NewExpFarming is CurrentExpFarming + Add,
    asserta(farmingexp(X,NewExpFarming)), write('Congratulation!!! you got'),
    write(Add), write('ExpFarming'), nl, levelUpFarming(X,NewExpFarming).

addExpFishing(X,Add):-
    retract(fishingexp(X,CurrentExpFishing)), NewExpFishing is CurrentExpFishing + Add,
    asserta(fishingexp(X,NewExpFishing)), write('Congratulation!!! you got'),
    write(Add), write('ExpFishing'), nl, levelUpFishing(X,NewExpFishing).

addExpRanching(X,Add):-
    retract(ranchingexp(X,CurrentExpRanching)), NewExpRanching is CurrentExpRanching + Add,
    asserta(ranchingexp(X,NewExpRanching)), write('Congratulation!!! you got'),
    write(Add), write('ExpRanching'), nl, levelUpRanching(X,NewExpRanching).

/* level skill meningkat */
levelUpFarming(X,ExpFarming):-
    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    FarmingLvl < 1, ExpFarming >= 50 -> NewFarmingLvl is 1, ExpFarming is 0,
    asserta(farminglevel(X,NewFarmingLvl)), asserta(farmingexp(X,ExpFarming)),
    write('Your farming level just growed up');

    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    FarmingLvl < 2, ExpFarming >= 100 -> NewFarmingLvl is 2, ExpFarming is 0,
    asserta(farminglevel(X,NewFarmingLvl)), asserta(farmingexp(X,ExpFarming)),
    write('Your farming level just growed up');

    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    FarmingLvl =:= 2, ExpFarming >= 500 -> NewFarmingLvl is 3,
    asserta(farminglevel(X,NewFarmingLvl)),
    write('Congrats!!! you just hit the max level of farming').


levelUpFishing(X,ExpFishing):-
    retract(fishinglevel(X,FarmLvl)), retract(fishingexp(X,_)),
    FishingLvl < 1, ExpFishing >= 50 -> NewFishingLvl is 1, ExpFishing is 0,
    asserta(fishinglevel(X,NewFishingLvl)), asserta(fishingexp(X,ExpFarm)),
    write('Your fishing level just growed up');

    retract(fishinglevel(X,FarmLvl)), retract(fishingexp(X,_)),
    FishingLvl < 2, ExpFishing >= 100 -> NewFishingLvl is 2, ExpFishing is 0,
    asserta(fishinglevel(X,NewFishingLvl)), asserta(fishingexp(X,ExpFarm));

    retract(fishinglevel(X,FarmLvl)), retract(fishingexp(X,_)),
    FishingLvl =:= 2, ExpFishing >= 500 -> NewFishingLvl is 3,
    asserta(fishinglevel(X,NewFishingLvl)), asserta(fishingexp(X,ExpFarm)),
    write('Congrats!!! you just hit the max level of farming').

levelUpRanching(X,ExpRanching):-
    retract(ranchinglevel(X,FarmLvl)), retract(ranchingexp(X,_)),
    RanchingLvl < 1, ExpRanching >= 50 -> NewRanchingLvl is 1, ExpRanching is 0,
    asserta(ranchinglevel(X,NewRanchingLvl)), asserta(ranchingexp(X,ExpRanching)),
    write('Your raching level just growed up');

    retract(ranchinglevel(X,FarmLvl)), retract(ranchingexp(X,_)),
    RanchingLvl < 2, ExpRanching >= 100 -> NewRanchingLvl is 2, ExpRanching is 0,
    asserta(ranchinglevel(X,NewRanchingLvl)), asserta(ranchingexp(X,ExpRanching)),
    write('Your raching level just growed up');

    retract(ranchinglevel(X,FarmLvl)), retract(ranchingexp(X,_)),
    RanchingLvl =:= 2, ExpRanching >= 500 -> NewRanchingLvl is 3,
    asserta(ranchinglevel(X,NewRanchingLvl)), asserta(ranchingexp(X,ExpRanching)),
    write('Congrats!!! you just hit the hidden level of raching').
