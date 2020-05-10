edge(1,3).
edge(1,4).
edge(1,6).
edge(2,3).
edge(2,5).
edge(3,4).
edge(3,5).
edge(3,6).
edge(4,5).
edge(4,6).

vs([1,2,3,4,5,6]).


c(green).
c(red).
c(blue).
c(yellow).

ue(X,Y):-
    edge(X,Y);
    edge(Y,X).

color_map(Sol):- vs(L), map(L, [], Sol).


/* if there is no region then there is no assignment */
map([], Sol, Sol).
/* here we choose a vertex since we have represented our region as a graph */
map([V|Vs], Board, Sol):- c(C), safe([V,C], Board), map(Vs, [[V,C]|Board], Sol).

  /* we check if there is no colour conflict with adjacent vertices in these safe predicates */   
safe(_,[]).
safe([V,C], [[V1,C1]|T] ) :- ue(V,V1), C \= C1, safe([V, C], T). 
/* in the above we first check if an adjacent region exists, if it does then the colour of these adjacent regions are checked if they are the same */


safe([V,C], [[V1,_]|T] ) :- not(ue(V,V1)), safe([V, C], T).

/* the above handles the same for the non existence of a particular region in the adjacency of the considered region */ 
