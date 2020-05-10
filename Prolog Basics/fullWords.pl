/* below represents the word form of the numbers */
word(0) :- write('zero').
word(1) :- write('one').
word(2) :- write('two').
word(3) :- write('three').
word(4) :- write('four').
word(5) :- write('five').
word(6) :- write('six').
word(7) :- write('seven').
word(8) :- write('eight').
word(9) :- write('nine').
 

full_words(Nums) :-       
    N is Nums // 10,  % printing the first digit
    num_words(N), % so that we can handle cases where number is zero
    N1 is Nums mod 10, 
    word(N1).
 
num_words(0).       
 
num_words(Nums) :-  
    Nums > 0,            
    N1 is Nums // 10,  
    num_words(N1),
    N2 is Nums mod 10,
    word(N2),
    write('-').
