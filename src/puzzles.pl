
getPuzzle(1, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [G,R],
    Result = [B,G],
    Variables = [R,G,B].

getPuzzle(2, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B],
    Operand2 = [B,G],
    Result = [R,R,R],
    Variables = [R,G,B].

getPuzzle(3, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,R,G],
    Variables = [R,G,B].

getPuzzle(4, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [B,R],
    Result = [B,G,B],
    Variables = [R,G,B].

getPuzzle(5, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B],
    Operand2 = [R,G],
    Result = [R,R,G],
    Variables = [R,G,B].

getPuzzle(6, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G,R],
    Operand2 = [R,G],
    Result = [R,B,R],
    Variables = [R,G,B].

getPuzzle(7, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [G,B],
    Result = [B,G,G],
    Variables = [R,G,B].

getPuzzle(8, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B,R],
    Operand2 = [R,G],
    Result = [G,B,G],
    Variables = [R,G,B].

getPuzzle(9, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G,B],
    Operand2 = [G,R],
    Result = [R,B,B],
    Variables = [R,G,B].

getPuzzle(10, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R,B],
    Operand2 = [B,B],
    Result = [G,R,G],
    Variables = [R,G,B].

getPuzzle(11, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B,G],
    Operand2 = [B,R],
    Result = [G,B,R],
    Variables = [R,G,B].

getPuzzle(12, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G],
    Operand2 = [G,R],
    Result = [R,G,G],
    Variables = [R,G,B].

getPuzzle(13, Operand1, Operand2, Result, Variables) :-
    Operand1 = [R],
    Operand2 = [R,B],
    Result = [G,B,G],
    Variables = [R,G,B].

getPuzzle(14, Operand1, Operand2, Result, Variables) :-
    Operand1 = [B],
    Operand2 = [B,R],
    Result = [G,R,R],
    Variables = [R,G,B].

getPuzzle(15, Operand1, Operand2, Result, Variables) :-
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,B,R],
    Variables = [R,G,B].
