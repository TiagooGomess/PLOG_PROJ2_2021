:-use_module(library(lists)).

:-ensure_loaded('utils.pl').

% pede ao utilizador a lista que representa o puzzle, validando o input
askGameInputs(Operand1, Operand2, Result, Variables) :-
    repeat,
    (
        
        clearScreen,
        printHeader,
        nl,nl,
        write('Please enter a list with the template [Operand1,Operand2,Result,Variables].'),nl,
        read(Input),
        parseInput(Input,Operand1,Operand2,Result,Variables),!
    ).

% Puzzle é uma lista com 4 listas, que correspondem a Operand1, Operand2, Result e Variables
parseInput(Puzzle, Operand1, Operand2, Result, Variables):-
    is_list(Puzzle),

    length(Puzzle,Len),
    Len == 4,

    nth0(0,Puzzle,Operand1),
    isListOfVariables(Operand1),

    nth0(1,Puzzle,Operand2),
    isListOfVariables(Operand2),

    nth0(2,Puzzle,Result),
    isListOfVariables(Result),

    nth0(3,Puzzle,Variables),
    isListOfVariables(Variables).