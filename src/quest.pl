:- dynamic(questItems/3).

harvestItem(carrot, winter).
harvestItem(tomato, summer).
harvestItem(potato, autumn).

fishItem(bass).
fishItem(tuna).
fishItem(salmon).

ranchItem(egg).
ranchItem(meat).
ranchItem(wool).

questItems(X,Y,Z):- harvestItem(X), fishItem(Y), ranchItem(Z).

quest:-
    write("you have to collect: ").