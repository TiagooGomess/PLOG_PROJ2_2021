:-ensure_loaded('utils.pl').
:-ensure_loaded('puzzles.pl').
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
    read(Input),nl,!,
	(
        Input = 1 -> startGame,!;
        Input = 2 -> howToPlay, play,!; % entra em howToPlay e volta para play.
        Input = 3;

		nl, write('Invalid input!'), nl,
		pressEnterToContinue,nl,!,
        play
    ).

% imprime o menu dos modos do puzzle
printPuzzleModesMenu:-
	clearScreen,
	printHeader,
	write('='), nl,
	write('=   1. Choose an existing puzzle'), nl,
	write('=   2. Enter a new puzzle'), nl,
	write('=   3. Back'), nl,
	write('='), nl,
	write('=========================================================================================================================================='), nl,
	write('Choose an option:'), nl.

% menu dos modos do puzzle
puzzleModesMenu(Operand1, Operand2, Result, Variables):-
	printPuzzleModesMenu,
    read(Input),nl,!,
	(
        Input = 1 -> clearScreen, choosePuzzleMenu(Operand1, Operand2, Result, Variables);
        Input = 2 -> clearScreen, askGameInputs(Operand1, Operand2, Result, Variables);
        Input = 3 -> mainMenu,!;

		nl, write('Invalid input!'), nl,
		pressEnterToContinue,nl,!,
        puzzleModesMenu(Operand1, Operand2, Result, Variables)
    ).

% imprime o menu dos modos do puzzle
printChoosePuzzleMenu:-
	clearScreen,
	printHeader,
	write('='), nl,
    write('=   0. Back'), nl,
	write('=   1. R x GR = BG'), nl,
	write('=   2. B x BG = RRR'), nl,
	write('=   3. G x GB = BRG'), nl,
    write('=   4. R x BR = BGB'), nl,
	write('=   5. B x RG = RRG'), nl,
	write('=   6. GR x RG = RBR'), nl,
    write('=   7. R x GB = BGG'), nl,
	write('=   8. BR x RG = GBG'), nl,
	write('=   9. GB x GR = RBB'), nl,
    write('=   10. RB x BB = GRG'), nl,
	write('=   11. BG x BR = GBR'), nl,
	write('=   12. G x GR = RGG'), nl,
    write('=   13. R x RB = GBG'), nl,
	write('=   14. B x BR = GRR'), nl,
	write('=   15. G x GB = BBR'), nl,
	write('='), nl,
	write('=========================================================================================================================================='), nl,
	write('Choose an option:'), nl.

% menu dos modos do puzzle
choosePuzzleMenu(Operand1, Operand2, Result, Variables):-
	printChoosePuzzleMenu,
    read(Input),nl,!,
	(   
        Input = 0 -> puzzleModesMenu(Operand1, Operand2, Result, Variables),!;
        Input = 1 -> getPuzzle(1, Operand1, Operand2, Result, Variables);
        Input = 2 -> getPuzzle(2, Operand1, Operand2, Result, Variables);
        Input = 3 -> getPuzzle(3, Operand1, Operand2, Result, Variables);
        Input = 4 -> getPuzzle(4, Operand1, Operand2, Result, Variables);
        Input = 5 -> getPuzzle(5, Operand1, Operand2, Result, Variables);
        Input = 6 -> getPuzzle(6, Operand1, Operand2, Result, Variables);
        Input = 7 -> getPuzzle(7, Operand1, Operand2, Result, Variables);
        Input = 8 -> getPuzzle(8, Operand1, Operand2, Result, Variables);
        Input = 9 -> getPuzzle(9, Operand1, Operand2, Result, Variables);
        Input = 10 -> getPuzzle(10, Operand1, Operand2, Result, Variables);
        Input = 11 -> getPuzzle(11, Operand1, Operand2, Result, Variables);
        Input = 12 -> getPuzzle(12, Operand1, Operand2, Result, Variables);
        Input = 13 -> getPuzzle(13, Operand1, Operand2, Result, Variables);
        Input = 14 -> getPuzzle(14, Operand1, Operand2, Result, Variables);
        Input = 15 -> getPuzzle(15, Operand1, Operand2, Result, Variables);
        
		nl, write('Invalid input!'), nl,
		pressEnterToContinue,nl,!,
        choosePuzzleMenu(Operand1, Operand2, Result, Variables)
    ).

startGame:-
    puzzleModesMenu(Operand1, Operand2, Result, Variables),!,
    clearScreen,
	printHeader,!,
    crypto_product(Operand1, Operand2, Result, Variables),!,
    write('Result:'),nl,
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