oddSize([_]).
oddSize(X) :-
	append(X, [], [_,_|Z]),
	oddSize(Z).

evenSize([]).
evenSize(X) :-
	append(X,[], [_,_|Z]),
	evenSize(Z).

isPrefix([],_).
isPrefix([Head|Tail], [Head|NewTail]) :-
	isPrefix(Tail, NewTail).

isMember(Head, [Head|_]).
isMember(Head, [_|Tail]) :-
	isMember(Head, Tail).

remove(X, [X|Y], Y).
remove(X, [Z|Y1], [Z|Y2]) :-
	remove(X,Y1,Y2).

isUnion([],[],[]).
isUnion([A|X], Y, [A|Z]) :-
	isUnion(X,Y,Z).
isUnion([],[B|Y],[B|Z]) :-
	isUnion([],Y,Z).

isEqual([],_).
isEqual([X1|X], Y) :-
	isMember(X1, Y),
	isEqual(X, Y).

between(_,_,[]).
between(N1, N2, [C|X]) :-
	R is N1+1,
	C = R,
	R < N2,
	between(R, N2, X).







