queens(N, Sol):-
    genRowList(N,Rows),
    nQns(Rows, [], Sol).

genRowList(N, Rows):-
	findall(Num, between(1, N, Num), Rows). 
    

nQns([], Sol, Sol).
/* we select a row to place the queen and check whether the current position is valid */
nQns(Rows, Board, Sol):-
    select(R, Rows, RemRows),
    safe(R, Board),
    nQns(RemRows, [R|Board], Sol).
    

safe(R, Board) :- 
    safe(R, Board, 1).
     
safe(_,[],_). 

/* We check if the row difference is not same for 2 queens 
 * if that is so they are on the same diagonal */ 

safe(R, [H|B], N):-
    D is abs(R-H),
    D \= N,
    N1 is N+1,
    safe(R, B, N1).