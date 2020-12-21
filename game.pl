
:-ensure_loaded('utils.pl').

play:-
    mainMenu.

% imprime o menu principal
printMainMenu:-
	clearScreen,
	printHeader,
	write('='), nl,
	write('=   1. Play'), nl,
	write('=   2. How to play'), nl,
	write('=   3. Exit'), nl,
	write('='), nl,
	write('=========================================================================================================================================='), nl,
	write('Choose an option:'), nl.

% menu principal
mainMenu:-
	printMainMenu,
    getChar(Input),
	(
        Input = '1' -> gameModeMenu;
        Input = '2' -> howToPlay, play; % entra em howToPlay e volta para play.
        Input = '3';

		nl, write('Invalid input!'), nl,
		pressEnterToContinue,nl,
        play
    ).

gameModeMenu:-
    write('YES').

% imprime as instruções do jogo
howToPlay:-
	clearScreen,
	write('=========================================================================================================================================='), nl,
	write('=     :::: How To Play ::::                                   ='), nl,
	write('=========================================================================================================================================='), nl,
	write('='), nl,
	write('=   Definitions:'), nl,
	write('=   '), nl,
	write('=========================================================================================================================================='), nl,
	pressEnterToContinue, nl.