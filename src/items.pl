/* Material and Tool */
:-dynamic(potionCount/2).
/* Tools */
tool(shovel).
tool(fishing_rod).

/* crop */
/*hasil*/
/* Spring */
crop(turnip). 
crop(potato).
crop(cucumber).
crop(cabbage).
/*Summer*/
crop(tomato). 
crop(corn).
crop(onion).
crop(pineapple).
/* Fall */
crop(carrot). 
crop(eggplant).
crop(spinach).
crop(pumpkin).
/* winter */
/*no crop */

/* seed */
/* Spring */
cropSeed(turnip_seed). 
cropSeed(potato_seed).
cropSeed(cucumber_seed).
cropSeed(cabbage_seed).
/*Summer*/
cropSeed(tomato_seed). 
cropSeed(corn_seed).
cropSeed(onion_seed).
cropSeed(pineapple_seed).
/* Fall */
cropSeed(carrot_seed). 
cropSeed(eggplant_seed).
cropSeed(spinach_seed).
cropSeed(pumpkin_seed).
/* winter */
/*no crop seed*/

/* potion */
potion(fishing_potion).
potion(farming_potion).
potion(ranching_potion).
potion(stamina_potion).
potion(all_potion).

/* Animal product */
/* Animal */
animal(chicken).
animal(sheep).
animal(cow).
product(egg).
product(milk).
product(wool).

/* fish */
fish(carp).
fish(eel).
fish(salmon).
fish(catfish).
fish(tuna).

/* crop section */
/*waktu tanam */
/* spring */
cropTime(turnip,3). 
cropTime(potato,2).
cropTime(cucumber,2).
cropTime(cabbage,5).
/* summer */
cropTime(tomato,2). 
cropTime(corn,3).
cropTime(onion,2).
cropTime(pineapple,5).
/*fall*/
cropTime(carrot,3). 
cropTime(eggplant,2).
cropTime(spinach,3).
cropTime(pumpkin,5).

/* harga beli*/

/* spring */
cropPurchasePrice(turnip_seed,200). 
cropPurchasePrice(potato_seed,160). 
cropPurchasePrice(cucumber_seed,120). 
cropPurchasePrice(cabbage_seed,500). 

/* summer */
cropPurchasePrice(tomato_seed,120). 
cropPurchasePrice(corn_seed,200). 
cropPurchasePrice(onion_seed,160). 
cropPurchasePrice(pineapple_seed,500). 

/* fall */
cropPurchasePrice(carrot_seed,200). 
cropPurchasePrice(eggplant_seed,160). 
cropPurchasePrice(spinach_seed,240). 
cropPurchasePrice(pumpkin_seed,400). 

/*harga jual */

/* spring */
cropSellPrice(turnip,600).
cropSellPrice(potato,480).
cropSellPrice(cucumber,360).
cropSellPrice(cabbage,1500).

/* summer */
cropSellPrice(tomato,360).
cropSellPrice(corn,600).
cropSellPrice(onion,480).
cropSellPrice(pineapple,1500).

/* fall */
cropSellPrice(carrot,600).
cropSellPrice(eggplant,480).
cropSellPrice(spinach,720).
cropSellPrice(pumpkin,1200).

/* potion */
potionPrice(fishing_potion,1000).
potionPrice(farming_potion,1000).
potionPrice(ranching_potion,1000).
potionPrice(stamina_potion,2000).
potionPrice(all_potion,5000).
/*product crop*/
/* Spring */
productCrop(turnip_seed,turnip).
productCrop(potato_seed,potato).
productCrop(cucumber_seed,cucumber).
productCrop(cabbage_seed,cabbage).
/*Summer*/
productCrop(tomato_seed,tomato).
productCrop(corn_seed,corn).
productCrop(onion_seed,onion).
productCrop(pineapple_seed,pinapple).
/* Fall */
productCrop(carrot_seed,carrot).
productCrop(eggplant_seed,eggplant).
productCrop(spinach_seed,spinach).
productCrop(pumpkin_seed,pumpkin).

/* season */
seasonCrop(turnip,1).
seasonCrop(potato,1).
seasonCrop(cucumber,1).
seasonCrop(cabbage,1).
seasonCrop(tomato,2).
seasonCrop(corn,2).
seasonCrop(onion,2).
seasonCrop(pineapple,2).
seasonCrop(carrot,3).
seasonCrop(eggplant,3).
seasonCrop(spinach,3).
seasonCrop(pumpkin,3).

/* ID Potion */
potionID(farming_potion,1).
potionID(fishing_potion,2).
potionID(ranching_potion,3).
potionID(stamina_potion,4).
potionID(all_potion,5).

potionCount(farming_potion,3).
potionCount(fishing_potion,3).
potionCount(ranching_potion,3).
potionCount(stamina_potion,3).
potionCount(all_potion,3).

/* Animal product section */
:- dynamic(woolProduct/1).
:- dynamic(eggProduct/1).
:- dynamic(milkProduct/1).

productYield(chicken,egg).
productYield(cow,milk).
productYield(sheep,wool).

animalPrice(chicken,500).
animalPrice(sheep,1000).  
animalPrice(cow,1500). 


setProductPricelvl1 :-
                    asserta(productPrice(egg,150)),
                    asserta(productPrice(milk,500)),  
                    asserta(productPrice(wool,1000)). 

setProductPricelvl2 :-
                    retractall(productPrice(_,_)),
                    asserta(productPrice(egg,300)),
                    asserta(productPrice(milk,1000)),  
                    asserta(productPrice(wool,2000)). 

setProductPricelvl3 :-
                    retractall(productPrice(_,_)),
                    asserta(productPrice(egg,450)), 
                    asserta(productPrice(milk,1500)),  
                    asserta(productPrice(wool,3000)). 

setAnimal :-
                asserta(totalCow(0)),
                asserta(totalSheep(0)),
                asserta(totalChicken(0)).

:- dynamic(totalnewCow/1).
:- dynamic(totalnewSheep/1).
:- dynamic(totalnewChicken/1).

/* Fish section */
/* harga ikan */
fishPrice(carp, 100).
fishPrice(eel, 180).
fishPrice(salmon, 240).
fishPrice(catfish, 400).
fishPrice(tuna, 550).

/* random mancing */
getFish(1,carp).
getFish(2,eel).
getFish(3,salmon).
getFish(4,catfish).
getFish(5,tuna).
getFishing(1,fish).
getFishing(2,none).
getFishing(3,none).
getFishing(4,none).

/* tool section */
/* harga beli */

toolPurchasePrice(shovel, 300).
toolPurchasePrice(fishing_rod,500).

/* Initialize Items */
initItem :- setAnimal, setProductPricelvl1.