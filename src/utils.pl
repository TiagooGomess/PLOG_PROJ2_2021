:-use_module(library(lists)).

% se não tivessemos o get_char(_), não conseguíamos obter o próximo input
getChar(Input):-
	get_char(Input),nl,
	get_char(_).

% limpa o ecrã
clearScreen:-write('\e[2J').

% espera que o user clique numa tecla para continuar
pressEnterToContinue:-
	write('Press <Enter> to continue.'), nl,
	get_char(_), !.

% imprime o cabeçalho com o nome do puzzle
printHeader:-
    write('=========================================================================================================================================='), nl,
    write('   _____                          _                      _____                       _                  _    '), nl,
    write('  / ____|                        | |                    |  __ \\                     | |                | |      '), nl,
    write(' | |       _ __   _   _   _ __   | |_    ___    ______  | |__) |  _ __    ___     __| |  _   _    ___  | |_    '), nl,
    write(' | |      |  __| | | | | | _  \\  | __|  / _ \\  |_____|  |  ___/  |  __|  / _ \\   / _` | | | | |  / __| | __|   '), nl,
    write(' | |____  | |    | |_| | | |_) | | |_  | (_) |          | |      | |    | (_) | | (_| | | |_| | | (__  | |_    '), nl,
    write('  \\_____| |_|     \\__, | | .__/   \\__|  \\___/           |_|      |_|     \\___/   \\__,_|  \\__,_|  \\___|  \\__|    '), nl,
    write('                   __/ | | |                                                                                     '), nl,
    write('                  |___/  |_|                                                                                    '), nl,
    write('                                                                                                             '), nl,
    write('=========================================================================================================================================='), nl.

% verifica se uma lista é composta apenas por variáveis
isListOfVariables(List):-
    is_list(List),
    length(List, Len),
    isListOfVariables(List, Len).
isListOfVariables([],0).
isListOfVariables([H|T],Len):-
    Len1 is Len-1,
    var(H),
    isListOfVariables(T,Len1).