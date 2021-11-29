/* file : level.pl */

/* menambah exp utama */
addExp(X,Add):-
    retract(exp(X,CurrentExp)), NewExp is CurrentExp + Add,
    asserta(exp(X,NewExp)), write('Selamat!!! kamu mendapat '),
    write(Add), write(' Exp'), nl, levelUp(X,NewExp).

/* level utama meningkat */
levelUp(X,NewExp):-
     level(X,Level),
     (Level < 2, NewExp >= 200 -> NewLevel is 2, ResetExp is 0,
     retract(level(X,Level)), retract(exp(X,_)),
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("Congratulation!!! you just growed up to level"), write(NewLevel));

     level(X,Level),
     (Level < 3, NewExp >= 400 -> NewLevel is 3, ResetExp is 0,
     retract(level(X,Level)), retract(exp(X,_)),
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("Congratulation!!! you just growed up to level"), write(NewLevel));

     level(X,Level),
     (Level < 4, NewExp >= 800 -> NewLevel is 4, ResetExp is 0,
     retract(level(X,Level)), retract(exp(X,_)),
     addStat(X,NewLevel),
     asserta(level(X,NewLevel)), asserta(exp(X,ResetExp)),
     write("You just hit to the max level"), write(NewLevel));

     level(X,Level),
     (Level =:= 4, NewExp >= 2000 -> NewLevel is 5,
     retract(level(X,Level)), retract(exp(X,_)),
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
    asserta(farmingexp(X,NewExpFarming)), write('Selamat!!! kamu mendapat '),
    write(Add), write(' ExpFarming'), nl, levelUpFarming(X,NewExpFarming).

addExpFishing(X,Add):-
    retract(fishingexp(X,CurrentExpFishing)), NewExpFishing is CurrentExpFishing + Add,
    asserta(fishingexp(X,NewExpFishing)), write('Selamat!!! kamu mendapat '),
    write(Add), write(' ExpFishing'), nl, levelUpFishing(X,NewExpFishing).

addExpRanching(X,Add):-
    retract(ranchingexp(X,CurrentExpRanching)), NewExpRanching is CurrentExpRanching + Add,
    asserta(ranchingexp(X,NewExpRanching)), write('Selamat!!! kamu mendapat '),
    write(Add), write(' ExpRanching'), nl, levelUpRanching(X,NewExpRanching).

/* level skill meningkat */
levelUpFarming(X,ExpFarming):-
    farminglevel(X,FarmingLvl),
    FarmingLvl < 2, ExpFarming >= 300 -> NewFarmingLvl is 2, ResExpFarming is 0,
    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    asserta(farminglevel(X,NewFarmingLvl)), asserta(farmingexp(X,ResExpFarming)),
    write('Farming levelmu meningkat');

    farminglevel(X,FarmingLvl),
    FarmingLvl =:= 2, ExpFarming >= 500 -> NewFarmingLvl is 3,
    retract(farminglevel(X,FarmingLvl)), retract(farmingexp(X,_)),
    asserta(farminglevel(X,NewFarmingLvl)),
    write('Selamat!!! kamu mencapai level farming maximal');
    
    true.

levelUpFishing(X,ExpFishing):-
    fishinglevel(X,FishingLvl),
    FishingLvl < 2, ExpFishing >= 300 -> NewFishingLvl is 2, ResExpFishing is 0,
    retract(fishinglevel(X,FishingLvl)), retract(fishingexp(X,_)),
    asserta(fishinglevel(X,NewFishingLvl)), asserta(fishingexp(X,ResExpFishing),
    write('Fishing levelmu meningkat');

    fishinglevel(X,FishingLvl),
    FishingLvl =:= 2, ExpFishing >= 500 -> NewFishingLvl is 3,
    retract(fishinglevel(X,FishingLvl)), retract(fishingexp(X,_)),
    asserta(fishinglevel(X,NewFishingLvl)),
    write('Selamat!!! kamu mencapai level fishing maximal');

    true.

levelUpRanching(X,ExpRanching):-

    ranchinglevel(X,RanchingLvl),
    RanchingLvl < 2, ExpRanching >= 300 -> NewRanchingLvl is 2, ResExpRanching is 0,
    retract(ranchinglevel(X,RanchingLvl)), retract(ranchingexp(X,_)),
    asserta(ranchinglevel(X,NewRanchingLvl)), asserta(ranchingexp(X,ResExpRanching)),
    write('Raching levelmu meningkat');

    ranchinglevel(X,RanchingLvl),
    RanchingLvl =:= 2, ExpRanching >= 500 -> NewRanchingLvl is 3,
    retract(ranchinglevel(X,RanchingLvl)), retract(ranchingexp(X,_)),
    asserta(ranchinglevel(X,NewRanchingLvl)),
    write('Selamat!!! kamu mencapai level ranching maximal');

    true.
