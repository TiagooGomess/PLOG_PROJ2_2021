:-use_module(library(clpfd)).

:-ensure_loaded('utils.pl').
:-ensure_loaded('play.pl').

% gera multiplicadores baseados no tamanho dos operandos
% (e.g.Operando = RGB, Multiplicadores = [100,10,1])
generate_multipliers(1, [1]).
generate_multipliers(Num, [X | Tail]) :-
    NewNum is Num-1,    
    !,
    generate_multipliers(NewNum, Tail),
    !,
    Tail = [Last | _],
    X is 10 * Last.

% puzzle solver
crypto_product(Operand1, Operand2, Result, Variables, PostingConstrainsTime, LabelingTime) :-   
    
    % ------------ declarar variáveis e domínios ----------------------------
    domain(Variables, 0, 9),

    length(Operand1, LOperand1),
    Operand1Max is 10^LOperand1,
    Operand1Min is 10^(LOperand1-1),
    domain([Operand1Result], Operand1Min , Operand1Max),

    length(Operand2, LOperand2),
    Operand2Max is 10^LOperand2,
    Operand2Min is 10^(LOperand2-1),
    domain([Operand2Result], Operand2Min , Operand2Max),

    length(Result, LResult),
    ResultMax is 10^LResult,
    ResultMin is 10^(LResult-1),
    domain([ResultScalar], ResultMin , ResultMax),

    reset_timer,

    % ------------ restrições -----------------------------------------------

    all_distinct(Variables),
    
    generate_multipliers(LOperand1, MultipliersOp1),!,
    scalar_product(MultipliersOp1, Operand1, #=, Operand1Result),

    !,generate_multipliers(LOperand2, MultipliersOp2),!,
    scalar_product(MultipliersOp2, Operand2, #=, Operand2Result),

    !,generate_multipliers(LResult, MultipliersResult),!,
    scalar_product(MultipliersResult, Result, #=, ResultScalar),!,

    Operand1Result * Operand2Result #= ResultScalar,


    get_runtime(PostingConstrainsTime),

    % ------------ pesquisa de solução ---------------------------------

    labeling([], Variables),

    get_runtime(LabelingTime),
    nl,nl,write('--> Statistics:'), nl,nl,
    fd_statistics.


% Imprime uma lista de inteiros como um número inteiro
printNumberList(List):-
    length(List,Len),
    printNumberList(List,Len).
printNumberList([],0).
printNumberList([H|T],Len):-
    Len > 0,
    Len1 is Len - 1,
    write(H),
    printNumberList(T,Len1).

% Imprime no ecrã a solução do puzzle
printResult(Operand1, Operand2, Result, PostingConstrainsTime, LabelingTime) :-
    nl,nl,
    write('--> Result:'),nl,nl,
    printNumberList(Operand1),write(' x '),
    printNumberList(Operand2),write(' = '),
    printNumberList(Result),nl,nl,nl,nl,
    write('--> Statistics:'), nl,nl,
    print_time('Posting Constraints: ',PostingConstrainsTime),
    print_time('Labeling Time: ',LabelingTime),nl,nl,nl,nl,
    pressEnterToContinue,
    play.

