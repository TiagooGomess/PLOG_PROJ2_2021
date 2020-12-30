:-use_module(library(clpfd)).
:-use_module(library(lists)).

:-ensure_loaded('utils.pl').

% pergunta ao utilizador o puzzle que quer que seja resolvido;
% Puzzle é uma lista que contém 3 listas:
% - os dois primeiros elementos são as representações dos números que queremos multiplicar,
% - o terceiro é a representação do resultado;
% por exemplo, para o puzzle R x GR = BG, a variável Puzzle seria [[R],[G,R],[B,G]]
askPuzzle(Puzzle,LenList):-
    nl,
    write('    ---> Please enter the first number colors: <---'),
    askNumberColors(FirstNumberColors,Len1),nl,clearScreen,printHeader,nl,
    write('    ---> Please enter the second number colors: <---'),
    askNumberColors(SecondtNumberColors,Len2),nl,clearScreen,printHeader,nl,
    write('    ---> Please enter the result number colors: <---'),
    askNumberColors(ResultNumberColors,Len3),nl,clearScreen,printHeader,nl,
    Puzzle = [FirstNumberColors,SecondtNumberColors,ResultNumberColors],
    LenList = [Len1,Len2,Len3].

% pede ao jogador um número, em que os dígitos desse número são caracteres que representam cores;
% primeiro é pedido o número de dígitos do número
askNumberColors(NumberColors,Len):-
    repeat,
    (
        (
            nl,nl,
            write(' --> How many digits the number contains? '),nl,
            read(Len),
            integer(Len),
            Len > 0,
            Len =< 9,
            askNumberColors(NumberColors,[],Len),!
        );
        nl,nl,write('Please enter a number between 1 and 9'),nl,nl,fail
    ).
askNumberColors(NumberColors,NumberColors,0).
% pedimos a representação do número dígito a dígito
askNumberColors(NC,NumberColors,Len):-
    repeat,
    (
        (
            Len > 0,
            Len1 is Len - 1,
            nl,nl,
            write('Please enter the color of the digit: '),nl,
            read(Color),
            %var(Color),
            atom(Color),
            \+ number(Color),
            append(NumberColors,[Color],NumberColors1),
            askNumberColors(NC,NumberColors1,Len1),!
        );
        nl,nl,write('Please enter a lowercase string'),nl,nl,fail
    ).

% puzzle exemplo
crypto:-
    Vars = [R,G,B],
    domain(Vars,0,9),
    nl,nl,write(Vars),nl,nl,
    all_distinct(Vars),
    R * (G*10 + R) #= B*10 + G,
    labeling([],Vars),
    write(Vars).

% puzzle exemplo 2
crypto2:-
    Vars = [R,G,B],
    domain(Vars,0,9),
    all_distinct(Vars),
    (G*10 + B) * (G*10 + R) #= R*100 + B*10 + B,
    labeling([],Vars),
    write(Vars).


crypto3(Restrictions,LenList,Vars):-
    Vars = [R,G,B],
    


solve_crypto(Puzzle,LenList,Vars):-

    nth0(0,Puzzle,FirstNumberColors),
    nth0(1,Puzzle,SecondtNumberColors),
    nth0(2,Puzzle,ResultNumberColors),

    nth0(0,LenList,Len1),
    nth0(1,LenList,Len2),
    nth0(2,LenList,Len3),

    (
        Len1 == 1 -> (
            nth0(0,FirstNumberColors,A1),
            B1 = 0,
            C1 = 0
        );
        Len1 == 2 -> (
            nth0(0,FirstNumberColors,A1),
            nth0(1,FirstNumberColors,B1),
            C1 = 0
        );
        Len1 == 3 -> (
            nth0(0,FirstNumberColors,A1),
            nth0(1,FirstNumberColors,B1),
            nth0(2,FirstNumberColors,C1)
        )
    ),

    (
        Len2 == 1 -> (
            nth0(0,SecondtNumberColors,A2),
            B2 = 0,
            C2 = 0
        );
        Len2 == 2 -> (
            nth0(0,SecondtNumberColors,A2),
            nth0(1,SecondtNumberColors,B2),
            C2 = 0
        );
        Len2 == 3 -> (
            nth0(0,SecondtNumberColors,A2),
            nth0(1,SecondtNumberColors,B2),
            nth0(2,SecondtNumberColors,C2)
        )
    ),
    
    (
        Len3 == 1 -> (
            nth0(0,ResultNumberColors,A3),
            B3 = 0,
            C3 = 0
        );
        Len3 == 2 -> (
            nth0(0,ResultNumberColors,A3),
            nth0(1,ResultNumberColors,B3),
            C3 = 0
        );
        Len3 == 3 -> (
            nth0(0,ResultNumberColors,A3),
            nth0(1,ResultNumberColors,B3),
            nth0(2,ResultNumberColors,C3)
        )
    ),
    

    Vars = [A1,A2,A3,B1,B2,B3,C1,C2,C3],
    domain(Vars,0,9),

    write(Vars),

    A1 #= A2,
    B2 #= B3,


    (C1 * 100 + B1*10 + C1) * (C2 * 100 + B2*10 + C2) #= (C3 * 100 + B3*10 + C3),

    labeling([],Vars).

displaySolution(Vars):-
    nth0(0,Vars,R),
    nth0(1,Vars,G),
    nth0(2,Vars,B),
    write(R),write(' X '),write(G),write(R),
    write(' = '),write(B),write(G).
    