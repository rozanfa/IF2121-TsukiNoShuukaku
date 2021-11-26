/* file : activities.pl */

:- include('inventory.pl').
:- include('map.pl').
:- include('items.pl').
:- include('level.pl').
:- include('level.pl').
:- include('time.pl').


/* Farming */
dig :- playerloc(X,Y), \+isbuilding(X,Y),shovellevel(X), digging(X);
       playerloc(X,Y), isbulding(X,Y), write('Kamu harus berada di tempat yang bisa digali').
digging(X) :- X==1, asserta(digloc(X,Y)), write('Kamu menggali tempat ini'), addTime, decreaseStamina, stamina(Farmer, Z), nl, write('stamina: '), write(Z), write('/12');
              X==2, asserta(digloc(X,Y)), write('Kamu menggali tempat ini'), digTime(X), X==0, Z is X+1, asserta(digTime(Z), retract(digTime(X)), addTime;
              X==2, asserta(digloc(X,Y)), write('Kamu menggali tempat ini'), digTime(X), X==1, asserta(digTime(0), retract(digTime(X)), addTime, decreaseStamina, stamina(Farmer, Z), nl, write('stamina: '), write(Z), write('/12');
              X==3, asserta(digloc(X,Y)), write('Kamu menggali tempat ini'), digTime(X), X==0, Z is X+1, asserta(digTime(Z), retract(digTime(X)), addTime;
              X==3, asserta(digloc(X,Y)), write('Kamu menggali tempat ini'), digTime(X), X==1, Z is X+1, asserta(digTime(Z), retract(digTime(X)), addTime;
              X==3, asserta(digloc(X,Y)), write('Kamu menggali tempat ini'), digTime(X), X==2, asserta(digTime(0), retract(digTime(X)), addTime, decreaseStamina, stamina(Farmer, Z), nl, write('stamina: '), write(Z), write('/12');
            
plant :- playerloc(X,Y), digloc(X,Y), cropYSeed(Seed), checkItem(Seed), write('Kamu mempunyai:'), nl,
         , printInventory([[Seed,Count]|Other]), nl,
         write('Apa yang ingin kamu tanam?'), nl,
         read(Crop), planting(Crop); 
         playerloc(X,Y), \+digloc(X,Y), write('Kamu harus menggali terlebih dahulu sebelum menanam').
         playerloc(X,Y), digloc(X,Y), cropYSeed(Seed), \+checkItem(Seed), write('Maaf tidak ada bibit yang bisa ditanam').

planting(Crop) :- crop(Crop), season(CurrSeason), seasonCrop(Crop,CurrSeason), atomYconcat(Crop,'Yseed',Z), checkItem(Z), dropItem(Z,1), cropTime(Crop,Time), day(CurrDay), Z1 is Time+CurrDay, asserta(croploc(X,Y,Crop,Z1)),
                  write('Kamu menanam '), mkstr(Z,A), write(A), retract(digloc(X,Y)), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12');
                  crop(Crop), season(CurrSeason), seasonCrop(Crop,CurrSeason), atomYconcat(Crop,'Yseed',Z), \+checkItem(Z), write('Kamu tidak punya '), write(Z);
                  crop(Crop), season(CurrSeason), \+seasonCrop(Crop,CurrSeason), write(Crop), write('tidak bisa ditanam di musim'), write(CurrSeason).
                  \+crop(Crop), write('Tanaman yang Kamu tulis tidak ada'). 

harvest :- playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay>=Time, addItem(Crop,1), write('Kau memanen '), mkstr(Crop,A), write(A), write('.'), nl,
           addExpFarming(Farmer,2), retract(croploc(X,Y,Crop,Time)), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12');
           playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay<Time, write('Tanaman belum siap panen');
           playerloc(X,Y), \+croploc(X,Y,Crop,Time), write('Kamu harus berada di lokasi tempat yang bisa ditanam').

/* Fishing */

fish :-  playerloc(X,Y), Loc is Y+1 isWater(X, Loc), fishingByLevel(X),!;
         playerloc(X,Y), Loc is Y-1 isWater(X, Loc), fishingByLevel(X),!;
         playerloc(X,Y), Loc is X+1 isWater(Loc, Y), fishingByLevel(X),!;
         playerloc(X,Y), Loc is X-1 isWater(Loc, Y), fishingByLevel(X),!;
         write('Kamu harus berada disamping tempat air untuk memancing').

fishingByLevel(X) :- X==1, random(1,5,Z), getFishing(Z,X), fishing(X);
                     X==2, random(1,4,Z), getFishing(Z,X), fishing(X);
                     X==3, random(1,3,Z), getFishing(Z,X), fishing(X);

fishing(Fishing) :- Fishing==fish, random(1,6,Y), getFish(Y,Fish),addItem(Fish,1),
                    write('Kamu mendapatkan '), mkstr(Fish, Fish1) write(Fish1), write('!'), nl,
                    addExpFishing(Farmer,10), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12');
                    Fishing==none,
                    write('Kamu tidak mendapatkan apapun!'), nl,
                    addExpFishing(Farmer,5), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12').

/* Ranching */
ranch :- playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z=\=0,
         write('Selamat datang di peternakan! Kamu mempunyai:'), nl,
         write(A), write(' ayam'), nl,
         write(B), write(' domba'), nl,
         write(C), write(' sapi'), nl,
         nl, write('Hewan mana yang ingin kamu ternak?'), nl
         read(Animal), ranching(Animal);
         playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z==0, write('Kamu tidak punya Hewan untuk diternak').
         playerloc(X,Y), \+ranchloc(X,Y), write('Kamu harus berada di lokasi peternakan untuk mengambil hasil ternak').

ranching(Animal) :- animal(Animal), productYield(Animal,egg), ranchChicken;
                    animal(Animal), productYield(Animal,wool), ranchSheep;
                    animal(Animal), productYield(Animal,milk), ranchCow;
                    \+animal(Animal), write('Hewan yang Kamu tulis tidak ada').

ranchChicken :- totalChicken(A), A\==0, eggProduct(X), X\==0, , addItem(egg,X), write('Ayam kamu menghasilkan '), nl,
                write(X), mkstr(egg, Str), write(' '), write(Str), asserta(eggProduct(0)), retract(eggProduct(X)), nl,
                addExpRanching(Farmer,6), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12');
                totalChicken(A), A\==0, eggProduct(X), X==0, write('Ayammu tidak menghasilkan telur.'), nl,
                write('Cek lagi lain kali');
                totalChicken(A), A==0, write('Kamu tidak punya Ayam').

ranchSheep :- totalSheep(B), B\==0, woolProduct(X,Y), X\==0, addItem(wool,X), write('Domba kamu menghasilkan '), nl,
              write(X), mkstr(wool, Str),  write(' '),write(Str), asserta(woolProduct(0,Y)), retract(woolProduct(0,Y)), nl,
              addExpRanching(Farmer,12), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12');
              totalSheep(B), B\==0, woolProduct(X,_), X==0, write('Your sheep hasn’t produced any wool.'), nl,
              write('Cek lagi lain kali');
              totalChicken(B), B==0, write('Kamu tidak punya Domba').

ranchCow :- totalCow(C), C\==0, milkProduct(X), X\==0, addItem(milk,X), write('Sapi kamu menghasilkan '), nl,
            write(X), mkstr(milk, Str),  write(' '),write(Str), asserta(milkProduct(0)), retract(milkProduct(X)), nl,
            addExpRanching(Farmer,18), addTime, decreaseStamina, stamina(Farmer, Z), write('stamina: '), write(Z), write('/12');
            totalCow(C), C\==0, milkProduct(X), X==0, write('Your cow hasn’t produced any milk.'), nl,
            write('Cek lagi lain kali');
            totalChicken(C), C==0, write('Kamu tidak punya Sapi').


