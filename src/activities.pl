show_seed:- write('You have:'), nl,
            write('seed yang ada di inventory').

/* Farming */
dig :- digged(current_loc), write('You digged the tile').

plant :- show_seed, nl, 
         write('What do you want to plant?'), nl,
         read(Crop), drop(Crop),
         write('you planted a '), write(Crop), write('seed.').

harvest :- crop(Crop), isTilePlanted(Crop), get(Crop), write('you harvested '),write(Crop), write('.'), nl,
           write('you gained 2 farming exp').

/* Fishing */
fishing(X) :- /* random get fish */
fish :- fishing(Fish), isFish(Fish), get(Fish),
        write('You got '), write(Fish), write('!'), nl,
        write('You gained 10 fishing exp'), !.

fish :- write('You didn’t get anything!'), nl,
        write('You gained 5 fishing exp').

/* Ranching */
ranching(X) :- isAnimal(X), isProduct(X,wool), ranchSheep.
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


