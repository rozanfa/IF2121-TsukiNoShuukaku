/* file : activities.pl */

:- include('inventory.pl').
:- include('map.pl').
:- include('items.pl').


/* Farming */
dig :- playerloc(X,Y), asserta(digloc(X,Y)), write('You digged the tile').

plant :- playerloc(X,Y), digloc(X,Y),write('You have:'), nl,
         crop_Seed(Seed), printInventory([[Seed,Count]|Other]), nl,
         write('What do you want to plant?'), nl,
         read(Crop), atom_concat(X,'_seed',Z), dropItem(Z,1), playerloc(X,Y), asserta(croploc(X,Y)),
         write('you planted a '), write(Crop), write(' seed.'), retract(digloc(X,Y)).

harvest :- playerloc(X,Y), croploc(X,Y,Crop,0), crop(Crop), addItem(Crop,1), write('you harvested '), write(Crop), write('.'), nl,
           write('you gained 2 farming exp'), 
           farmingexp(Username, X), Z is X+2, asserta(farmingexp(Username, Z)), retract(farmingexp(Username, X)), retract(croploc(X,Y)).

/* Fishing */

fish :- random(1,5,Z), getFishing(Z,X), fishing(X). 
fishing(Fishing) :- Fishing==fish, random(1,6,_Y), getFish(_Y,Fish),
                    write('You got '), write(Fish), write('!'), nl,
                    write('You gained 10 fishing exp'), 
                    fishingexp(Username, X),Z is X+10, asserta(fishingexp(Username, Z)), retract(fishingexp(Username, X);
                    Fishing==none
                    write('You didn’t get anything!'), nl,
                    write('You gained 5 fishing exp'), fishingexp(Username, X),Z is X+5, asserta(fishingexp(Username, Z)), retract(fishingexp(Username, X)).
/* Ranching */
ranch :- playerloc(X,Y), ranchloc(X,Y) isProduct(X,wool), ranchSheep.
ranching(X) :- isAnimal(X), isProduct(X,egg), ranchChicken.
ranching(X) :- isAnimal(X), isProduct(X,milk), ranchCow.

ranchSheep :- woolProduct(X), X\==0, get(woolProduct), write('Your sheep product '), nl,
              write(X), write('wools.'), nl,
              print.('You gained 18 ranching exp!').
ranchSheep :- woolProduct(X), X==0, write('Your sheep hasn’t produced any wool.'), nl,
              write('Please check again later.').

ranchChicken :- eggProduct(X), X\==0, get(eggProduct), write('Your chicken lays '), nl,
                write(X), write('eggs.'), nl,
                print.('You gained 6 ranching exp!').
ranchChicken :- eggProduct(X), X==0, write('Your chicken hasn’t produced any egg.'), nl,
              write('Please check again later.').
ranchCow :- milkProduct(X), X\==0, get(milkProduct), write('Your cow product '), nl,
            write(X), write('milks.'), nl,
            write('You gained 12 ranching exp!').
ranchCow :- milkProduct(X), X==0, write('Your cow hasn’t produced any milk.'), nl,
                write('Please check again later.').
ranch :- write('what do you want to do?'), nl,
         read(Animal), ranching(Animal).


