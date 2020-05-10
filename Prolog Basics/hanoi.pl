/* the below will output the result in the required format */
hanoi(1,From,To,_) :-  
    write('Move '), 
    write(From), 
    write(' to '), 
    write(To), 
    nl. 
/* the below will recursively solve the problem */
hanoi(N,From,To,Aux) :- 
    N>1, 
    N1 is N-1, 
    hanoi(N1,From,Aux,To), /* Shift 'n-1' disks from 'A' to 'B'. */
    hanoi(1,From,To,_), /* Shifts last disk to the destination */
    hanoi(N1,Aux,To,From). /* Shifts 'n-1' disks from 'B' to 'C' */
