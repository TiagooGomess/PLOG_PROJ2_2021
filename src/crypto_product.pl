:-use_module(library(clpfd)).

generate_multipliers(1, [1]).
generate_multipliers(Num, [X | Tail]) :-
    NewNum is Num-1,    
    !,
    generate_multipliers(NewNum, Tail),
    !,
    Tail = [Last | _],
    X is 10 * Last.

crypto_product :-
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,B,R],
    Variables = [G,B,R],
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
    labeling([], Variables),
    write(Variables).

/*# 1
    Operand1 = [R],
    Operand2 = [G,R],
    Result = [B,G],
# 2
    Operand1 = [B],
    Operand2 = [B,G],
    Result = [R,R,R],
# 3
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,R,G],
# 4
    Operand1 = [R],
    Operand2 = [B,R],
    Result = [B,G,B],
# 5
    Operand1 = [B],
    Operand2 = [R,G],
    Result = [R,R,G],
# 6
    Operand1 = [G,R],
    Operand2 = [R,G],
    Result = [R,B,R],
# 7
    Operand1 = [R],
    Operand2 = [G,B],
    Result = [B,G,G],
# 8
    Operand1 = [B,R],
    Operand2 = [R,G],
    Result = [G,B,G],
# 9
    Operand1 = [G,B],
    Operand2 = [G,R],
    Result = [R,B,B],
# 10
    Operand1 = [R,B],
    Operand2 = [B,B],
    Result = [G,R,G],
# 11
    Operand1 = [B,G],
    Operand2 = [B,R],
    Result = [G,B,R],
# 12
    Operand1 = [G],
    Operand2 = [G,R],
    Result = [R,G,G],
# 13
    Operand1 = [R],
    Operand2 = [R,B],
    Result = [G,B,G],
# 14
    Operand1 = [B],
    Operand2 = [B,R],
    Result = [G,R,R],
# 15
    Operand1 = [G],
    Operand2 = [G,B],
    Result = [B,B,R],
*/