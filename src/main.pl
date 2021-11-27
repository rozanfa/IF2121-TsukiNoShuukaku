/* :- include('house.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('level.pl').
:- include('marketplace.pl').
:- include('map.pl').
:- include('quest.pl').*/

:- dynamic(isStarted/1).

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
        asserta(isStarted(1)).
/*
quit.
main.
map.
*/
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