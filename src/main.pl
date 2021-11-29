:- include('house.pl').
:- include('level.pl').
:- include('alchemist.pl').
:- include('inventory.pl').
:- include('map.pl').
:- include('player.pl').
:- include('prologue.pl').
:- include('time.pl').
:- include('items.pl').
:- include('activities.pl').
:- include('quest.pl').
:- include('stringify.pl').

:- dynamic(isStarted/1).


bannerTsukiNoShukaku:-
write('                      +ddhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhmhhhdNhhhhhhhhhhhhhhhhhhhhhhhdmy.                             '), nl,
write('                    `hdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhmdhhdmdhhhhhhhhhhhhhhhhhhhhhhhyhh/                            '), nl,
write('                   .ddhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddhhdmmhhhhhhhhhhhhhhhhhhhhysosoyh+                           '), nl,
write('                  `hdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdmdhddmmhydhyyyyyyyysshsoysso++oysdmo                          '), nl,
write('                  omhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddmdhddmdyydohsos++oo//+yooysysyyhhhdm+                         '), nl,
write('                 `mhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddmhdddmo+oy:+s/+///s++oshyyyhhhhhhhhmm-                           ::::::::::::::::::\'########::\'######::\'##::::\'##:\'##:::\'##:\'####:::::::::::::::::::::'), nl,
write('                 :mhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddmhdddm++sy:-/soooosssyyydhyhhhhhhhhhmy                           ::::::::::::::::::... ##..::\'##... ##: ##:::: ##: ##::\'##::. ##::::::::::::::::::::::'), nl,
write('            :    +mhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddmddddddsssy:..-oysssssyyhhdyyhhhhhhhhdN-                          ::::::::::::::::::::: ##:::: ##:::..:: ##:::: ##: ##:\'##:::: ##::::::::::::::::::::::'), nl,
write('           .:    +dhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddmhdddmysshso+++++yhsssssyhhdyyyhhhhhhhmy                          ::::::::::::::::::::: ##::::. ######:: ##:::: ##: #####::::: ##::::::::::::::::::::::'), nl,
write('         - +`    +dhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddmddddmdsssd+:---://oshdhysyddyyyyhhhhhhhN`                         ::::::::::::::::::::: ##:::::..... ##: ##:::: ##: ##. ##:::: ##::::::::::::::::::::::'), nl,
write('         s +     .mhhhhhhhhhhhhhhhhhhhhhhhhhhdddddddmdddddmssoyo-``````````/hdhhyddyyyyhhhhhhm:                         ::::::::::::::::::::: ##::::\'##::: ##: ##:::: ##: ##:. ##::: ##::::::::::::::::::::::'), nl,
write('         y +      hhhhhhhhhhhhhhhhhhhhhhhhhddddddddmdddddmysooh-`````````````:oyyhmyyyyyhhhhhh+      /                  ::::::::::::::::::::: ##::::. ######::. #######:: ##::. ##:\'####:::::::::::::::::::::'), nl,
write('        `s o      :mhhhhhhhhhhhhhhhhhhhhddddddddddmdddddmhsooy+.```````````````.+ydhsyyyyhhhhho      /                  :::::::::::::::::::::..::::::......::::.......:::..::::..::....::::::::::::::::::::::'), nl,
write('        o+++.+/-`  sdhhhhhhhhhhhhhhhhddddddddddddmdddddmdssoss.````.--.``````````.odssyyyhhhhh+      :``                ::::::::::::::::::::::::::::::\'##::: ##::\'#######::::::::::::::::::::::::::::::::::::'), nl,
write('         .yy/sssyo/:ydhhhhhhhhhhdddddddddddddddmddddddmdssooh-``.:+ooossso/:.``````yssyyyhhhhhs      -.:                :::::::::::::::::::::::::::::: ###:: ##:\'##.... ##:::::::::::::::::::::::::::::::::::'), nl,
write('          `shsssssssymdddyoossssyydmmddddddddmmddddddmhssssh:```smmMMMMNNNNmmds:```+ssyyyhhhhhy      -./                :::::::::::::::::::::::::::::: ###:: ##:\'##.... ##:::::::::::::::::::::::::::::::::::'), nl,
write('            -syssssssshdss++++++++ydmsydddmmmddddddmmysssyd:```/s+--+NNmddNh+ohdh/:/ssyyyhhhhho      : :                :::::::::::::::::::::::::::::: ## ## ##: ##:::: ##:::::::::::::::::::::::::::::::::::'), nl,
write('        -:+oooymdysssysooyssyyysssyhmhodmmmddddddmmhysyhdh:````.-:..-dhhmmmN:`.:hh-+ssyyyhhhhd+      : `                :::::::::::::::::::::::::::::: ##. ####: ##:::: ##:::::::::::::::::::::::::::::::::::'), nl,
write('    `:/yhhhyssssssssss++s++syys++oyydhhdddmdddmmmdhyhdhhs-`````` +hooyhyhosy:   +/-ossyyyhhhhm+      `                  :::::::::::::::::::::::::::::: ##:. ###: ##:::: ##:::::::::::::::::::::::::::::::::::'), nl,
write('    :hdhhhysssssssssyo+oo+ssssho++yysdhhhhhdddddhdddhhy/.``````` -s++/++///+-  `-``ossyyhhhhhNo                         :::::::::::::::::::::::::::::: ##::. ##:. #######::::::::::::::::::::::::::::::::::::'), nl,
write('     .:/yhhyssssssssy+os+syoy+yssyyyoyddhhhyyyyhhhhhy+.```````````o/-...-:/o` ````.ysyyyhhhhdmy           .-            :\'######::\'##::::\'##:\'##::::\'##:\'##::::\'##:\'##:::\'##::::\'###::::\'##:::\'##:\'##::::\'##:'), nl,
write('         -/+ydddhsssy+sosyssyoyyyyhsoyymmddhhhddddm/.````````````````.............+ssyyyhhhdNNd.``    ``-o+             \'##... ##: ##:::: ##: ##:::: ##: ##:::: ##: ##::\'##::::\'## ##::: ##::\'##:: ##:::: ##:'), nl,
write('          -shyssssssysssyoooosyyyyoohyyddmhhhhhdddo`````.```````````....-.---.-../ysyyyhhhdmmmddyyssssyhy:               ##:::..:: ##:::: ##: ##:::: ##: ##:::: ##: ##:\'##::::\'##:. ##:: ##:\'##::: ##:::: ##:'), nl,
write('        -ydhyssssssssys+soossyyysosyyyddmhhyyyhdds``````````````````....-.---.-./ysyyyhhhdmmmdddhhhhyo/.                . ######:: #########: ##:::: ##: ##:::: ##: #####::::\'##:::. ##: #####:::: ##:::: ##:'), nl,
write('       :dhhhhsssshhssy+++ooooyhyyyyyhddmdhhyyhdds````````````````````........./syyyyyhhhdmmmmmmy:-.                     :..... ##: ##.... ##: ##:::: ##: ##:::: ##: ##. ##::: #########: ##. ##::: ##:::: ##:'), nl,
write('      :yyhdddysomhsssssssssyyhhhhhhdhdmdhhhhddd+``````````````````````````-+syyhhyyhhhhmmmmmmmmy                        \'##::: ##: ##:::: ##: ##:::: ##: ##:::: ##: ##:. ##:: ##.... ##: ##:. ##:: ##:::: ##:'), nl,
write('  /            hhsssssyhsyddhhdhhhhhhmdhhddddh:`````:-``````.:.``````````-.`./syyyhhdmmmNmmmmmmm.                       . ######:: ##:::: ##:. #######::. #######:: ##::. ##: ##:::: ##: ##::. ##:. #######::'), nl,
write('  s.          :mhssssssmmmdhhddhhhhdmddddhhdo.````````--``.-.````````````-syhhhhhdmmmmdmmmmmmmmmh`     /-               :......:::..:::::..:::.......::::.......:::..::::..::..:::::..::..::::..:::.......:::'), nl,
write('  -d+.        :mhhyyyhddddddmddddmmmddhhhdy:```````````````````````````````....-+mmmddhNmmmmmmmmmy`    :m-      .//. '), nl,
write('   .ydyo+///+odhhddmddhhdddhhdddm::+yhdhs:.```````````````````````````````````.+dNmdhhdNmhhhdmmmmmh-  `hmh       `yms`  '), nl,
write('     -ohdddddhmmmmmmhhhdhyyyyhddm/```:y/.```````````````````````````````````.:o+shdhhdmo/:--:/sdmmmmyydmmd        `mN+                                   Art By: @Takiki2828'), nl,
write('`-     `.:+syyhhhdmdhdh+:---:/+ohh```.+o-.````````````````````````````...-:/+/::oyddddo--------:ymmmmmmmmy         yNs  '), nl,
write('+y           ```-hddms:---------/m```../oso/-..-:::///:--.```````.--::-..-:++/::oddddm-----------ymmmmmmNs-`     ./mm+                                Tsuki no Shukaku e Yokoso                              '), nl,
write('om+.          .+dmdmo------------o/```````-/o-.```````.--:::-:://:-.````````./o:ymddms------------mmmmmmmmmhysssydmmh`  -------------------------------------------------------------------------------------'), nl,
write('`ddhs/-....:/shddddy--------------h:````````````````````````-:-.``````````````:odddmyo------------ommmmmmmmmmmmmmmmy`   |                                    Main Menu                                      |'), nl,
write(' .ydddddddddddddddm:--------------syo:.````````````````````````````````````````hdddyoo------------:Nmmmmmmmmmmmdds:     | 1. start  : Mulailah menjadi petani dan bayar hutangmu                            |'), nl,
write('   :sddhddddddddmNs---------------oh:sso-`````````````````````````````````````/mdhsoos------------:hdmmNhyyyso/-`       | 2. help   : Kalo bingung mending ketik command ini ngab daripada bingung          |'), nl,
write('     :ymmmdmmmmmmd----------------oh/o:+ys/-.``````````````````````````````.-+ds+hooos-------------oohmmd+`             -------------------------------------------------------------------------------------'), nl.

farmerBanner:-
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::::::::: *&&@@&& :::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::::::::: (@&@&) ::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::::::::: .,#/ ::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::::::::: .,, :::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::: /,/ ::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::::::: ,,. :::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::: ,., ::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::::: ,,* :::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::: .,* ::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::: @@ :::::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::::: %@. :::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::: .&( ::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::::::::: &&& :::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::::: ,%%&@@@@@@@@( :::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::: &@&&&@@@@@@@@ :::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::: *@@@@#(#%@&%&@ :::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::: @&&##%%%%%%%%%/ ::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::: @%%%%%%,/%%%%%%@ :::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl.

fishermanBanner:-
write(':::: */#,%&#.*#*>.. :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::: # :::::::::: ),%. ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::: # ::::::::::::: *&%# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::: ( :::::::::::::::: *&/%* ::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::: * :::::::::::::::::::: &#// :::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::: / :::::::::::::::::::::::: %%.^. ::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::: # :::::::::::::::::::::::::: (/# ::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write('::::: # :::::::::::::::::::::::::::: .//..# :::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::: # :::::::::::::::::::::::::::::: %%# :::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::: ( :::::::::::::::::::::::::::::::: %%%,/ :::::::::::::::::::::::::::::::::::::'),nl,
write('::::::: ( :::::::::::::::::::::::::::::::::: //( ::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::: ( :::::::::::::::::::::::::::::::::: .//().. :::::::::::::::::::::::::::::::'),nl,
write('::::::::: , :::::::::::::::::::::::::::::::::: *&%% :::::::::::::::::::::::::::::::::'),nl,
write(':::::::::: , ::::::::::::::::::::::::::::::::::: #&&%(# :::::::::::::::::::::::::::::'),nl,
write('::::::::::::: % :::::::::::::::::::::::::::::::::: (//# :::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::: /, ::::::::::::::::::::::::::::::: ,/// ::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::: ( :::::::::::::::::::::::::::::: #//# ::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::: <> :::::::::::::::::::::::: ##%(/%((((#/, :::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::: > :::::::::::::::::::: ## : (/#((#(((( :::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::: ( :::::::::::::: ,&%&,.%#..* %/%#(%#. ::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::: * ::::::::::::: (%%%. : *(#  (/// &%%&% :::::::::::::::::::'),nl,
write(':::::::::::::::::::: */ ::::::::::::::::::::::::::::: ,. ::: %%%%%* :::::::::::::::::'),nl,
write(':::::::::::::: *( :::::::::::::::::::::::::::::::::::::::::::: %%%%% ::::::::::::::::'),nl,
write('::::::::: ,* :::::::::::::::::::::::::::::::::::::::::::::::::: ,%%%%% ::::::::::::::'),nl,
write('::::::: % ::::::::::::::::::::::::::::::::::::::::::::::::::::::: (%%%&* ::::::::::::'),nl,
write('::::::: % ::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %%%%% :::::::::::'),nl,
write(':::::::: ( :::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %&& :::::::::::'),nl,
write('::::::::::**<((#/*,**(#*  (#*/ ::::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::: ,(,, :::::::::::::::::::::::::::::::::::::::::::::::::::::'),nl.

rancherBanner:-
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@/////,.,#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@@@@%#/(/**,###((%%/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@@@@,///#*,/%&&(,/##%####%&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@%.**/////(#%&#(@@@&&&%##%@%##%#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@,(#@%,(&%%%%%%%#&&#&&&%%%%%########(##((((/((((((((((/(((((//((##@@@@@@@@@@@@@@@@@@'),nl,
write('@@.%@@&&%&&%%%%&%&&#&%&&&&%%%##(((##((((((((((((((((#%%%((((((/(///(##((@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@&&&&&&&&@&%@&&#%#(((((((((((((((((#(#((((((((##%####(//////((@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@&&&&&&&&%%##%##((((#((((((((((((##(((#((((#%###%%#(######(((&@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@%&&&&&%%##%%###((#%########(####(########%%%%%#(((((###(#(##@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@#&@&&%%%%%###(###&%%%##%%%%%############%%%%##(###(###((#%#@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@((@&&&&&####%%%%#%%%%%%%#############%%%&%##(######(((##%%@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@%(#&&&%##&&%%%%##%##%%###(#######%%%&&%%%##(##((((##%%@%@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@(/(/(#%#(((###%%((((#####%%%%&&&&&&#(//((//(/((###%%@@#@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@///#((/////#%&%%%%%&&&&@@&&&&&&&%%%@@@@&&//(#%#%#@@(@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@(/#%&(#(((##,@@@@@@@@@@/@@&&%@@@@@@@@@(&*/((%%@@@#@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#(((###@@@@@@@@@@@@@@@@@@@@@@@@@@@@(*(###(@(#@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((#%(*/%%@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(/(##/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(*,**#@@&@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(#/(/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,*//&@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,(//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*,,//@@#@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,*,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,../@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@**/*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/  **@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*.*,/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,  ((@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//(#@@@@@@@@@@@@@@@@@@@@@@@@@@@@. *&%%@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl,
write('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),nl.

startGame:- \+isStarted(_), bannerTsukiNoShukaku, nl,
            asserta(isStarted(0)), initItem, !.
startGame:- isStarted(_) -> write('Game sudah dimulai gan'),!.

start:-  \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
start:- isStarted(1) -> write('Permainan sudah dimulai. Selesaikan dulu dong!\n'), !.
start:- isStarted(0) -> (
        retract(isStarted(0)),
        asserta(isStarted(1)), nl,
        write('Selamat Datang di Tsuki No Shukaku.'), nl,
        %write('Silakan masukkan nama anda: '), read(Username), asserta(username(Username)), nl,
        %Harusnya namanya Claire aja
        write('Silakan pilih pekerjaan utama anda.'),nl,
        farmerBanner,
        write('1. Petani.'),nl, nl, nl,
        fishermanBanner,
        write('2. Pemancing.'),nl, nl, nl,
        rancherBanner,
        write('3. Peternak.'),nl,
        write('Pilihan (1/2/3): \n'), read(ChoosenJob),nl,

        asserta(username(claire)),


        (ChoosenJob = 1 -> createFarmer(claire),
        write('Kamu memilih petani!'), nl;

        ChoosenJob = 2 -> createFisher(claire),
        write('Kamu memilih pemancing!'), nl;

        ChoosenJob = 3 -> createRancher(claire),
        write('Kamu memilih peternak!'), nl;
        
        write('Pilihan tidak valid silakan pilih lagi'),
        retract(isStarted(_)),
        asserta(isStarted(0)),fail),

        asserta(playerloc(2,9)),
        writePrologue).

help :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn untuk masukin command, orang dalam gan??!'), !.
help:-
write('-------------------------------------------------------------------------------------'),nl,
write('| Daftar Command :                                                                  |'),nl,
write('| 1. Command Umum (Bisa dipake di mana aja ngab)                                    |'),nl,
write('| 2. Command Jalan (Buat nyamperin perkebunan, perternakan, dan tempat-tempat lain) |'),nl,
write('| 3. Commad Activities (melakukan sesuatu kegiatan)                                 |'),nl,
write('| 4. Commad Tempat (memasuki suatu tempat khusus)                                   |'),nl,
write('-------------------------------------------------------------------------------------'),nl,
write('Masukan command yang ingin diliat : \n'), read(N),
       ((N =:= 1 -> commandUmum);
        (N =:= 2 -> commandJalan);
        (N =:= 3 -> commandActivities);
        (N =:= 4 -> commandPlace);
        write('Masukan tidak valid, silakan ulangi!')).


commandUmum :-
        write('-------------------------------------------------------------------------------------'),nl,
        write('| 1. map         : Nampilin peta supaya gak buta map kek dora                       |'),nl,
        write('| 2. inventory   : Nampilin peta supaya gak buta map kek dora                       |'),nl,
        write('| 3. status      : Mau cek status udah ganteng belum?? masukin command ini ngab     |'),nl,
        write('| 4. quit        : keluar dari tempat-tempat khusus ngab seperti market atau house  |'),nl,
        write('-------------------------------------------------------------------------------------'),nl.

commandJalan :-
        write('-------------------------------------------------------------------------------------'),nl,
        write('| 1. w           : jalan ke utara 1 langkah (makan waktu ini ngab ati-ati)          |'),nl,
        write('| 2. s           : jalan ke selatan 1 langkah (makan waktu ini ngab ati-ati)        |'),nl,
        write('| 3. d           : jalan ke ke timur 1 langkah (makan waktu ini ngab ati-ati)       |'),nl,
        write('| 4. a           : jalan ke barat 1 langkah (makan waktu ini ngab ati-ati)          |'),nl,
        write('-------------------------------------------------------------------------------------'),nl.

commandActivities :-
        write('-------------------------------------------------------------------------------------'),nl,
        write('| (1-2 cuma bisa dipake di pasar aja)                                               |'),nl,
        write('| 1. buy         : membeli item yang tersedia di market ngab (untuk pembelian       |'),nl,
        write('|                  equipment diupgrade dan equipment lama akan hilang)              |'),nl,
        write('| 2. sell        : menjual item di ada di inventory agan                            |'),nl,
        write('| (3-6 cuma bisa dipake di house aja)                                               |'),nl,
        write('| 3. sleep       : membeli item yang tersedia di market ngab                        |'),nl,
        write('| 4. writeDiary  : menjual item di ada di inventory agan                            |'),nl,
        write('| 5. readDiary   : menjual item di ada di inventory agan                            |'),nl,
        write('| 6. [namahewan]        : mengambil hasil dari hewan tersebut (Bisa dipake di ranch |'),nl,
        write('|                          ranch aja)                                               |'),nl,
        write('| 7. [namaTanaman]      : memanen tanaman yang sudah siap dipanen (Bisa dipake di   |'),nl,
        write('|                          farm aja)                                                |'),nl,
        write('| 8. fish        : memancing ikan (Ingatttt harus ada di tile water & gacha)        |'),nl,
        write('| 9. dig         : menggali tanah untuk farming (Ingatttt harus ada di tile kosong) |'),nl,
        write('| 9. plant       : menanam tanaman (Ingatttt harus ada di tile yang sudah di dig)   |'),nl,
        write('| 9. harvest     : mengambil tanaman (Ingatttt tanaman harus udah selesai bertumbuh)|'),nl,
        write('| 11. throwItem  : membuang item yang ada di inventory                              |'),nl,
        write('-------------------------------------------------------------------------------------'),nl.

commandPlace :-
        write('-------------------------------------------------------------------------------------'),nl,
        write('| 1. house      : masuk ke house (Ingatttt harus ada di tile house)                |'),nl,
        write('| 2. ranch      : mengurus peternakan (Ingatttt harus ada di tile ranch)           |'),nl,
        write('| 3. market      : masuk ke market (Ingatttt harus ada di tile market)              |'),nl,
        write('-------------------------------------------------------------------------------------'),nl.


quit :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn untuk masukin command, orang dalam gan??!'), !.
quit :- isStarted(0) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai masa sudah keluar, mabok gan??!'), !.
quit :- write('Cepat kembali petani, hutangmu tidak bisa dibayar dengan daun dan juga kasian dengan'),nl,
        write('ladang dan peternakanmu tidak terurus'), retract(isStarted(_)), !.


/*


inventory :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
inventory :- isStarted(0) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn, mabok gan??!'), !.





buy :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
buy :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

sell :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
sell :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

sleep :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
sleep :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

writeDiary :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
writeDiary :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

readDiary :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
readDiary :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

fish :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
fish :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

dig :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
dig :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

plant:- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
plant :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

harvest :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
harvest :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

throwItem :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
throwItem :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

market :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
market :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

house :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
house :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.

ranch :- \+isStarted(_) -> write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gannn udah masukin command, orang dalam gan??!'), !.
ranch :- isStarted(0), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai gan, mabok gan??!'), !.
*/
