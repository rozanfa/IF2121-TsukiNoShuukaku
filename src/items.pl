
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
crop(green_paper).
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
cropSeed(green_paper_seed).
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
/* harga beli*/
/* spring */
cropPurchasePrice(turnip_seed,200). /* 3 hari */
cropPurchasePrice(potato_seed,160). /* 2 hari */
cropPurchasePrice(cucumber_seed,120). /* 2 hari */
cropPurchasePrice(cabbage_seed,500). /* 6 hari */

/* spring */
cropPurchasePrice(tomato_seed,120). /* 2 hari */
cropPurchasePrice(corn_seed,200). /* 3 hari */
cropPurchasePrice(onion_seed,160). /* 2 hari */
cropPurchasePrice(pineapple_seed,500). /* 6 hari */

/* spring */
cropPurchasePrice(carrot_seed,200). /* 3 hari */
cropPurchasePrice(eggplant_seed,160). /* 2 hari */
cropPurchasePrice(sweet_potato_seed,240). /* 3 hari */
cropPurchasePrice(green_paper_seed,80). /* 1 hari */

/*harga jual */
/* spring */
cropSellPrice(turnip,600).
cropSellPrice(potato,800).
cropSellPrice(cucumber,600).
cropSellPrice(cabbage,2500).

/* spring */
cropSellPrice(tomato,600).
cropSellPrice(corn,1000).
cropSellPrice(onion,800).
cropSellPrice(pineapple,2500).

/* spring */
cropSellPrice(carrot,1200).
cropSellPrice(eggplant,800).
cropSellPrice(sweet_potato,1200).
cropSellPrice(green_paper,400).

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
seasonCrop(green_paper,fall).


/* Animal product section */
:- dynamic(woolProduct/1).
:- dynamic(eggProduct/1).
:- dynamic(milkProduct/1).

productYield(chicken,egg).
productYield(cow,milk).
productYield(sheep,wool).

animalPrice(egg,150). /* tiap hari */
animalPrice(milk,500).  /* tiap hari */
animalPrice(wool,1000). /*3 hari sekali */

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
getFishing(1,none).
getFishing(2,none).
getFishing(3,none).
getFishing(4,fish).
/* tool section */
/* harga beli */
toolPurchasePrice(shovel, 300). /* sekali beli nyesuain level sekunder */
toolPurchasePrice(fishing_rod,500). /* sekali beli nyesuain level sekunder */
