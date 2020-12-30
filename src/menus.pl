:-ensure_loaded('utils.pl').
:-ensure_loaded('puzzle.pl').
:-ensure_loaded('crypto_product.pl').
:-ensure_loaded('input.pl').

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
        Input = '1' -> startGame;
        Input = '2' -> howToPlay, play; % entra em howToPlay e volta para play.
        Input = '3';

		nl, write('Invalid input!'), nl,
		pressEnterToContinue,nl,
        play
    ).

startGame:-
    clearScreen,
	printHeader,
/*     Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,B,R],
    Variables = [G,B,R], */
    askGameInputs(Operand1, Operand2, Result, Variables),
    crypto_product(Operand1, Operand2, Result, Variables),
    write('Result:'),
    write(Variables).

% imprime as instruções do jogo
howToPlay:-
	clearScreen,
    printHeader,
    nl,nl,
	write('                                                         :::: How To Play ::::'), nl,
	nl,nl,
    write('=========================================================================================================================================='), nl,nl,
	write('    Insert a digit into each circle to make the multiplication true. Similarly colored circles should contain the same digit.'), nl,
	write('    Each puzzle has a unique solution.'), nl,nl,
	write('=========================================================================================================================================='), nl,
	pressEnterToContinue, nl.