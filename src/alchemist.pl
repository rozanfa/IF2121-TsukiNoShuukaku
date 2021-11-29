<<<<<<< HEAD

=======
>>>>>>> 975dd0f4a05a46fbee1291148645591c1ebbe9a6
/* dynamic */
:- dynamic(inAlchemistState/1).
:- dynamic(potionEfect/2).
:- dynamic(tempLevel/4).

/* assign awal */
inAlchemistState(0).
potionEfect(0,0).
tempLevel(0,0,0,0).

alchemistPotion([farming_potion,fishing_potion,ranching_potion,stamina_potion,all_potion]).

alchemist:-
    (alchemistloc(Xa,Ya,TP,_), playerloc(Xp,Yp),
    ((TP > 0, Xp =:= Xa, Yp =:= Ya) ->
        retract(inAlchemistState(_)), asserta(inAlchemistState(1)),
        write('Ohh tidak kamu menemukanku!!!\nSilakan pilih potoin yang ingin dibeli\n1. (buyPotion) Beli Potion');
        write('Tidak terjadi apa-apa....'))),!.

exitAlchemist:-
    write('Jangan bilang siapa-siapa tentang kehadiranku!'),
    retract(tempList(_)), asserta(tempList([])),
    retract(inAlchemistState(_)), asserta(inAlchemistState(0)).

buyPotion:-
    inAlchemistState(X),
        X =:= 1 ->
        write('Silakan Potion yang ingin dipilih :\n'),
            alchemistPotion(Y), retract(tempList(_)),
            asserta(tempList(Y)), tempList(List), showList(10,List), write('pilih dengan format \'[nama item]\' :\n'),
            read(PotionIn), gold(_,Gold), mkstr(Potion,PotionIn), potionID(Potion,Z), potionCount(Potion,Count),
            Count > 0 ->
               ((Z =:= 1, Gold >= 1000 -> addItem(farming_potion,1), SGold is Gold - 1000,
                                         retract(gold(_,Gold)), asserta(gold(_,SGold)),
                                         write('Berhasil membeli Potion Farming\n');
                Z =:= 2, Gold >= 2000 -> addItem(fishing_potion,1), SGold is Gold - 1000,
                                         retract(gold(_,Gold)), asserta(gold(_,SGold)),
                                         write('Berhasil membeli Potion Fishing\n');
                Z =:= 3, Gold >= 3000 -> addItem(ranching_potion,1), SGold is Gold - 1000,
                                         retract(gold(_,Gold)), asserta(gold(_,SGold)),
                                         write('Berhasil membeli potion Ranching\n');
                Z =:= 4, Gold >= 4000 -> addItem(stamina_potion,1), SGold is Gold - 1000,
                                         retract(gold(_,Gold)), asserta(gold(_,SGold)),
                                         write('Berhasil membeli Potion Stamina\n');
                Z =:= 5, Gold >= 5000 -> addItem(all_potion,1), SGold is Gold - 1000,
                                         retract(gold(_,Gold)), asserta(gold(_,SGold)),
                                         write('Berhasil membeli Potion God\n')),
                                         decreasePotionCount(Z);
                write('Maaf uang golds anda tidak cukup untuk membeli potion tersebut\n'));
            write('Potion sudah habis\n');
    true.

decreasePotionCount(X):-
    potionID(Potion,X), retract(potionCount(Potion,Count)), NCount is Count - 1, asserta(potionCount(Potion,NCount)).

setPotion(X) :-
    potionEfect(P,_),
       (P =:= 0 ->
           (X =:= 1 -> retract(potionEfect(_,_)), asserta(potionEfect(1,10)),
                       retract(farminglevel(_,Y)), asserta(farminglevel(_,3)), asserta(tempLevel(Y,_,_,_)),
                       write('Potion Farming sudah aktif level farming menjadi level maximal');
            X =:= 2 -> retract(potionEfect(_,_)), asserta(potionEfect(2,10)),
                       retract(fishinglevel(_,Y)), asserta(fishinglevel(_,3)), asserta(tempLevel(_,Y,_,_)),
                       write('Potion Fishing sudah aktif level fishing menjadi level maximal');
            X =:= 3 -> retract(potionEfect(_,_)), asserta(potionEfect(3,10)),
                       retract(ranchinglevel(_,Y)), asserta(ranchinglevel(_,3)), asserta(tempLevel(_,_,Y,_)),
                       write('Potion Ranching sudah aktif level ranching menjadi level maximal');
            X =:= 4 -> retract(potionEfect(_,_)), asserta(potionEfect(4,10)),
                       retract(maxStamina(_,Y)), asserta(maxStamina(_,99)), asserta(tempLevel(_,_,_,Y)),
                       write('Potion Stamina sudah aktif stamina menjadi 99');
            X =:= 5 -> retract(potionEfect(_,_)), asserta(potionEfect(5,10)),
                       retract(farminglevel(_,Y)), asserta(farminglevel(_,3)),
                       retract(fishinglevel(_,Z)), asserta(fishinglevel(_,3)),
                       retract(ranchinglevel(_,V)), asserta(ranchinglevel(_,3)),
                       retract(maxStamina(_,W)), asserta(maxStamina(_,99)), asserta(tempLevel(Y,Z,V,W)),
                       write('Potion God sudah aktif (Efek sama seperti menggunakan keempat potion)')),!;
        P =\= 0 -> write('Gagal hanya bisa menggunakan satu potion'),!).

usePotion:-
    write('Potion yang tersedia :\n'),
    isiInventory(Isi), printPotion(Isi),
    write('Masukan item yang ingin dibuang : (contoh masukan \'[nama item]\')'), nl,
    read(PotionIn), mkstr(Potion,PotionIn), potionID(Potion,ID), 
    (potionEfect(P,_), 
        P =:= 0 -> dropItem(Potion,1);true), setPotion(ID).
