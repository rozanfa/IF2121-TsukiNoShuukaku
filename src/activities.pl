show_seed:- write("seed_inventory").


/* Farming */
dig :- w. /*kondisi tile berubah jadi =, player bergerak ke atas satu tile */

farming :- show_seed, nl, 
         write('What do you want to plant?'), nl,
         read(Crop), w, /*kondisi tile berubah jadi simbol crop, player bergerak ke atas satu tile */
         write('you planted a '), write(Crop), write('seed.').

harvest :- crop(Crop), isTilePlanted(Crop), get(Crop), write('you harvested '),write(Crop).
/* Fishing */
fishing :- fishing(Fish), isFish(Fish), get(Fish),
        write('You got '), write(Fish), write('!'), nl,
        write('You gained '), /*dapet exp*/ !.
fishing :- write('You didn’t get anything!'), nl,
        write('You gained '). /*dapet exp*/
/* FRanching */
ranching :- write('what do you want to do?'), nl,
         read(Animal), animal(Animal).


animal(X) :- isAnimal(X). 
