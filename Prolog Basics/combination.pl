combination(0,_,[]).
combination(N, [H|T], [H|R]):-
    N>0,
    N1 is N-1,
    combination(N1, T, R).
combination(N, [_|T], R):-
    N>0,
    combination(N,T,R).