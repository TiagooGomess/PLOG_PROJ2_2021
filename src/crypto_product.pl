:-use_module(library(clpfd)).

generate_multipliers(1, [1]).
generate_multipliers(Num, [X | Tail]) :-
    NewNum is Num-1,    
    !,
    generate_multipliers(NewNum, Tail),
    !,
    Tail = [Last | _],
    X is 10 * Last.

crypto_product(Operand1, Operand2, Result, Variables) :-
    
    domain(Variables, 1, 9),
    all_distinct(Variables),
    
    length(Operand1, LOperand1),
    generate_multipliers(LOperand1, MultipliersOp1),
    !,
    Operand1Max is 10^LOperand1,
    domain([Operand1Result], 0 , Operand1Max),
    scalar_product(MultipliersOp1, Operand1, #=, Operand1Result),

    !,
    length(Operand2, LOperand2),
    generate_multipliers(LOperand2, MultipliersOp2),
    !,
    Operand2Max is 10^LOperand2,
    domain([Operand2Result], 0 , Operand2Max),
    scalar_product(MultipliersOp2, Operand2, #=, Operand2Result),

    !,
    length(Result, LResult),
    generate_multipliers(LResult, MultipliersResult),
    !,
    ResultMax is 10^LResult,
    domain([ResultScalar], 0 , ResultMax),
    scalar_product(MultipliersResult, Result, #=, ResultScalar),
    !,

    Operand1Result * Operand2Result #= ResultScalar,
    labeling([], Variables).
