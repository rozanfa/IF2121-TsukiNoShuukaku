/* :- include('house.pl').
:- include('items.pl').
:- include('level.pl').
:- include('marketplace.pl').*/
%:- include('inventory.pl').
:- include('map.pl').
:- include('player.pl').
:- include('time.pl').
%:- include('quest.pl').

:- dynamic(isStarted/1).
isStarted(0).

bannerTsukiNoShukaku:-
write('::::::::::::::::::\'########::\'######::\'##::::\'##:\'##:::\'##:\'####:::::::::::::::::::::'),nl,
write('::::::::::::::::::... ##..::\'##... ##: ##:::: ##: ##::\'##::. ##::::::::::::::::::::::'),nl,
write('::::::::::::::::::::: ##:::: ##:::..:: ##:::: ##: ##:\'##:::: ##::::::::::::::::::::::'),nl,
write('::::::::::::::::::::: ##::::. ######:: ##:::: ##: #####::::: ##::::::::::::::::::::::'),nl,
write('::::::::::::::::::::: ##:::::..... ##: ##:::: ##: ##. ##:::: ##::::::::::::::::::::::'),nl,
write('::::::::::::::::::::: ##::::\'##::: ##: ##:::: ##: ##:. ##::: ##::::::::::::::::::::::'),nl,
write('::::::::::::::::::::: ##::::. ######::. #######:: ##::. ##:\'####:::::::::::::::::::::'),nl,
write(':::::::::::::::::::::..::::::......::::.......:::..::::..::....::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::\'##::: ##::\'#######::::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::: ###:: ##:\'##.... ##:::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::: ####: ##: ##:::: ##:::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::: ## ## ##: ##:::: ##:::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::: ##. ####: ##:::: ##:::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::: ##:. ###: ##:::: ##:::::::::::::::::::::::::::::::::::'),nl,
write(':::::::::::::::::::::::::::::: ##::. ##:. #######::::::::::::::::::::::::::::::::::::'),nl,
write('::::::::::::::::::::::::::::::..::::..:::.......:::::::::::::::::::::::::::::::::::::'),nl,
write(':\'######::\'##::::\'##:\'##::::\'##:\'##::::\'##:\'##:::\'##::::\'###::::\'##:::\'##:\'##::::\'##:'),nl,
write('\'##... ##: ##:::: ##: ##:::: ##: ##:::: ##: ##::\'##::::\'## ##::: ##::\'##:: ##:::: ##:'),nl,
write(' ##:::..:: ##:::: ##: ##:::: ##: ##:::: ##: ##:\'##::::\'##:. ##:: ##:\'##::: ##:::: ##:'),nl,
write('. ######:: #########: ##:::: ##: ##:::: ##: #####::::\'##:::. ##: #####:::: ##:::: ##:'),nl,
write(':..... ##: ##.... ##: ##:::: ##: ##:::: ##: ##. ##::: #########: ##. ##::: ##:::: ##:'),nl,
write('\'##::: ##: ##:::: ##: ##:::: ##: ##:::: ##: ##:. ##:: ##.... ##: ##:. ##:: ##:::: ##:'),nl,
write('. ######:: ##:::: ##:. #######::. #######:: ##::. ##: ##:::: ##: ##::. ##:. #######::'),nl,
write(':......:::..:::::..:::.......::::.......:::..::::..::..:::::..::..::::..:::.......:::'),nl.


startGame:- isStarted(1) -> write('Permaina sudah dimulai. Selesaikan dulu dong!\n'), !, fail.

startGame:- isStarted(0) ->
        bannerTsukiNoShukaku, nl, asserta(isStarted(1)),
        write('Selamat Datang di Tsuki No Shukaku.'), nl,
        write('Silakan masukkan nama anda: '), read(Username), asserta(username(Username)), nl,
        write('Silakan pilih pekerjaan utama anda.'),nl,
        write('1. Petani.'),nl,
        write('2. Pemancing.'),nl,
        write('3. Peternak.'),nl,
        write('Pilihan (1/2/3): '), read(ChoosenJob),nl,

        (ChoosenJob = 1 -> createFarmer(Username),
        write('Sekarang kamu adalah petani!'), nl;
        
        ChoosenJob = 2 -> createFisher(Username),
        write('Sekarang kamu adalah pemancing!'), nl;
        
        ChoosenJob = 3 -> createRancher(Username),
        write('Sekarang kamu adalah peternak!'), nl),
        
        asserta(playerloc(2,9)).




/*
start.
quit.
main.
map.
*/
status :- isStarted(1) -> username(Username), checkStatus(Username).

map :- isStarted(1) -> printMap(0,15).

quit :- \+isStarted(_), write('COMAND TIDAK VALID!!!! \nPermain belum dimulai masa sudah keluar, mabok gan??!'), !.

quit :- write('Cepat kembali petani, hutangmu tidak bisa dibayar dengan daun dan juga kasian dengan ladang dan peternakanmu tidak terurus'), retract(isStarted(_)), !.

