/* file : level.pl */

:- include('items.pl').

:- dynamic(used/1).

:- dynamic(isiInventory/1).
inventory:- used(Used),
            write("Your inventory"), write(Used), write("/100 : "), nl,
            isiInventory(Isi), printInventoery(Isi).

printInventory([]).
printInventoery([[Name,Count]|Other]):-
            write(Count), write(" "), write(Name), nl, printInventory(Other);
            nl, printInventory(Other).

addItem(Item,Count):-
    (Count =< 0 -> write("Jumlah item yang disimpan tidak valid"));
    (used(Used),
    isiInventory(Isi),
    (Used + Count =< 100 ->
        (member([Item,CurrentCount],Isi) ->
           NewCount is CurrentCount + Count, NewUsed is Used + Count,
            delete(Isi,[Item,CurrentCount],TempIsi), append(TempIsi,[Item,NewCount],NewIsi),
            retract(isiInventory(Isi)),asertz(isiInventory(NewIsi))),aserta(used(NewUsed);

           append(TempIsi,[Item,NewCount],NewIsi),
            retract(isiInventory(Isi)),asertz(isiInventory(NewIsi))
            );

        write("Inventory penuh silakan drop beberapa item yang tidak digunakan"))).

dropItem(Item,Count):-
    (Count =< 0 -> write("Jumlah item yang dibuang tidak valid"));
    (used(Used),
    isiInventory(Isi),
    (member([Item,CurrentCount],Isi) ->
        (CurrentCount > Count ->
            NewCount is CurrentCount - Count, NewUsed is Used - Count,
            delete(Isi,[Item,CurrentCount],TempIsi), append(TempIsi,[Item,NewCount],NewIsi),
            retract(isiInventory(Isi)),asertz(isiInventory(NewIsi))),aserta(used(NewUsed);

            write("Jumlah item yang ingin dibuang tidak cukup"));

        write("Inventory penuh silakan drop beberapa item yang tidak digunakan"))).
