/* Material and Tool */

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
crop(sweet_potato).
crop(green_pepper).
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
cropSeed(sweet_potato_seed).
cropSeed(green_pepper_seed).
/* winter */
/*no crop seed*/

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
cropTime(cabbage,6).
/* summer */
cropTime(tomato,2). 
cropTime(corn,3).
cropTime(onion,2).
cropTime(pineapple,6).
/*fall*/
cropTime(carrot,3). 
cropTime(eggplant,2).
cropTime(sweet_potato,3).
cropTime(green_pepper,1).

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
cropPurchasePrice(sweet_potato_seed,240). 
cropPurchasePrice(green_pepper_seed,80). 

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
cropSellPrice(sweet_potato,720).
cropSellPrice(green_pepper,240).
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
productCrop(sweet_potato_seed,sweet_potato).
productCrop(green_pepper_seed,green_pepper).

/* season */
seasonCrop(turnip,spring).
seasonCrop(potato,spring).
seasonCrop(cucumber,spring).
seasonCrop(cabbage,spring).
seasonCrop(tomato,summer).
seasonCrop(corn,summer).
seasonCrop(onion,summer).
seasonCrop(pineapple,summer).
seasonCrop(carrot,fall).
seasonCrop(eggplant,fall).
seasonCrop(sweet_potato,fall).
seasonCrop(green_pepper,fall).


/* Animal product section */
setProductCount :- asserta(woolProduct(0)), /*3 hari sekali */
                   asserta(eggProduct(0)), /* tiap hari */
                   asserta(milkProduct(0)). /* tiap hari */

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
                asserta(totalsheep(0)),
                asserta(totalChicken(0)).

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

toolPurchasePrice(shovel, 300). /*  bisa dibeli sampe max nyesuain max lvlfarming */
toolPurchasePrice(fishing_rod,500). /* bisa dibeli sampe max nyesuain max lvlfishing*/

setTool :- asserta(shovellevel(1)),
           asserta(fishing_rodlevel(1)),
           asserta(digTime(0)).
        
toolPurchasePrice(shovel, 300). /* bisa dibeli sampe max kali nyesuain max level farming */
toolPurchasePrice(fishing_rod,500). /* bisa dibeli sampe max kali nyesuain max level fishing */

/* Initialize items */
setProductCount.
setProductPricelvl1.
setAnimal.
setTool.


