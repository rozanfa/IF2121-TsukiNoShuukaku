/* file : level.pl */

:- include('items.pl').

:- dynamic(used/1).

:- dynamic(isiInventory/1).

inventory:- isiInventory(Isi), countInventory(Isi,Cap),
            (Cap =\= 0 ->
                write("Your inventory "), write(Cap), write("/100 : "), nl,
                printInventory(Isi), !);
            write('Inventory kosong').


initIsiInventory(Item,Count):- assertz(isiInventory([[Item,Count]])).

printInventory([]).
printInventory([[Name,Count]|Other]):-
            write(Count), write(" "), write(Name), nl, printInventory(Other)/*;
            nl, printInventory(Other)*/.

countInventory([],0).
countInventory([[_,Count]|Other],Sum):-
        countInventory(Other,Temp), Sum is Temp + Count.

addItem(_,Count):-
    (Count =< 0 -> write('Jumlah item yang disimpan tidak valid')), fail.
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
        (Cap + Count =:= 100 -> write('Hati-hati inventory sudah penuh')),!/*;
    (\+isiInventory(_) ->
        append(_,[[Item,Count]],NewIsi),
        assertz(isiInventory(NewIsi)))*/.

dropItem(_,Count):-
        (Count =< 0 -> write("Jumlah item yang dibuang tidak valid")),fail.
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
                write('Sekarang tidak ada '),write(Item),write(' yang tersisa di inventorymu'));

            write('Jumlah item yang ingin dibuang tidak cukup'));

        write('Tidak memiliki item')),!.

isAvailable(Item,Count):-
    isiInventory(Isi), (member([Item,CurrentCount],Isi) -> Count is CurrentCount).
