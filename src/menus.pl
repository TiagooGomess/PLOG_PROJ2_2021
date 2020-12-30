:-ensure_loaded('utils.pl').
:-ensure_loaded('puzzle.pl').
:-ensure_loaded('crypto_product.pl').

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
    %askPuzzle(Puzzle,LenList),nl,
    %write('The puzzle is '),write(Puzzle),nl,nl,
    %write('The len is '),write(LenList),nl,nl,
    %Puzzle = [[R],[G,R],[B,G]],
    %LenList = [1,2,2],
    %solve_crypto(Puzzle,LenList,Vars),nl,nl,displaySolution(Vars),nl,nl;
    %write('There is no solution to this puzzle!'),nl,nl.

    /* Restrictions = [[0],[1,0],[2,1]],
    LenList = [1,2,2]
    crypto3(Restrictions,LenList,Solutions),
    displaySolution(Solutions). */

    crypto_product.





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