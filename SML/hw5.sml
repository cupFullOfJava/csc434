(* SML comments appear like this *)
(* Your name appears here *)

(* #1 - quicksort *)
(* val partition = fn : int * int list -> int list * int list *)
(* This function uses the quicksort method to sort a list of integers *)
(* This function contains two function bodies *)
(* First: If the list is empty, return two empty lists *)
(* Second: Send the pivot and the tail back recursively.  Assign those to a and b
if x is less than the pivot, put it into the first list, else put it in the second *)
fun partition (pivot, []) = ([],[])
| partition (pivot, x::xs) = 
let
	val (a,b) = partition (pivot, xs)
in 
	if x < pivot then (x::a, b)
	else (a, x::b)
end;


(* val quicksort = fn : int list -> int list *)
(* This function uses the quicksort method to sort a list of integers *)
(* This function contains two function bodies *)
(* First: If the list is empty, return an empty list *)
(* Second: Send the pivot and the list to the partition function and assign that
to values a and b.  List a are the values smaller than the pivot and list b are the values
larger than the pivot.  After that recusively send a back, concate it with the pivot appended
to list b after sending it recusively back*)
fun quicksort [] = []
| quicksort (pivot::xs) = 
let
	val (a,b) = partition (pivot, xs)
in 
	(quicksort a) @ (pivot::(quicksort b))
end;

(* #2 - member *)
(* val member = fn : ''a * ''a list -> bool *)
(* This function takes a value and list.  It then determines if it is in the list *)
(* This function contains three different function bodies. *)
(* First: if the list is empty, return false *)
(* Second: if there is only one item in the list, return false unless it is the 
same as a*)
(* Third: Iterate through the list.  If a equals x, return true *)
fun member (a, nil) = false
| member (a, x::nil) = 
	false orelse a = x
| member (a, x::xs) = 
	member(a, xs) orelse a=x;
               
               
(* #3 - returns the union of sets (lists) s1 and s2*)
(* val union = fn : ''a list * ''a list -> ''a list *)
(* This function takes two lists and returns the union of the two *)
(* This function contains two function bodies *)
(* First:  If the first list is empty, return y*)
(* Second: Check to see if the first element in x is in y using the member function
if it is send x and y back recusively.  If it is not a member, append it to the list and
recusively send x and y back *)
fun union([],y) = y
|union(a::x,y) =
if member(a,y) then union(x,y)
else a::union(x,y);


(* #4 - returns the intersection of sets (lists) s1 and s2 *)
(* val intersection = fn : ''a list * ''a list -> ''a list *)
(* This function takes two lists and returns the intersection of the two *)
(* This function contains two function bodies *)
(* First:  If the first list is empty, return an empty list*)
(* Second: Check to see if the first element in x is in y using the member function
if it is append it to the list and send x and y back recusively.  If it is not a member,
recusively send x and y back *)
fun intersection([],y) = []
|intersection(a::x,y) =
if member(a,y) then a::intersection(x,y)
else intersection(x,y);