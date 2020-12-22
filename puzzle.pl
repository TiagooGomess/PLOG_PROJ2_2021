:-use_module(library(clpfd)).

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