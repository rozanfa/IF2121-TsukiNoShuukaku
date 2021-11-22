/* file : level.pl */

:- include("items.pl").

:- dynamic(used/1).

inventory:- used(Count), 
            write("Your inventory"), write(Count), write("/100 : "), nl, 
            printInventoery.
printInventoery.
