is_prime(2).
is_prime(3).
is_prime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ factor(P,3).  

factor(Num,L) :- Num mod L =:= 0.
factor(Num,L) :- L * L < Num, L2 is L + 2, factor(Num,L2).

goldbach(4,[2,2]).
goldbach(Num,L) :-
  Num mod 2 =:= 0, /* checks whether N mod 2 is true */ 
  Num > 4,
  goldbach(Num,L,3).

/* checks if the given number minus the found prime number is also a prime number*/
goldbach(Num,[P,T],P) :-
  T is Num - P,
  is_prime(T), 
  P < T.


/* checks for a prime number less than the given number */
goldbach(Num,L,P) :-
  P < Num,
  next(P,R),
  goldbach(Num,L,R).


next(P,R) :- R is P + 2, is_prime(R).
next(P,R) :- S is P + 2, next(S,R).