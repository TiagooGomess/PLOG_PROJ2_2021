:-ensure_loaded('utils.pl').

askForInput(Question, Input) :-
    repeat,
    (
        (
            nl,nl,
            write(Question),nl,
            read(Input),
            isListOfVariables(Input),!
        );
        nl,nl,write('Please enter a list of variables'),nl,nl,fail
    ).

askGameInputs(Operand1, Operand2, Result, Variables) :-
    askForInput('Enter the first operand (List of variables):', Operand1),
    askForInput('Enter the second operand (List of variables):', Operand2),
    askForInput('Enter the result (List of variables):', Result),
    askForInput('Enter the list of used variables:', Variables).