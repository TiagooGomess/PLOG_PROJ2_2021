:-use_module(library(clpfd)).

crypto:-
    Vars = [R,G,B],
    domain(Vars,0,9),
    all_distinct(Vars),
    R * (G*10 + R) #= B*10 + G,
    R #< G, R #< B, G #< B,
    labeling([],Vars),
    write(Vars).