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
write('                           .ymdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdmhhhhdNdhhhhhhhhhhhhhhhhhhhhhhhhhhhdmmd/                                      '), nl,
write('                          omdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhmdhhhdmNhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdmdy`                                    '), nl,
write('                        `hmhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdmhhhddMhhhhhhhhhhhhhhhhhhhhhhhhhhhhsyohyh:                                   '), nl,
write('                       `ddhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdNhhhddNhhhhhhhhhhhhhhhhhdhhhhhhhyys+os+yhh/                                  '), nl,
write('                       hmhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddNhhdddNhyyhmhyyyyyyyyyssshhsoysso+++osysdmm/                                 '), nl,
write('                      omhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddmmhhdddNhyyhyhhys+s+++y+//+ss+oyoysosyyhhhdmm/                                '), nl,
write('                     `NdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddmdhddddN+osss/ho//s///so/+++shsyyyhyhhhhhhhdmm-                               '), nl,
write('                     /NhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddNhhddddd/+soo::so/s//++sosssyhmyhhhhhhhhhhhhdmh                               '), nl,
write('                     ydhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddddmhddddmy++sh/:--+ssossssyyyyhyddyyhhhhhhhhhhhmN:                              '), nl,
write('              :.     ddhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddmddddddNssssd:-``.:sysssssssyyhyddyyhhhhhhhhhhhmh                              '), nl,
write('              s      dhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddmmhddddmdssssd++///:/+yysssssssyhymyyyyhhhhhhhhhdN:                             '), nl,
write('           . -/      ddhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddddmddddddmssssdyo+//++ooshdhhyysssyhhdyyyyhhhhhhhhhmy                             '), nl,
write('          `o +.      ydhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhddddddddmddddddmhssssh:.`````````.-+dmdhyyydmhyyyyyhhhhhhhdN`                            '), nl,
write('          :+ +`      :mhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddddddddmddddddmdssooh+-``````````````:shhhhhmdyyyyyyhhhhhhhN-       ``                   '), nl,
write('          /+ o`       dhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddddddddddmdddddddmssoosy-`````````````````-+yyydNysyyyyyhhhhhhd/       `/                   '), nl,
write('         `-y /-       /mhhhhhhhhhhhhhhhhhhhhhhhhhdddddddddddddmdddddddmysoooh/.```````````````````./yymhssyyyyhhhhhhd/        o                     ::::::::::::::::::\'########::\'######::\'##::::\'##:\'##:::\'##:\'####:::::::::::::::::::::'), nl,
write('         +so:/-:-.`    ydhhhhhhhhhhhhhhhhhhhhhdddddddddddddddmdddddddmyssooyo-````````.``````````````/hmsssyyyyhhhhhh/        + `                   ::::::::::::::::::... ##..::\'##... ##: ##:::: ##: ##::\'##::. ##::::::::::::::::::::::'), nl,
write('          -/os`ohyso/-``ddhhhhhhhhhhhhhhhhdddddddddddddddddmmdddddddmyssoosy-```.-///:::....``````````-dsssyyyyhhhhhho        + :                   ::::::::::::::::::::: ##:::: ##:::..:: ##:::: ##: ##:\'##:::: ##::::::::::::::::::::::'), nl,
write('           `sdyssssssyyo+mdhhhhhhhhhhhddddddmddddddddddddmmdddddddmmyssoosh:```./oshdmNNNNNmdyo/.``````oyssyyyyhhhhhhs        + /                   ::::::::::::::::::::: ##::::. ######:: ##:::: ##: #####::::: ##::::::::::::::::::::::'), nl,
write('             /hyssssssssyhmmdddo+++ooooooyddNddddddddddmmddddddddmmyssssyd:````oNNmNNMMNmmmNMmmNNho-```:yssyyyyhhhhhhs        + +                   ::::::::::::::::::::: ##:::::..... ##: ##:::: ##: ##. ##:::: ##::::::::::::::::::::::'), nl,
write('              `/hyssssssssshdsy++++++++++oyhmhsyddddmmmmdddddddmmdssssyhd:````/yo-.`-dNNmdddNd//ohmms//-yssyyyyhhhhhd+        / +                   ::::::::::::::::::::: ##::::\'##::: ##: ##:::: ##: ##:. ##::: ##::::::::::::::::::::::'), nl,
write('          `-:++++hNmhsssssyysosyyysssyssssyhmdy+dmmmmdddddddddmdyssshddd:`````.::-   /NdhNmmNNo..-:yNo`-yssyyyyhhhhhm:        / `                   ::::::::::::::::::::: ##::::. ######::. #######:: ##::. ##:\'####:::::::::::::::::::::'), nl,
write('       `/yddhhyssssyyssssho++os+++shyo++oshydhdhmmdddddddddmmdyyyhddhdy-```````` hhosymsomyyhmy    `m//shssyyyhhhhhhN:       ``                     :::::::::::::::::::::..::::::......::::.......:::..::::..::....::::::::::::::::::::::'), nl,
write('    `sdddhhhyssssssssssssh+++y++oyysyho+++sysdhhhddmmmmmmNNmdhdddhhhh+`````````  yo+o+sddy+++:+   `+:``/ysyyyyhhhhhhM:                              ::::::::::::::::::::::::::::::\'##::: ##::\'#######::::::::::::::::::::::::::::::::::::'), nl,
write('     ohddhhhyssssssssssssy++ss+soossyys++shysomhhhhhhhhhhyyyhdhhhdho.``````````` :s+/:-----:/s:   `````+ssyyyyhhhhhmN+                              :::::::::::::::::::::::::::::: ###:: ##:\'##.... ##:::::::::::::::::::::::::::::::::::'), nl,
write('       `-oddhyssssssssssys+oy+ohsoso+hysyyyho+hddhhhyyyyyyhddhhdy+-``````````````.o/-.....::/s- ``..``.hssyyyhhhhhdNms              -:              :::::::::::::::::::::::::::::: ###:: ##:\'##.... ##:::::::::::::::::::::::::::::::::::'), nl,
write('          `./oshmmddhsssh++sooyssssyohhhyyhs+syymmmddhhhhdddddm/.````````````````````.................ossyyyyhhhhhNNNd`          `:yo               :::::::::::::::::::::::::::::: ## ## ##: ##:::: ##:::::::::::::::::::::::::::::::::::'), nl,
write('            `/ydhyssssssyysosy+ssssssyyyhys+sysydddmhhhdhddddds```````.`````````````....-.-..-.--..../hssyyyhhhhhmmmmmdys+++++osydy:                :::::::::::::::::::::::::::::: ##. ####: ##:::: ##:::::::::::::::::::::::::::::::::::'), nl,
write('          `+hhhssssssssssysysy++++++shyyso+shsydddmhyyyyyhdddh.`````````````````````....-.--.-.-.-../hssyyyhhhhhmmmmdhhddddddddy+.                  :::::::::::::::::::::::::::::: ##:. ###: ##:::: ##:::::::::::::::::::::::::::::::::::'), nl,
write('         /dhhhhsssssssssssh++osssyyyhyyssyyysydddmhhhyyyydddy.``````````````````````......--...-..-oysyyyyhhhhhmmmmmddddhyyo+-``                    :::::::::::::::::::::::::::::: ##::. ##:. #######::::::::::::::::::::::::::::::::::::'), nl,
write('       `+dhhhhhhyssyhdhsssh+++++++oohyyyyyyyhdddmdhhhyyyddds.````````````````````````.`.....-...:oyyyyyyyhhhhdmmmmmmmms```                          :\'######::\'##::::\'##:\'##::::\'##:\'##::::\'##:\'##:::\'##::::\'###::::\'##:::\'##:\'##::::\'##:'), nl,
write('       /yyyhhhhyys+hmyssssyysssssyyhhhhhhhhhhhdmdhhhhhhddd+.````````````````````````````````-+syyyhhyyyhhhhdmNmmmmmmmmd                             \'##... ##: ##:::: ##: ##:::: ##: ##:::: ##: ##::\'##::::\'## ##::: ##::\'##:: ##:::: ##:'), nl,
write('  /     ```....`` odysssssshyssyddhhhdhhhhhhhdmdhhhhddhdh:``````-:.````````.:``````````````:``../shyyyhhhdmmmNmmmmmmmmm:                             ##:::..:: ##:::: ##: ##:::: ##: ##:::: ##: ##:\'##::::\'##:. ##:: ##:\'##::: ##:::: ##:'), nl,
write('  h              :Nhyssssssymhddhhhhmdhhhhhhdmdhddddhhdo.````````.-:-.``.---.``````````````ssooyyyyyhhddmmmddNmmmmmmmmmd`       -.                  . ######:: #########: ##:::: ##: ##:::: ##: #####::::\'##:::. ##: #####:::: ##:::: ##:'), nl,
write('  ss`            +mhhysssssymddmdddddhhhhddmmddddhhhdy:````````````````````````````````````.-/oosssshNmmmmddmmmmmmmmmmmmy`      -m.         .`      :..... ##: ##.... ##: ##:::: ##: ##:::: ##: ##. ##::: #########: ##. ##::: ##:::: ##:'), nl,
write('  `ydo-`        `+mhhhhhhddddmdhdddmdmdmmddmddhhhhhy+.````````````````````````````````````````````.:dNmmddhhNmmmmmmmmmmmmy.     -Nd`        :ss/.   \'##::: ##: ##:::: ##: ##:::: ##: ##:::: ##: ##:. ##:: ##.... ##: ##:. ##:: ##:::: ##:'), nl,
write('   `+ddhyso+++osymhhhdmmmdhhhddddhhhhhhms.-:ohddhs/-`````````````````````````````````````````````.+dmNddhhhdNmdhyyhdmmmmmmd/   .hmm+         `hmd:  . ######:: ##:::: ##:. #######::. #######:: ##::. ##: ##:::: ##: ##::. ##:. #######::'), nl,
write('     `/yhdddddhhhmmmmmmNdhhhddhhhhhhddddh````.oh/-.````````````````````````````````````````````./o+oymdhhhdms+:----:+ymmmmmmysydmmmo          .mNm  :......:::..:::::..:::.......::::.......:::..::::..::..:::::..::..::::..:::.......:::'), nl,
write('``      .:+yhhdhddmmmmNdhhddy+/---:/osyhd+````.o+.``````````````````````````````````````````.-+o+::/sdddddms----------/hmmmmmNNmmmmo           sMN  '), nl,
write('h-           `--::::/ddddmh/----------:/dh````-/yso/-.````.....-....````````````````.-::--:/ss+::::/ymddddd-------------smmmmmmmNmm.          `hNN                                   Art By: @Takiki2828'), nl,
write('No                 -hdddms--------------od```````-/osso/:::----:::///+:-.``````.:/+/:-.``````./o+::+hmdddms--------------ymmmmmmmmmyo:.`````-+hmmd  '), nl,
write('Nds-`            -smmddms----------------y:``````````./:``````````````.:://+++//:.``````````````/s:omdddmh+--------------:mmmmmmmmmmmmmdhhhdmmmmm-                                Tsuki no Shukaku e Yokoso                              '), nl,
write('+mddy+:.````.-/oyddddddd-----------------:d/```````````````````````````````-:-..`````````````````:ssmhdmys/---------------ymmmmmmmmmmmmmmmmmmmmh.   -------------------------------------------------------------------------------------'), nl,
write(' /mdhdddddddddddddddddN/------------------yho:.```````````````````````````````````````````````````ymddmyos/---------------/Nmmmmmmmmmmmmmmmmmy/     |                                    Main Menu                                      |'), nl,
write('  .sddddhhhdddddddddmmy-------------------sh:sso-````````````````````````````````````````````````-mddmyoos+---------------:mmNmNNmmmmmmmdho/.       | 1. start  : Mulailah menjadi petani dan bayar hutangmu                            |'), nl,
write('     :shdddddddddmmmmN:-------------------sh++++hy/.```````````````````````````````````````````.:hmh+doooso----------------sydmmNh/::--`            | 2. help   : Kalo bingung mending ketik command ini ngab daripada bingung          |'), nl,
write('     `oydmdmmmmmmmmmN+--------------------sss/o::+yho:-..```````````````````````````````````.--/dy/sohooooo---------------:+++hNmmms-               -------------------------------------------------------------------------------------'), nl.

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
