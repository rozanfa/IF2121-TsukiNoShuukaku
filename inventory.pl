/* file : level.pl */
:- dynamic(isiInventory/1).

inventory:- isiInventory(Isi), countInventory(Isi,Cap),
            Cap =\= 0 ->
                write('Your inventory '), write(Cap), write('/100 : '), nl,
                printInventory(Isi),!;
                write('Inventory kosong').

printSeed([]):- !.
printSeed([[Name,Count]|Other]):-
            cropSeed(Name) -> write(Count), write(' '), mkstr(Name,Str), write(Str), nl, printSeed(Other);
            printSeed(Other).

printPotion([]):- !.
printPotion([[Name,Count]|Other]):-
            potion(Name) -> write(Count), write(' '), mkstr(Name,Str), write(Str), nl, printPotion(Other);
            printPotion(Other).

cheatInventory(Item,Count):- \+ isiInventory(_) -> assertz(isiInventory([[Item,Count]])),!.
cheatInventory(Item,Count):- retract(isiInventory(_)), assertz(isiInventory([[Item,Count]])).

printInventory([]):- !.
printInventory([[Name,Count]|Other]):-
            write(Count), write(' '), mkstr(Name,Str), write(Str),
            (tool(Name) ->
                shovellevel(Level) -> write(' level '), write(Level);
             tool(Name) ->
                fishing_rodlevel(Level) -> write(' level '), write(Level);
                true),  nl, printInventory(Other).

countInventory([],0).
countInventory([[_,Count]|Other],Sum):-
        countInventory(Other,Temp), Sum is Temp + Count.

addItem(Item,Count):-
    \+ isiInventory(_) ->
    append(_,[[Item,Count]],NewIsi),
    assertz(isiInventory(NewIsi)), !.
addItem(_,Count):-
    (Count =< 0 -> write('Jumlah item yang disimpan tidak valid')), !.
addItem(Item,Count):-
    isiInventory(Isi),
    countInventory(Isi, Cap),
    (Cap + Count =< 100 ->
        (isAvailable(Item,CurrentCount) ->
            NewCount is CurrentCount + Count,
            delete(Isi,[Item,CurrentCount],TempIsi),
            append(TempIsi,[[Item,NewCount]],NewIsi),
            retract(isiInventory(Isi)),
            assertz(isiInventory(NewIsi));

            append(Isi,[[Item,Count]],NewIsi),
            retract(isiInventory(Isi)),
            assertz(isiInventory(NewIsi))
        );

        write('Inventory penuh silakan drop beberapa item yang tidak digunakan')),
        (Cap + Count =:= 100 -> write('Hati-hati inventory sudah penuh');true).

dropItem(_,Count):-
        (Count =< 0 -> write('Jumlah item yang dibuang tidak valid')),fail.
dropItem(Item,Count):-
    isiInventory(Isi),
    (isAvailable(Item,CurrentCount) ->
        (CurrentCount >= Count ->
            (CurrentCount > Count ->
                NewCount is CurrentCount - Count,
                delete(Isi,[Item,CurrentCount],TempIsi),
                append(TempIsi,[[Item,NewCount]],NewIsi),
                retract(isiInventory(Isi)),
                assertz(isiInventory(NewIsi));

            CurrentCount =:= Count ->
                delete(Isi,[Item,CurrentCount],NewIsi),
                retract(isiInventory(Isi)),
                assertz(isiInventory(NewIsi)),
                write('Sekarang tidak ada '), mkstr(Item,ItemStr),write(ItemStr),write(' yang tersisa di inventorymu'));

            write('Jumlah item yang ingin dibuang tidak cukup, gagal membuang'));

        write('Tidak memiliki item, gagal membuang')),!.

isAvailable(Item,Count):-
    isiInventory(Isi), (member([Item,CurrentCount],Isi) -> Count is CurrentCount).

throwItem :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
throwItem :- isStarted(0) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.
throwItem:-
    inventory,
    write('Masukan item yang ingin dibuang : (contoh masukan \'[nama item]\')'), nl, read(X), nl,
    write('Berapa jumlah item yang ingin dibuang'), nl, read(Y), mkstr(Z,X), dropItem(Z,Y),!.


