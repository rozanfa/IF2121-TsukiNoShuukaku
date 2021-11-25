
/* Material and Tool */

/* Tools */
tool(shovel).
tool(fishing_rod).

/* crop */
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
cropPurchasePrice(turnip,200). /* 3 hari */
cropPurchasePrice(potato,160). /* 2 hari */
cropPurchasePrice(cucumber,120). /* 2 hari */
cropPurchasePrice(cabbage,500). /* 6 hari */

/* spring */
cropPurchasePrice(tomato,120). /* 2 hari */
cropPurchasePrice(corn,200). /* 3 hari */
cropPurchasePrice(onion,160). /* 2 hari */
cropPurchasePrice(pineapple,500). /* 6 hari */

/* spring */
cropPurchasePrice(carrot,200). /* 3 hari */
cropPurchasePrice(eggplant,160). /* 2 hari */
cropPurchasePrice(sweet_potato,240). /* 3 hari */
cropPurchasePrice(green_paper,80). /* 1 hari */

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

price(egg,150). /* tiap hari */
price(milk,500).  /* tiap hari */
price(wool,1000). /*3 hari sekali */

/* Fish section */
fishPrice(carp, 100).
fishPrice(eel, 180).
fishPrice(salmon, 240).
fishPrice(catfish, 400).
fishPrice(tuna, 550).

/* tool section */
/* harga beli */
toolPurchasePrice(shovel, 300). /* sekali beli nyesuain level sekunder */
toolPurchasePrice(fishing_rod,500). /* sekali beli nyesuain level sekunder */