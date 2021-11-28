/* file : activities.pl */

/* set dynamic */
:- dynamic(digTime/1).
digTime(0).

/* Farming */
dig :- playerloc(X,Y), \+cannotbeDigged(X,Y), isAvailable(shovel,1), shovellevel(Z), digging(Z), !;
       playerloc(X,Y), \+cannotbeDigged(X,Y), \+isAvailable(shovel,1), write('Kamu tidak punya sekop untuk menggali'), nl, !;
       playerloc(X,Y), cannotbeDigged(X,Y), write('Tempat ini tidak bisa digali atau sudah digali'), nl, !.

digging(Level) :- Level==1, playerloc(X,Y), asserta(digloc(X,Y)), write('Kamu menggali tempat ini.'), nl, decreaseStamina, stamina(_, Z), maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl, addTime, !;
                  Level==2, playerloc(X,Y), asserta(digloc(X,Y)), digTime(A), A==0, Z is A+1, write('Kamu menggali tempat ini.'), nl, asserta(digTime(Z)), retract(digTime(A)), addTime, !;
                  Level==2, playerloc(X,Y), asserta(digloc(X,Y)), digTime(A), A==1, write('Kamu menggali tempat ini.'), nl, asserta(digTime(0)), retract(digTime(A)), decreaseStamina, stamina(_, Z), maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl, addTime, !;
                  Level==3, playerloc(X,Y), asserta(digloc(X,Y)), digTime(A), A==0, Z is A+1, write('Kamu menggali tempat ini.'), nl, asserta(digTime(Z)), retract(digTime(A)), addTime, !;
                  Level==3, playerloc(X,Y), asserta(digloc(X,Y)), digTime(A), A==1, Z is A+1, write('Kamu menggali tempat ini.'), nl, asserta(digTime(Z)), retract(digTime(A)), addTime, !;
                  Level==3, playerloc(X,Y), asserta(digloc(X,Y)), digTime(A), A==2, write('Kamu menggali tempat ini.'), nl, asserta(digTime(0)), retract(digTime(A)), decreaseStamina, stamina(_, Z), maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl, addTime,!.
            
plant :- playerloc(X,Y), digloc(X,Y), cropSeed(Seed), isAvailable(Seed,Count), write('Kamu mempunyai:'), nl,
         printInventory([[Seed,Count]|_]), nl,
         write('Apa yang ingin kamu tanam?'), nl,
         read(Crop), nl,
         planting(Crop), !; 
         playerloc(X,Y), \+digloc(X,Y), write('Kamu harus menggali terlebih dahulu sebelum menanam'), nl, !;
         playerloc(X,Y), digloc(X,Y), cropSeed(Seed), \+isAvailable(Seed,Count), write('Maaf kamu tidak punya bibit tanaman yang tersedia'), nl, !.

planting(Crop1) :- mkstr(Crop1,Crop), season(CurrSeason), atom_concat(Crop,'_seed',Z), isAvailable(Z,Count), seasonCrop(Crop,CurrSeason), cropTime(Crop,Time), day(CurrDay), Z1 is Time+CurrDay, playerloc(X,Y), asserta(croploc(X,Y,Crop,Z1)),
                   write('Kamu menanam '), mkstr(Crop,Crop2), write(Crop2), write('.'), nl,
                   dropItem(Z,1), nl,
                   decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl,
                   addTime, retract(digloc(X,Y)), !;
                   mkstr(Crop1,Crop), season(CurrSeason), atom_concat(Crop,'_seed',Z), \+isAvailable(Z,Count), write('Kamu tidak punya '), mkstr(Z,A), write(A), nl, !;
                   mkstr(Crop1,Crop), season(CurrSeason), atom_concat(Crop,'_seed',Z), isAvailable(Z,Count), \+seasonCrop(Crop,CurrSeason), isSeason(Season,CurrSeason), mkstr(Crop,Crop2), write(Crop2), write(' tidak bisa ditanam di musim '), write(Season), nl, !;
                   \+mkstr(Crop1,Crop), write('Tanaman yang kamu tulis tidak ada'), nl, !.

harvest :- playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay>=Time, addItem(Crop,1), write('Kamu memanen '), mkstr(Crop,A), write(A), write('.'), nl,
           addExpFarming(_,2), nl,
           decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl,
           addTime, retract(croploc(X,Y,Crop,Time)), progQuest(Crop), !;
           playerloc(X,Y), croploc(X,Y,Crop,Time), day(CurrDay), CurrDay<Time, write('Tanaman belum siap panen'), nl, !;
           playerloc(X,Y), \+croploc(X,Y,Crop,Time), write('Kamu harus berada di lokasi tempat yang sudah ditanam'), nl, !.


/* Fishing */

fish :-  playerloc(X,Y), Loc is Y+1, isWater(X, Loc), fishing_rodlevel(Z), fishingByLevel(Z),!;
         playerloc(X,Y), Loc is Y-1, isWater(X, Loc), fishing_rodlevel(Z), fishingByLevel(Z),!;
         playerloc(X,Y), Loc is X+1, isWater(Loc, Y), fishing_rodlevel(Z), fishingByLevel(Z),!;
         playerloc(X,Y), Loc is X-1, isWater(Loc, Y), fishing_rodlevel(Z), fishingByLevel(Z),!;
         write('Kamu harus berada disamping tempat air untuk memancing'), nl, !.

fishingByLevel(X) :- isAvailable(fishing_rod,1), X==1, random(1,5,Z), getFishing(Z,Y), fishing(Y), !;
                     isAvailable(fishing_rod,1), X==2, random(1,4,Z), getFishing(Z,Y), fishing(Y), !;
                     isAvailable(fishing_rod,1), X==3, random(1,3,Z), getFishing(Z,Y), fishing(Y), !;
                     \+isAvailable(fishing_rod,1), write('Kamu tidak punya alat pancing untuk memancing'), nl, !.

fishing(Fishing) :- Fishing==fish, random(1,6,Y), getFish(Y,Fish),addItem(Fish,1),
                    write('Kamu mendapatkan '), mkstr(Fish, FishInd), write(FishInd), write('!'), nl,
                    addExpFishing(_,10), progQuest(Fish), nl,
                    decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl,
                    addTime, !;
                    Fishing==none, write('Kamu tidak mendapatkan apapun!'), nl,
                    addExpFishing(_,5), nl,
                    decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl, 
                    addTime, !.

/* Ranching */
ranch :- playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z=\=0,
         write('Selamat datang di kandang! Kamu mempunyai:'), nl,
         write(A), write(' Ayam'), nl,
         write(B), write(' Domba'), nl,
         write(C), write(' Sapi'), nl,
         write('Hewan mana yang ingin kamu ambil hasilnya?'), nl,
         read(Animal), nl,
         ranching(Animal), !;
         playerloc(X,Y), ranchloc(X,Y), totalChicken(A), totalSheep(B), totalCow(C), Z is A+B+C, Z==0, write('Kamu tidak punya Hewan di kandang'), nl, !;
         playerloc(X,Y), \+ranchloc(X,Y), write('Kamu harus berada di kandang untuk mengambil hasil ternak'), nl, !.

ranching(Animal1) :- mkstr(Animal1,Animal), productYield(Animal,egg), ranchChicken, !;
                     mkstr(Animal1,Animal), productYield(Animal,wool), ranchSheep, !;
                     mkstr(Animal1,Animal), productYield(Animal,milk), ranchCow, !;
                     \+mkstr(Animal1,Animal), write('Hewan yang kamu tulis tidak ada'), nl, !.

ranchChicken :- totalChicken(A), A\==0, eggProduct(X), day(CurrDay), B is CurrDay-X, B>0, addItem(egg,A), 
                write('Ayam milikmu menghasilkan '), write(C), write(' Telur.'), nl,
                write('Kamu mendapatkan '), write(C), write(' Telur.'), nl,
                addExpRanching(_,6), nl,
                decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl,
                addTime, asserta(eggProduct(CurrDay)), retract(eggProduct(X)), progQuest(egg), !;
                totalChicken(A), A\==0, eggProduct(X), day(CurrDay), B is CurrDay-X, B==0, write('Ayam milikmu belum menghasilkan Telur.'), nl, !;
                totalChicken(A), A==0, write('Kamu tidak punya Ayam').

ranchSheep :- totalSheep(B), B\==0, woolProduct(X), day(CurrDay), A is CurrDay-X, A>=3, addItem(wool,B), 
              write('Domba milikmu menghasilkan '), write(C), write(' Wol'), nl,
              write('Kamu mendapatkan '), write(C), write(' Wol.'), nl,
              addExpRanching(_,12), nl,
              decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl,
              addTime, asserta(woolProduct(CurrDay)), retract(woolProduct(X)), progQuest(wool), !;
              totalSheep(B), B\==0, woolProduct(X), day(CurrDay), A is CurrDay-X, A<3, write('Domba milikmu belum menghasilkan Wol.'), nl, !;
              totalSheep(B), B==0, write('Kamu tidak punya Domba'),nl, !.

ranchCow :- totalCow(C), C\==0, milkProduct(X), day(CurrDay), A is CurrDay-X, A>0, addItem(milk,C), 
            write('Sapi milikmu menghasilkan '), write(B), write(' Susu.'),nl, 
            write('Kamu mendapatkan '), write(B), write(' Susu.'), nl,
            addExpRanching(_,18),nl,
            decreaseStamina, stamina(_, Z),maxStamina(_, MaxStamina), write('Stamina: '), write(Z), write('/'), write(MaxStamina), write('.'), nl,
            addTime, asserta(milkProduct(CurrDay)), retract(milkProduct(X)), progQuest(milk), !;
            totalCow(C), C\==0, milkProduct(X), day(CurrDay), A is CurrDay-X, A==0, write('Sapi milikmu belum menghasilkan Susu.'), nl, !;
            totalCow(C), C==0, write('Kamu tidak punya Sapi'), nl, !.
