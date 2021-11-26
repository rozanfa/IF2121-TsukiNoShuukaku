/* file : activities.pl */

:- include('inventory.pl').
:- include('map.pl').
:- include('items.pl').


/* Farming */
dig :- playerloc(X,Y), asserta(digloc(X,Y)), write('You digged the tile').

plant :- playerloc(X,Y), digloc(X,Y),write('You have:'), nl,
         crop_Seed(Seed), printInventory([[Seed,Count]|Other]), nl,
         write('What do you want to plant?'), nl,
         read(Crop), crop(Crop), atom_concat(Crop,'_seed',Z), dropItem(Z,1), cropTime(Crop,Time), asserta(croploc(X,Y,Crop,Time)),
         write('you planted a '), write(Crop), write(' seed.'), retract(digloc(X,Y)).

harvest :- playerloc(X,Y), croploc(X,Y,Crop,0), crop(Crop), addItem(Crop,1), write('you harvested '), write(Crop), write('.'), nl,
           write('you gained 2 farming exp'), 
           farmingexp(Farmer, Z), Z1 is X+2, asserta(farmingexp(Farmer, Z1)), retract(farmingexp(Farmer, Z)), retract(croploc(X,Y)).

/* Fishing */

fish :- random(1,5,Z), getFishing(Z,X), fishing(X). 

fishing(Fishing) :- Fishing==fish, random(1,6,Y), getFish(Y,Fish),
                    write('You got '), write(Fish), write('!'), nl,
                    write('You gained 10 fishing exp'), 
                    fishingexp(Farmer, X),Z is X+10, asserta(fishingexp(Farmer, Z)), retract(fishingexp(Farmer, X);
                    Fishing==none,
                    write('You didn’t get anything!'), nl,
                    write('You gained 5 fishing exp'), fishingexp(Farmer, Z),Z1 is X+5, asserta(fishingexp(Farmer, Z1)), retract(fishingexp(Farmer, Z)).

/* Ranching */
ranch :- playerloc(X,Y), ranchloc(X,Y),
         write('Welcome to the ranch! You have:'), nl,
         totalChicken(A), totalSheep(B), totalCow(C),
         write(A), write(' chicken'), nl,
         write(B), write(' sheep'), nl,
         write(C), write(' cow'), nl,
         nl, write('What do you want to do?'), nl
         read(Animal), ranching(Animal).

ranching(Animal) :- animal(Animal), productYield(Animal,egg), ranchChicken;
                    animal(Animal), productYield(Animal,wool), ranchSheep;
                    animal(Animal), productYield(Animal,milk), ranchCow;


ranchChicken :- eggProduct(X), X\==0, , addItem(egg,X), write('Your chicken lays '), nl,
                write(X), write('eggs.'), nl,
                write('You gained 6 ranching exp!'), ranchingexp(Farmer, Z), Z1 is Z+6, asserta(ranchingexp(Farmer, Z1)), retract(ranchingexp(Farmer, Z));
                eggProduct(X), X==0, write('Your chicken hasn’t produced any egg.'), nl,
                write('Please check again later.').

ranchSheep :- woolProduct(X,_), X\==0, get(woolProduct), write('Your sheep product '), nl,
              write(X), write('wools.'), nl,
              print.('You gained 12 ranching exp!'), ranchingexp(Farmer, Z), Z1 is Z+12, asserta(ranchingexp(Farmer, Z1)), retract(ranchingexp(Farmer, Z));
              woolProduct(X,_), X==0, write('Your sheep hasn’t produced any wool.'), nl,
              write('Please check again later.').


ranchCow :- milkProduct(X), X\==0, get(milkProduct), write('Your cow product '), nl,
            write(X), write('milks.'), nl,
            write('You gained 18 ranching exp!'), ranchingexp(Farmer, Z), Z1 is Z+18, asserta(ranchingexp(Farmer, Z1)), retract(ranchingexp(Farmer, Z));
            milkProduct(X), X==0, write('Your cow hasn’t produced any milk.'), nl,
            write('Please check again later.').


