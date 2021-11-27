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


start:- isStarted(1) -> write('Permaina sudah dimulai. Selesaikan dulu dong!\n'), !, fail.

mainMenu:-
write('                             \033[92mTsuki no Shukaku e Yokoso\033[0m                                   '),nl,
write('-------------------------------------------------------------------------------------'),nl,
write('|                                    Main Menu                                      |'),nl,
write('| 1. start  : Mulailah menjadi petani dan bayar hutangmu                            |'),nl,
write('| 2. help   : Kalo bingung mending ketik command ini ngab daripada bingung          |'),nl,
write('-------------------------------------------------------------------------------------'),nl.

startGame:- bannerTsukiNoShukaku, nl,
            mainMenu.

start:- write('Silakan pilih job anda.'),nl,         
        asserta(isStarted(1)),
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
quit.
main.
map.
*/
status :- isStarted(1) -> username(Username), checkStatus(Username).

map :- isStarted(1) -> printMap(0,15).

help:-
write('-------------------------------------------------------------------------------------'),nl,
write('| \033[93mDaftar Command\033[0m                                                                    |'),nl,
write('| Command Umum (Bisa dipake di mana aja ngab)                                       |'),nl,
write('| 1. start  : Mulailah bermain menjadi petani dan bayar hutangmu                    |'),nl,
write('| 2. map    : Nampilin peta supaya gak buta map kek dora                            |'),nl,
write('| 3. status : Mau cek status udah ganteng belum?? masukin command ini ngab          |'),nl,
write('| Command Jalan (Buat nyamperin perkebunan, perternakan, dan tempat-tempat lain)    |'),nl,
write('| 4. w      : jalan ke utara 1 langkah (makan waktu ini ngab ati-ati)               |'),nl,
write('| 5. s      : jalan ke selatan 1 langkah (makan waktu ini ngab ati-ati)             |'),nl,
write('| 6. d      : jalan ke ke timur 1 langkah (makan waktu ini ngab ati-ati)            |'),nl,
write('| 7. a      : jalan ke barat 1 langkah (makan waktu ini ngab ati-ati)               |'),nl,
write('| Commad Market (Bisa dipake di pasar aja)                                          |'),nl,
write('| 8. buy                                                                            |'),nl,
write('| 9. sell                                                                           |'),nl,
write('-------------------------------------------------------------------------------------'),nl.
quit :- \+isStarted(_), write('\033[91mCOMAND TIDAK VALID!!!!\033[0m Permain belum dimulai masa sudah keluar, mabok gan??!'), !.

quit :- write('Cepat kembali petani, hutangmu tidak bisa dibayar dengan daun dan juga kasian dengan'),nl,
        write('\033[94m~~lolimu~~\033[0m ladang dan peternakanmu tidak terurus'), retract(isStarted(_)), !.

