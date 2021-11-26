/* file : activities.pl */

:- include('inventory.pl').
:- include('map.pl').
:- include('items.pl').
:- include('level.pl').
:- include('level.pl').
:- include('time.pl').


/* Farming */
dig :- playerloc(X,Y), \+isbuilding(X,Y), asserta(digloc(X,Y)), write('You digged the tile');
       playerloc(X,Y), isbulding(X,Y), write('Anda harus berada di tempat yang bisa digali').

plant :- playerloc(X,Y), digloc(X,Y), crop_Seed(Seed), checkItem(Seed), write('You have:'), nl,
         , printInventory([[Seed,Count]|Other]), nl,
         write('What do you want to plant?'), nl,
         read(Crop), planting(Crop), 
         playerloc(X,Y), \+digloc(X,Y), write('Anda harus menggali terlebih dahulu sebelum menanam').
         playerloc(X,Y), digloc(X,Y), crop_Seed(Seed), \+checkItem(Seed), write('Maaf tidak ada bibit yang bisa ditanam').

planting(Crop) :- crop(Crop), atom_concat(Crop,'_seed',Z), dropItem(Z,1), cropTime(Crop,Time), day(CurrDay), Z is Time+CurrDay, asserta(croploc(X,Y,Crop,Z)),
                  write('you planted a '), write(Crop), write(' seed.'), retract(digloc(X,Y));
                  \+crop(Crop), write('Tanaman yang Anda tulis tidak ada'). 

harvest :- playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay>=Time, addItem(Crop,1), write('you harvested '), write(Crop), write('.'), nl,
           addExpFarming(Farmer,2), retract(croploc(X,Y,Crop,Time));
           playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay<Time, write('Tanaman belum siap panen');
           playerloc(X,Y), \+croploc(X,Y,Crop,Time), write('Anda harus berada di lokasi tempat yang bisa ditanam').

/* Fishing */

fish :-  playerloc(X,Y), Loc is Y+1 isWater(X, Loc), random(1,5,Z), getFishing(Z,X), fishing(X),!;
         playerloc(X,Y), Loc is Y-1 isWater(X, Loc), random(1,5,Z), getFishing(Z,X), fishing(X),!;
         playerloc(X,Y), Loc is X+1 isWater(Loc, Y), random(1,5,Z), getFishing(Z,X), fishing(X),!;
         playerloc(X,Y), Loc is X-1 isWater(Loc, Y), random(1,5,Z), getFishing(Z,X), fishing(X),!;
         write('Anda harus berada disamping tempat air untuk memancing').

fishing(Fishing) :- Fishing==fish, random(1,6,Y), getFish(Y,Fish),
                    write('You got '), write(Fish), write('!'), nl,
                    addExpFishing(Farmer,10);
                    Fishing==none,
                    write('You didn’t get anything!'), nl,
                    addExpFishing(Farmer,5).

/* Ranching */
ranch :- playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z=\=0,
         write('Welcome to the ranch! You have:'), nl,
         write(A), write(' chicken'), nl,
         write(B), write(' sheep'), nl,
         write(C), write(' cow'), nl,
         nl, write('What do you want to do?'), nl
         read(Animal), ranching(Animal);
         playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z==0, write('Anda tidak punya Hewan untuk diternak').
         playerloc(X,Y), \+ranchloc(X,Y), write('Anda harus berada di lokasi peternakan untuk mengambil hasil ternak').



ranching(Animal) :- animal(Animal), productYield(Animal,egg), ranchChicken;
                    animal(Animal), productYield(Animal,wool), ranchSheep;
                    animal(Animal), productYield(Animal,milk), ranchCow;
                    \+animal(Animal), write('Hewan yang Anda tulis tidak ada').


ranchChicken :- totalChicken(A), A\==0, eggProduct(X), X\==0, , addItem(egg,X), write('Your chicken lays '), nl,
                write(X), write('eggs.'), nl,
                addExpRanching(Farmer,6);
                otalChicken(A), A\==0, eggProduct(X), X==0, write('Your chicken hasn’t produced any egg.'), nl,
                write('Please check again later.');
                totalChicken(A), A==0, write('Anda tidak punya Ayam').

ranchSheep :- totalSheep(B), B\==0, woolProduct(X,_), X\==0, addItem(wool,X), write('Your sheep product '), nl,
              write(X), write('wools.'), nl,
              addExpRanching(Farmer,12);
              totalSheep(B), B\==0, woolProduct(X,_), X==0, write('Your sheep hasn’t produced any wool.'), nl,
              write('Please check again later.');
              totalChicken(B), B==0, write('Anda tidak punya Domba').


ranchCow :- totalCow(C), C\==0, milkProduct(X), X\==0, addItem(milk,X), write('Your cow product '), nl,
            write(X), write('milks.'), nl,
            addExpRanching(Farmer,18);
            totalCow(C), C\==0, milkProduct(X), X==0, write('Your cow hasn’t produced any milk.'), nl,
            write('Please check again later.');
            totalChicken(C), C==0, write('Anda tidak punya Sapi').


