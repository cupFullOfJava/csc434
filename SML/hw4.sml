(* By: Jeremy Timothy Brown *)
(* CSC 434 - UNCW 2016 *)

(* #1 - pow *)
(* This function takes in two integers.  The integer a is the base and the integer b is the power.
The function checks to see if b is equal to zero.  Anything raised to the power of zero is one, so the
function returns zero.  Else the function recursively multiplies a times b, subtracting one from b every*
recursion. *)
(* Assumption, b is never negative.  Also 0 to the 0 is not one but we'll let this slide for now ;) *)
(* val pow = fn : int*int -> int *)
fun pow (a, b) = if b = 0 then 1 else a*pow(a,b-1);


(* #2 - sumTo *)
(* This function takes an integer n and then computes the sum of the first n reciprocals *)
(* If n if equal to zero, returns 0.0 else it begins the computation.  It casts n to a real
then divides it into 1.0 to get the last reciprocal.  It then recursively does this by subtracting
one from n and adding the recipricaols each recursion until n becomes 0 *)
(* n cannot be negative *)
(* val sumTo = fn : int -> real *)
fun sumTo n = if n = 0 then 0.0 else 1.0/real(n) + sumTo(n-1);
               
               
(* #3 - repeat *)
(* This function takes a string and and integer.  It prints out the string based in the integer given.*)
(* If n is zero this function returns a blank string.  Otherwise it prints the string once,
concatenates it to the recursive function that subtracts one from n each time. *)
(* n cannot be negative *)
(* val repeat = fn: string*int -> string *)
fun repeat (s, n) = if n = 0 then "" else s ^ repeat(s,n-1);


(* #4 - binary *)

(* This function takes an integer and converts it to binary, returns an int list *)
(* If x is greater then zero, recusively divide x by two while appending the remainder to a list. *)
(* val intToBin = fn : int -> int list *)
fun intToBin x = if x > 0 then intToBin(x div 2)@[(x mod 2)] else [];

(* This function takes a list of zeros and/or ones and converts them to a char list. *)
(* This function contains two different function bodies. *)
(* First: Deals with the case of an empty list *)
(* Second: If x is one append #"1" to the list and recusively send the tail back.
Else append the char #"0" to the list and recusively send the tail back *)
(* val binToChar = fn : int list -> char list *)
fun binToChar nil = nil | binToChar (x::xs) = if x = 1 then #"1"::binToChar(xs) else #"0"::binToChar(xs);

(* This function takes an integer and returns the binary representation as a string. *)
(* If x is zero, return an empty string. Else send number to be converted, join a 0 to the start
of the returned char list, and implode. *)
(* val binary = fn: int -> string *)
fun binary x = if x = 0 then "" else implode (#"0"::binToChar(intToBin(x)));


(* #5 - countNegative *)
(* This function takes in a list of positive and negative integers.  It returns the amount of negative numbers
that appears in the list *)
(* If the list is empty, returns 0.  This then checks to see if the head of x is positive.  If it is it passes
passes the tail back recursively.  Else it adds one to the count and then passes the tail back recursively *)
(* val countNegative = fn : int list -> int *)
fun countNegative x = if x = [] then 0 else if hd x >= 0 then countNegative(tl (x)) else 1 + countNegative(tl x);


(* #6 - absList *)
(* This function takes in a positive or negative intger and then outputs the is in absolute value form. *)
(* If x is less then 0, apply a negative to x and return.  Two negatives equal a positive.  Else return x. *)
(* val abs = fn : int -> int *)
fun abs x = if x < 0 then ~x else x;

(* This function takes in a tuple list of positive and negative integers.  It returns all of the integers in 
in absolute value form. Use the abs fun described above. *)
(* If the list in empty returns nil. Else append a tuple that computes the absolue value of the two integers 
found in the head of the original list.  Then reursively send the tail of the list until it is empty. *)
(* val absList = fn : (int * int) list -> (int * int) list *)
fun absList (x : (int * int) list) = if null x then nil else (abs(#1(hd (x))), abs(#2(hd (x))))::absList(tl x);


(* #7 - split *)
(* This function takes in an integer and splits it into a tuple that contains the pair of integers that
equals the input *)
(* If x mod 2 is equal to 1, which tells us that the number is odd, return a tuple of x div 2
and x div 2 plus 1.  Else do the same this without adding one to the second integer in the tuple. *)
(* Assumption: x >= 0 *)
(* val intToTupleSumPair = fn : int -> int * int *)
fun intToTupleSumPair x = if x mod 2 = 1 then (x div 2, (x div 2) + 1) else (x div 2, x div 2);

(* This function takes in an intger and sends it to the function defined above then apends it to a list *)
(* If the list is empty return nil, else send the head of x to the function above and append it to a list
while recursively passing the tail of x until it is empty. *)
(* Assumption: All values in x >= 0 *)
(*val split = fn : int list -> (int * int) list *)
fun split x = if null x then nil else intToTupleSumPair(hd x)::split(tl x);


(* #8 - isSorted *)
(* This function computes the length of any list. *)
(* If the list is empty return 0.  Else add one to the counter and 
recursively pass the tail of x until it is empty. *)
(*val listlength = fn : 'a list -> int *)
fun listlength x = if null x then 0 else 1 + listlength(tl x);

(* This function takes in an integer list and then decides if the list is sorted in non decreasing order. *)
(* If the list is empty return true.  Else if the length of the list is equal to one return true.  
Else if the head of x is greater then the second element in x return false.
Else if the head of x is less then the second element in x return true and recursively send the tail of x back.  Else return false. *)
(* val isSorted = fn : int list -> bool *)
fun isSorted x = if null x then true else if listlength(x)=1 then true else if hd x > hd(tl x) then false else if hd x <= hd(tl x) then (true; isSorted(tl x)) else false;

 
(* #9 - collapse *)
(* This function takes in a list of integers and returns a list of collapsed successive pairs that is the sum of each the pair. *)
(* This function contains two different function bodies. *)
(* First: This takes care of lists with length one.  If the tail is nil, return [x]*)
(* Second: This deals with everything else.
If the tail is greater then two, meaning the list > 5, it ads the first and second item and then recursively sends the tail back
Else if, the tail is equal to 2, meaning the list is equal to four, it adds the first two items and appends it to a list of the sum of the last two items
Else if, the tail is equal to 1, meaning the list is equal to three, it adds the first two items and appends it to the tail 
Else, the list is contains only two integers, it adds the two together and appends to a list  *)
(* val collapse = fn : int list -> int list *) 
fun collapse (x::nil) = [x] | collapse (x::y::zt) = if listlength(zt) > 2 then (x+y)::collapse(zt) else if listlength(zt) = 2 then (x+y)::[((hd zt)+(hd(tl zt)))] else if listlength(zt) = 1 then (x+y)::zt else [x+y]; 


(* #10 - insert *)
(* This function inserts a number into a sorted list at the correct position and then returns that list *)
(* This function contains two different function bodies *)
(* First: if the list is empty, return a in a list *)
(* Second: This gets an a value to be placed into the list, a b which is the head of the list, and bs which is the tail of the list. 
b::bs is still a list but it allows for the use of two values.
If the head is less then the tail.  Append a then b to the list.  Else append b to the front of the list
and then recursively pass the value and the tail back in until a can be appended. *)
(* val insert = fn : int * int list -> int list *)        
fun insert(a, nil) = [a] | insert(a,b::bs) = if a<b then a::b::bs else b::insert(a,bs);
