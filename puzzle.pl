:-use_module(library(clpfd)).
:-use_module(library(lists)).

:-ensure_loaded('utils.pl').

% pergunta ao utilizador o puzzle que quer que seja resolvido;
% Puzzle é uma lista que contém 3 listas:
% - os dois primeiros elementos são as representações dos números que queremos multiplicar,
% - o terceiro é a representação do resultado;
% por exemplo, para o puzzle R x GR = BG, a variável Puzzle seria [[R],[G,R],[B,G]]
askPuzzle(Puzzle):-
    nl,
    write('    ---> Please enter the first number colors: <---'),
    askNumberColors(FirstNumberColors),nl,clearScreen,printHeader,nl,
    write('    ---> Please enter the second number colors: <---'),
    askNumberColors(SecondtNumberColors),nl,clearScreen,printHeader,nl,
    write('    ---> Please enter the result number colors: <---'),
    askNumberColors(ResultNumberColors),nl,clearScreen,printHeader,nl,
    Puzzle = [FirstNumberColors,SecondtNumberColors,ResultNumberColors].

% pede ao jogador um número, em que os dígitos desse número são caracteres que representam cores;
% primeiro é pedido o número de dígitos do número
askNumberColors(NumberColors):-
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
            var(Color),
            append(NumberColors,[Color],NumberColors1),
            askNumberColors(NC,NumberColors1,Len1),!
        );
        nl,nl,write('Please enter an uppercase string'),nl,nl,fail
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

solve_crypto(Puzzle,Vars):-
    nth0(0,Puzzle,FirstNumberColors),
    nth0(1,Puzzle,SecondtNumberColors),
    nth0(2,Puzzle,ResultNumberColors),
    nth0(0,FirstNumberColors,R),
    nth0(0,SecondtNumberColors,G),
    nth0(0,ResultNumberColors,B),
    Vars = [R,G,B],
    domain(Vars,0,9),
    all_distinct(Vars),
    R * (G*10 + R) #= B*10 + G,
    labeling([],Vars).

displaySolution(Vars):-
    nth0(0,Vars,R),
    nth0(1,Vars,G),
    nth0(2,Vars,B),
    write(R),write(' X '),write(G),write(R),
    write(' = '),write(B),write(G).
    