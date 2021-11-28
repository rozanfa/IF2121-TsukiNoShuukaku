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
write('                                                    .+hmmmddds                                                       `::                        '), nl,
write('                                                   `+hmmmmdddh`                                                    .:oh.                        '), nl,
write('                                                   :ymmmdddddd:                                                  .:/sm+                         '), nl,
write('                                                  .smmdddddddds                                               `-/oydmh`                         '), nl,
write('                                                  +dmdddddddddh`                                            `-+sdmmdm:                          '), nl,
write('                                                 -ymmhhhhhhhhhd-                                          `:+ydmmmdmy`                          '), nl,
write('                                                `sdmmdhhhhhhhhh+                                        .:oymmmmmddd-                           '), nl,
write('                                                :hmmmmhhhhhhhhhy                                      ./oymmmmmmdddo                            '), nl,
write('                                                shmmmmdhhhhhhddh`                                   .+shdmmmmmddddh.                            '), nl,
write('                                               .hdmmmmmdhhhhhmdh.                                 .+yhhmmmmddhhddd/                             '), nl,
write('                                               -+hmmmmmmhhhhmmdh:                               -/+hhdmmmdhhhhhhhy`                             '), nl,
write('                                               :-ommmmmmmhhmmmdh/                             ./-+hhmmmdhhhhhhhhd-                              '), nl,
write('                                               :-/mmmmmmmmmmmmhh+                           .:--shhmmdhhhhhhhhhh+                               '), nl,
write('                                               -:-dmmmmmmmmdddhys:::/+++/:-.`             `:-.:yhdmmmhhhhhhhhhhs`                               '), nl,
write('                                               ./.ymdddhhhhhhhhhhhhhddmmddho+/-.         ./.-+hhdmmmmhhhhhhddhh`                                '), nl,
write('                                               .oshhhhhhhhhhhhhhhhhhhhdmdmmdhdhs+.      `+:oyhhdmmmmmhhhhdmmhh-                                 '), nl,
write('                                             ./shhhhhhhhhhhhhhhhhhhhhhhhdmmmmddmdy/`    /shhhhhmmmmmdhhdmmmhh:                                  '), nl,
write('                                           .:+hhhhhhhhhhhhhhhhhhhhhhhhhhdmddmmddmmdo`  .hddhhhdmmmmmddmmmmdh/                                   '), nl,
write('                                         `::/hhhhhhhhhhhhhhhhhhhhhhhhhhhhdmmdmmddmmdho/smmmmddmmmmmmmmmmmhh:                                    '), nl,
write('                                        `/-:hhhhhhhhhhhhhhhhhhhhhhhhhhhhhdmmdddmhmddmmmmmmmmmmmmmmmmmmmdhy-                                     '), nl,
write('                                       `/.-yhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdmdddmmhdmmmmmmmmmmmmmmmmmmddhho.                                      '), nl,
write('                                      `+.-yhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddddddmhdmmdmmmmdddmddmmdhhho/.                                        '), nl,
write('                                      +--hhhhhhhhhhhhhhhhhhhhhhhhhhddddddddddddmhdmmdmmmdddddddyddo:`                                           '), nl,
write('                                     ./-hhhhhhhhhhhhhhhhhddddddddddddddddddddmddhmdddmmdddddddddy+.                                             '), nl,
write('                                /:.  /.yhhhhhhhhhhhhhdddmmddmdddddddddddddddddmhdmdmmmdhdddddddddy+-                                            '), nl,
write('                       ....`    yyso:++hhhhhhhhhhhhddmmdmdddddddddddddddddddmmddmmddmmhhdhhhhhhhddy/:                                           '), nl,
write('                      `hhhhhsoo-sddyyyydhhhhhhhhhddmdddddddddddddddddddddddmmdhdmmmmmdhhdhhhhhhhhhhy/-                                          '), nl,
write('                       oddddhhhhdddyhhhhdhhhhhhhddddddddddddddddddddddddddmmdhdmmmdmdhhhdhhhhhhhhysho/.                                         '), nl,
write('                       `hddyyhyyhhhdhyyyyddhhhhdmdddddddddddddddddddddmmmdmdddmdmmmdhhhddhhhddysssssd:+                                         '), nl,
write('                        /hdyyhhhyyyyyyyyyhdmhyhdmmddddddddddddddddddddmddmddmddmmmdhhhhhdhyyddhsssyyho/-                                        '), nl,
write('                   .syssyhddhhyyyyyyyhhddddy/ooshmddddddddddddmmmmdddddmdddmmmdmmddyshh:hhysdddyssydyh-+                                        '), nl,
write('                   `odddhyhhhdhyhhyhdddhoo+/:+yo/shdddddddddddddddmddmddddmdmdmmhhysyd/.shhshddhsyydhh/+`                                       '), nl,
write('                     :yhhyyhhhyyhdhdddy+/sssoooys++ohdddddddddddddddddddddddmmdhhyyyho../hhyydmhyhhhhh+:-                                       '), nl,
write('                      -+yhhyhyyyhdddhy+oyyyhhssyhooo+ydddddddddddddddddddddmdhyyyyyyo. `-yyyyhmhhhhhhh/:/                                       ::::::::::::::::::\'########::\'######::\'##::::\'##:\'##:::\'##:\'####::::::::::::::::::::: '), nl,
write('                    ``:shdddddhyhddsohohhhhhho+yyyyooodddddddmmddddddddddmdhyyyyyyyo.`  ./yyyhmhhhhhhh/:/                                       ::::::::::::::::::... ##..::\'##... ##: ##:::: ##: ##::\'##::. ##:::::::::::::::::::::: '), nl,
write('                 ./shddhyyyyyyyyhdy/shydhhhhdysho+osyoddddddddddddddddmmdhhyyyyssso-:::-.-oyyhmhhhhhhh+//                                       ::::::::::::::::::::: ##:::: ##:::..:: ##:::: ##: ##:\'##:::: ##:::::::::::::::::::::: '), nl,
write('                .hdddddyyhhhhyyyyd++yhdhhdhhhhhh+/oooddddddddddddhddmmmdhyyyyssss+.     `.-yyhdhhhhhhy++/                                       ::::::::::::::::::::: ##::::. ######:: ##:::: ##: #####::::: ##:::::::::::::::::::::: '), nl,
write('                 `:+yyhhyyyhhyyyyhhohsdo/+sssyhsoososyhhhhhhhdddmmmmmdhhyyyyssoo:`        .-yhdhhhhhhoy//                                       ::::::::::::::::::::: ##:::::..... ##: ##:::: ##: ##. ##:::: ##:::::::::::::::::::::: '), nl,
write('                    `-/+oyhhhhhyhyhhd+sysosyysoo+oyhyhmmmmmmmmmmmmmmhhyyyyssso+-....-:::-``.-ydhyhhhh/m//                                       ::::::::::::::::::::: ##::::\'##::: ##: ##:::: ##: ##:. ##::: ##:::::::::::::::::::::: '), nl,
write('                       ./yddhhdyyhhddy/oooosyysssoydhmmmmmmmmmmmmmdhhyyyyssoo:``.:sdmmmdhdy:--yyyhhhy+N/:                                       ::::::::::::::::::::: ##::::. ######::. #######:: ##::. ##:\'####::::::::::::::::::::: '), nl,
write('                      `+hdhyyhhhhyyhhdhhyysssoooooyhdmmmmmmmmmmmdhhyyyyssso/.` `syyhhs//-:yy..yyyhhh+dm/-                                       :::::::::::::::::::::..::::::......::::.......:::..::::..::....:::::::::::::::::::::: '), nl,
write('                     `ydddhyyyhhhdhdyyyhhhhhhhhhdhshhhdmmmmmmmdhhyyyyyyyy+-`   -s/syo:::``+s-syyyhhssmh+`                                       ::::::::::::::::::::::::::::::\'##::: ##::\'#######:::::::::::::::::::::::::::::::::::: '), nl,
write('                     `:/+++//+yddyyhdddddmmmdddmmmyhhhhhdddmdhhhhhhhhhyy/`     `-..-`.-``-o-ohyyhhyommy+                                        :::::::::::::::::::::::::::::: ###:: ##:\'##.... ##::::::::::::::::::::::::::::::::::: '), nl,
write('                          ````hddhddddmmNNmhdmmmmmmdhhhhhhhhhhhhhhhhyso:`      ````````.::.+hyyyhysmmmo/                                        :::::::::::::::::::::::::::::: ####: ##: ##:::: ##::::::::::::::::::::::::::::::::::: '), nl,
write('                             :mdys++sdddhhddmmmmmmmmmdddddddddddhhyso+:````  `````````````/hyyyyhhmmmm+/                                        :::::::::::::::::::::::::::::: ## ## ##: ##:::: ##::::::::::::::::::::::::::::::::::: '), nl,
write('                             `...```oshhhmmmmmmmmmdmmmmmmmmdddhhysoo/.`````` ```````.```./ssyyyhdmmmmho/                                        :::::::::::::::::::::::::::::: ##. ####: ##:::: ##::::::::::::::::::::::::::::::::::: '), nl,
write('                                   -:yhhhmmmmmmmmddmmmmmmmmdhyysso+:```````` ```````.:/+sssyyhdddmdmmhy/                                        :::::::::::::::::::::::::::::: ##:. ###: ##:::: ##::::::::::::::::::::::::::::::::::: '), nl,
write('                `.-`               +:hhdyhmmmmmmhhmmmmmmdhyyyssso/`            ```-::/+ossyhddhhdmdhmmh+`                                       :::::::::::::::::::::::::::::: ##::. ##:. #######:::::::::::::::::::::::::::::::::::: '), nl,
write('              `/+:`               `/yhhmmsyddmdhhmmmmmdhhyyyyss+.                  .:+oyhdmmmhhhmmmdhhd+:                                       :\'######::\'##::::\'##:\'##::::\'##:\'##::::\'##:\'##:::\'##::::\'###::::\'##:::\'##:\'##::::\'##: '), nl,
write('             .so`        ./`      /+hhdmddhyyhhhhdddddhhhhhhy+.       `.`.           .smmmmmdhydmmmmmdhhs+:--.-:/.                              \'##... ##: ##:::: ##: ##:::: ##: ##:::: ##: ##::\'##::::\'## ##::: ##::\'##:: ##:::: ##: '), nl,
write('            .ho-        .+-      .+hhdmdddhddhhddddddddmmmmdo.         `          `:sdmmmmmdhyhNmmmdmmmdo+/:--.`                                 ##:::..:: ##:::: ##: ##:::: ##: ##:::: ##: ##:\'##::::\'##:. ##:: ##:\'##::: ##:::: ##: '), nl,
write('            +h::        /+-      +shmmhdhhhhdmmmmmmmmmmmddddh--.`             `./ohmmdddmmdhshmmmmmdhdmm+/                  `                   . ######:: #########: ##:::: ##: ##:::: ##: #####::::\'##:::. ##: #####:::: ##:::: ##: '), nl,
write('            sh//`       -ys+::::osddhhhhhhhdmmmmmmmmmmmdddhhy:.---..`     ``-+syhhhdmmddddyymmmmmmmmdhdmh/:                 -o.                 :..... ##: ##.... ##: ##:::: ##: ##:::: ##: ##. ##::: #########: ##. ##::: ##:::: ##: '), nl,
write('            ody+:        .oyhhhhdhhhhhhhhhmmmmmmmmmmmmmhs/-.--....----...---.:+syyyhmmmddhhmmmmmmmmdmhhhds/-                `/s-                \'##::: ##: ##:::: ##: ##:::: ##: ##:::: ##: ##:. ##:: ##.... ##: ##:. ##:: ##:::: ##: '), nl,
write('            .hdhy+`        `-/osyhhhhhhhdmhsyyddhhhhhs/-...--.........---.-:-...:++/++s+oy:/dhsyhmmmddhhhhs+-               `//s                . ######:: ##:::: ##:. #######::. #######:: ##::. ##: ##:::: ##: ##::. ##:. #######:: '), nl,
write('             .sdddh/.  `..:/+syhhhhhhhhhyy+oo/:+ss:--.....-:..............-:---.....--..-yo.o+..-:sdmddhhhhhs/`             /-/y                :......:::..:::::..:::.......::::.......:::..::::..::..:::::..::..::::..:::.......::: '), nl,
write('               ./yddhssssyyyhhhhhhhdd+-----:/os:-oy:.......-:-.............-..-:---.`-.``:o.-+.....-smdddhhhhhy/.         `//+h+                '), nl,
write('                 `/yddhhhhhhhhhdddhh/........./y-`+s:.......-:-............-..-:--```.-. .o:`/.......smhhddhhhhhyo/--.-:/oyhddy`                '), nl,
write('                   `:ohddddddddhhhd+.........../s.`/o.````````:-----......:-:-.:-.`.----``++ :-......`odsyhddhhhhhhhhdddddddhs.                                               Tsuki no Shukaku e Yokoso                              '), nl,
write('                      `./osyydddmmh.............:o``++`        -:-..---...:.-``.--::-..``.+o`-:.......`+y+/oyhddhhhhhhhhhhho-                   -------------------------------------------------------------------------------------'), nl,
write('                            `hmmmN+...........:-./o``+/`        `:-`  ````:.```::-:.```.``/o`-/-........+s: `.:+osyyyyss+:.                     |                                    Main Menu                                      |'), nl,
write('                            /ohhmN...........-//:.o/ .o:          -:.`...-``.--...:/:-.```.o`-/:.........+y                                     | 1. start  : Mulailah menjadi petani dan bayar hutangmu                            |'), nl,
write('                           :ohhmmh`..........-///::o- :o-          `/-..-``````.-...-::-.``:`://..........o+                                    | 2. help   : Kalo bingung mending ketik command ini ngab daripada bingung          |'), nl,
write('                          -+hhdmdo`...........-://+/o``++`          `-- `. ```````.-.`.:.```.///.........--d:                                   -------------------------------------------------------------------------------------'), nl,
write('  -/:                    .oyhdmhh-`..............-:++/ .o:          ``./-:   `````````-.:.`..+:........-:/:+d.                                  '), nl,
write('./+`                    .shdmmhyy`.:-..............-/+. /o`       `````./:.  ````````---:``.:/........-:--.`od.                 `/.             '), nl,
write('/s.                    -ydmmdhhhs./:.................-:`.o/     ````````.//`  ``````.:--.``-//:::-...........sh-                `sy/.           '), nl,
write('+y                    :dmmmdhhhhh//-...................-.+o`    `````...-/o.  ```````::-```///::-.............yd:                /hs::          '), nl,
write('hh`                 `+dmmddhhhhhhy+......................:o/.-:://++++////+/` ```````--.``-+:-......---:::::-.-hd/               :hho::         '), nl,
write('hd:                -smmmdddhhhhhhh/.........---::::::-..../o//:---....--:::+:   `````.:`` :/----:::::////////:-:ddo.            `shhh:+         '), nl,
write('hhh:           `.-odmmddddddhhhhhs......--:://////:-..--:-//.--.-:/+syhhhdy/o`  `````.:`` -///////////::///////+mddy/`        `:shhhh+/         '), nl,
write('hhhho:.````..-::ohmmdddddddddhhdd-....-::////////:..-::////oyhyosyyyyyyyyd/+/`     ``:.   .////::-----:-//////sdmmddhy+-...-/oyhhhhhho-         '), nl,
write('hhhhhhhyyssoooohmmddddddddddddmd/..-:://////////:--::::////yddhyyyyyyhdddmoo.      `--`   `oo++++++///:::+///odddddmdhhyshdddddhhyso+.          '), nl,
write('+syhhhhhhhhddmmdmddddddmmdddds:/::://///////+///:--..---::/ydhyyyyyhddddhhh:      `--.`   `-.........-:+++o+. :shhhhhdhhyyyyhhy+:--`            '), nl,
write('shhhhhddmmmmmmmmmmmmmmmmmds:`  -+//////////+/:-.-/+oo++///+sddhyyyhddhhyyho`````` ./..```` -:---------:-.-++`   .:/+ooooo+/:-`                  '), nl.

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
