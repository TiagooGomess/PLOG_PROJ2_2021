
getPuzzle(1, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [G,R],
    Result = [B,G].

getPuzzle(2, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B],
    Operand2 = [B,G],
    Result = [R,R,R].

getPuzzle(3, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,R,G].

getPuzzle(4, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [B,R],
    Result = [B,G,B].

getPuzzle(5, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B],
    Operand2 = [R,G],
    Result = [R,R,G].

getPuzzle(6, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G,R],
    Operand2 = [R,G],
    Result = [R,B,R].

getPuzzle(7, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [G,B],
    Result = [B,G,G].

getPuzzle(8, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B,R],
    Operand2 = [R,G],
    Result = [G,B,G].

getPuzzle(9, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G,B],
    Operand2 = [G,R],
    Result = [R,B,B].

getPuzzle(10, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R,B],
    Operand2 = [B,B],
    Result = [G,R,G].

getPuzzle(11, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B,G],
    Operand2 = [B,R],
    Result = [G,B,R].

getPuzzle(12, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G],
    Operand2 = [G,R],
    Result = [R,G,G].

getPuzzle(13, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [R,B],
    Result = [G,B,G].

getPuzzle(14, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B],
    Operand2 = [B,R],
    Result = [G,R,R].

getPuzzle(15, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,B,R].
