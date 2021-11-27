/* file : activities.pl */

/* Farming */
dig :- playerloc(X,Y), \+cannotbeDigged(X,Y), isAvailable(shovel,1), shovellevel(X), digging(X);
       playerloc(X,Y), \+cannotbeDigged(X,Y), \+isAvailable(shovel,1), write('Kamu tidak punya sekop untuk menggali'), nl;
       playerloc(X,Y), cannotbeDigged(X,Y), write('Kamu harus berada di tempat yang bisa digali'), nl.

digging(Level) :- Level==1, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'),nl;
                  Level==2, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, digTime(A), A==0, Z is A+1, asserta(digTime(Z)), retract(digTime(A)), addTime;
                  Level==2, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, digTime(A), A==1, asserta(digTime(0)), retract(digTime(A)), addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl;
                  Level==3, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, digTime(A), A==0, Z is A+1, asserta(digTime(Z)), retract(digTime(A)), addTime;
                  Level==3, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, digTime(A), A==1, Z is A+1, asserta(digTime(Z)), retract(digTime(A)), addTime;
                  Level==3, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, digTime(A), A==2, asserta(digTime(0)), retract(digTime(A)), addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl.
            
plant :- playerloc(X,Y), digloc(X,Y), cropSeed(Seed), isAvailable(Seed,Count), write('Kamu mempunyai:'), nl,
         printInventory([[Seed,Count]|_]), nl,
         write('Apa yang ingin kamu tanam?'), nl,
         read(Crop), nl,
         planting(Crop); 
         playerloc(X,Y), \+digloc(X,Y), write('Kamu harus menggali terlebih dahulu sebelum menanam'), nl;
         playerloc(X,Y), digloc(X,Y), cropSeed(Seed), \+isAvailable(Seed,Count), write('Maaf kamu tidak punya bibit tanaman yang tersedia'), nl.

planting(Crop) :- playerloc(X,Y), crop(Crop), season(CurrSeason), atom_concat(Crop,'_seed',Z), isAvailable(Z,Count), seasonCrop(Crop,CurrSeason), dropItem(Z,1), cropTime(Crop,Time), day(CurrDay), Z1 is Time+CurrDay, asserta(croploc(X,Y,Crop,Z1)),
                  write('Kamu menanam '), mkstr(Crop,A), write(A), write('.'), nl,
                  addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl,
                  retract(digloc(X,Y));
                  crop(Crop), season(CurrSeason), atom_concat(Crop,'_seed',Z), \+isAvailable(Z,Count), write('Kamu tidak punya '), mkstr(Z,A), write(A), nl;
                  crop(Crop), season(CurrSeason), atom_concat(Crop,'_seed',Z), isAvailable(Z,Count), \+seasonCrop(Crop,CurrSeason), write(Crop), write('tidak bisa ditanam di musim'), write(CurrSeason), nl;
                  \+crop(Crop), write('Tanaman yang kamu tulis tidak ada'), nl. 

harvest :- playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay>=Time, addItem(Crop,1), write('Kamu memanen '), mkstr(Crop,A), write(A), write('.'), nl,
           addExpFarming(_,2), addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl,
           retract(croploc(X,Y,Crop,Time)), nl;
           playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay<Time, write('Tanaman belum siap panen'), nl;
           playerloc(X,Y), \+croploc(X,Y,Crop,Time), write('Kamu harus berada di lokasi tempat yang sudah ditanam'), nl.


/* Fishing */

fish :-  playerloc(X,Y), Loc is Y+1, isWater(X, Loc), fishing_rodlevel(Z), fishingByLevel(Z),!;
         playerloc(X,Y), Loc is Y-1, isWater(X, Loc), fishing_rodlevel(Z), fishingByLevel(Z),!;
         playerloc(X,Y), Loc is X+1, isWater(Loc, Y), fishing_rodlevel(Z), fishingByLevel(Z),!;
         playerloc(X,Y), Loc is X-1, isWater(Loc, Y), fishing_rodlevel(Z), fishingByLevel(Z),!;
         write('Kamu harus berada disamping tempat air untuk memancing'), nl.

fishingByLevel(X) :- isAvailable(fishing_rod,1), X==1, random(1,5,Z), getFishing(Z,Y), fishing(Y);
                     isAvailable(fishing_rod,1), X==2, random(1,4,Z), getFishing(Z,Y), fishing(Y);
                     isAvailable(fishing_rod,1), X==3, random(1,3,Z), getFishing(Z,Y), fishing(Y);
                     \+isAvailable(fishing_rod,1), write('Kamu tidak punya alat pancing untuk memancing'), nl.

fishing(Fishing) :- Fishing==fish, random(1,6,Y), getFish(Y,Fish),addItem(Fish,1),
                    write('Kamu mendapatkan '), mkstr(Fish, FishInd), write(FishInd), write('!'), nl,
                    addExpFishing(_,10),nl,
                    addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl;
                    Fishing==none, write('Kamu tidak mendapatkan apapun!'), nl,
                    addExpFishing(_,5), nl,
                    addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl.

/* Ranching */
ranch :- playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z=\=0,
         write('Selamat datang di peternakan! Kamu mempunyai:'), nl,
         write(A), write(' ayam'), nl,
         write(B), write(' domba'), nl,
         write(C), write(' sapi'), nl,
         write('Hewan mana yang ingin kamu ambil hasilnya?'), nl,
         read(Animal), nl,
         ranching(Animal);
         playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z==0, write('Kamu tidak punya Hewan di peternakan'), nl;
         playerloc(X,Y), \+ranchloc(X,Y), write('Kamu harus berada di lokasi peternakan untuk mengambil hasil ternak'), nl.

ranching(Animal) :- animal(Animal), productYield(Animal,egg), ranchChicken;
                    animal(Animal), productYield(Animal,wool), ranchSheep;
                    animal(Animal), productYield(Animal,milk), ranchCow;
                    \+animal(Animal), write('Hewan yang kamu tulis tidak ada'), nl.

ranchChicken :- totalChicken(A), A\==0, eggProduct(X), day(CurrDay), B is CurrDay-X, B>0, C is A*B, addItem(egg,C), 
                write('Ayam kamu menghasilkan '), write(C), write(' Telur.'), nl,
                write('Kamu mendapatkan '), write(C), write(' Telur.'), nl,
                addExpRanching(_,6), nl,
                addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl,
                asserta(eggProduct(CurrDay)), retract(eggProduct(X));
                totalChicken(A), A\==0, eggProduct(X), day(CurrDay), B is CurrDay-X, B==0, write('Ayammu belum menghasilkan Telur.'), nl;
                totalChicken(A), A==0, write('Kamu tidak punya Ayam').

ranchSheep :- totalSheep(B), B\==0, woolProduct(X), day(CurrDay), A is CurrDay-X, A>=3, C is 2*B, addItem(wool,C), 
              write('Domba kamu menghasilkan '), write(C), write(' Wol'), nl,
              write('Kamu mendapatkan '), write(C), write(' Wol.'), nl,
              addExpRanching(_,12), nl,
              addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl,
              asserta(woolProduct(CurrDay)), retract(woolProduct(X));
              totalSheep(B), B\==0, woolProduct(X), day(CurrDay), A is CurrDay-X, A<3, write('Dombamu belum menghasilkan Wol.'), nl;
              totalSheep(B), B==0, write('Kamu tidak punya Domba'),nl.

ranchCow :- totalCow(C), C\==0, milkProduct(X), day(CurrDay), A is CurrDay-X, A>0, B is 2*C, addItem(milk,B), 
            write('Sapi kamu menghasilkan '), write(B), write(' Susu.'),nl, 
            write('Kamu mendapatkan '), write(B), write(' Susu.'), nl,
            addExpRanching(_,18),nl,
            addTime, decreaseStamina, stamina(_, Z), write('Stamina: '), write(Z), write('/12'), nl,
            asserta(milkProduct(CurrDay)), retract(milkProduct(X));
            totalCow(C), C\==0, milkProduct(X), day(CurrDay), A is CurrDay-X, A==0, write('Sapimu belum menghasilkan Susu.'), nl;
            totalCow(C), C==0, write('Kamu tidak punya Sapi'), nl.
