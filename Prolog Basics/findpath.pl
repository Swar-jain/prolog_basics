
/* the given graph is depicted below */
edge(a,b,1). 
edge(b,e,1). 
edge(e,d,1). 
edge(d,c,1). 
edge(a,c,6). 
edge(c,b,4). 
edge(b,d,3). 

/* ue helps to handle the other direction not depicted by the above graph, 
 * as the above is a weighted undirected graph */ 
ue(X,Y, W):-
    edge(X,Y, W);
    edge(Y,X, W).

/* This is a call to the findpath function which passes the given input and adds 
 * an additional visited vertices parameter */ 
findpath(Q, W, E, R) :-
    findpath(Q, W, E, R, []).

findpath(X, Y, W, [X,Y], _) :- 
    ue(X, Y, W).

/* above checks whether there is a path between X and Y, if so it is returned as a direct path*/


findpath(X, Y, W, [X|P], V) :- 
    atom(X), atom(Y),
    X\==Y,
    \+ member(X,V), % checks if X is not already visited
	 ue(X, Z, W1), % checks if there is an edge between some intermediate node Z
        \+ member(Z,V), % checks if the intermediate node is visited already 
     findpath(Z, Y, W2, P, [X|V]), % Recursively, checks and adds vertices to path until destination is reached.
     W is W1 + W2. % Weight of the path is updated each time an edge is added to the path. 