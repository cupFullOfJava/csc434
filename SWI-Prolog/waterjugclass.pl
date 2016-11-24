% By: Jeremy Timothy Brown
% [a,b] - Represents a problem state with 'a' gallons in the 4-gallon
% jug and 'b' gallons in the 3-gallon jug
% move (presentstate, move, nextstate)


% 1. Rule corresponding to the move 'Fill 4-gallon jug from faucet'
move([X,Y], 'Fill 4-gallon jug from faucet', [4,Y]) :-
	X < 4.

%2. Rule corresponding to the move 'Fill 3-gallon jug from faucet'
move([X,Y], 'Fill 3-gallon jug from faucet', [X,3]) :-
	Y < 3.

%3. Rule corresponding to the move 'Empty 4-gallon jug onto the ground'
move([X,Y], 'Empty 4-gallon jug onto the ground', [0,Y]) :-
	X > 0.

%4. Rule corresponding to the move 'Empty 3-gallon jug onto the ground'
move([X,Y], 'Empty 3-gallon jug onto the ground', [X,0]) :-
	Y > 0.

%5. Rule corresponding to the move 'Fill 4-gallon jug from 3-gallon jug'
move([X,Y], 'Fill 4-gallon jug from 3-gallon jug', [4, NEWY]) :-
	NEED is 4-X,
	NEWY is Y-NEED,
	X+Y >= 4,
	Y > 0.

%6. Rule corresponding to the move 'Fill 3-gallon jug from 4-gallon jug'
move([X,Y], 'Fill 3-gallon jug from 4-gallon jug', [NEWX,3]) :-
	NEED is 3-Y,
	NEWX is X-NEED,
	X+Y >= 3,
	X > 0.

%7. Rule corresponding to the move 'Empty 3-gallon jug into 4-gallon jug'
move([X,Y], 'Empty 3-gallon jug into 4-gallon jug', [XANDY,0]) :-
	XANDY is X+Y,
	XANDY =< 4.

%
%8. Rule corresponding to the move 'Empty 4-gallon jug into 3-gallon jug'
move([X,Y], 'Empty 4-gallon jug into 3-gallon jug', [0,XANDY]) :-
	XANDY is X+Y,
	XANDY =< 3.


%%solution predicates
% To solve the problem try this: length(X, Y), Y < 10, solution([0,0],X).


% [2,0] is the goal state. No move required if you are in this state
solution([2,0], []).


%The list of moves [Move|Rest] constitutes a solution from PresentState
%if Move takes you from PresentState to NextState
%and Rest represents a sequence of moves that will take
%you from NextState to the goal state.
solution(PresentState, [Move|Rest]) :-
	move(PresentState, Move, NextState),
	solution(NextState, Rest).





















