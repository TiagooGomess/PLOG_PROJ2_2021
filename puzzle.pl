:-use_module(library(clpfd)).

:-ensure_loaded('utils.pl').

% pergunta ao utilizador o puzzle que quer que seja resolvido;
% Puzzle é uma lista que contém 3 listas:
% - os dois primeiros elementos são os números que queremos multiplicar,
% - o terceiro é o resultado;
% por exemplo, para o puzzle R x GR = BG, Puzzle seria [[R],[G,R],[B,G]]
askPuzzle(Puzzle):-
    nl,
    write('    ---> Please enter the first number colors: <---'),
    askNumberColors(FirstNumberColors),nl,clearScreen,printHeader,nl,
    write('    ---> Please enter the second number colors: <---'),
    askNumberColors(SecondtNumberColors),nl,clearScreen,printHeader,nl,
    write('    ---> Please enter the result number colors: <---'),
    askNumberColors(ResultNumberColors),nl,clearScreen,printHeader,nl,
    Puzzle = [FirstNumberColors,SecondtNumberColors,ResultNumberColors].

% pede ao jogador um número, em que os digitos desse número são caracteres que representam cores
askNumberColors(NumberColors):-
    repeat,
    (
        (
            nl,nl,
            write(' --> How many digits the number contains? '),
            getInt(Len),
            number(Len),
            Len > 0,
            Len =< 9,
            askNumberColors(NumberColors,[],Len)
        );
        nl,nl,write('Please enter a number between 1 and 9'),nl,nl,fail
    ).
    

askNumberColors(NumberColors,NumberColors,0).
askNumberColors(NC,NumberColors,Len):-
    Len > 0,
    Len1 is Len - 1,
    nl,nl,
    write('Please enter the color of the digit: '),
    getChar(Color),
    append(NumberColors,[Color],NumberColors1),
    askNumberColors(NC,NumberColors1,Len1).

crypto:-
    Vars = [R,G,B],
    domain(Vars,0,9),
    all_distinct(Vars),
    R * (G*10 + R) #= B*10 + G,
    
    labeling([],Vars),
    write(Vars).

crypto2:-
    Vars = [R,G,B],
    domain(Vars,0,9),
    all_distinct(Vars),
    (G*10 + B) * (G*10 + R) #= R*100 + B*10 + B,
    
    labeling([],Vars),
    write(Vars).