-module(patterns).
-export([head/1, tail/1, tupled/1, distance/2,
	fac/1, reverse/1, len/1]).
-import(math, [sqrt/1, pow/2]).
head(L) ->
	[H|_] = L,
	H.

tail(L) ->
	[_|Tail] = L,
	Tail.

tupled({point, X,Y}) ->
	X + Y.

distance({point, X1,Y1}, {point, X2, Y2}) ->
	sqrt(pow(X1 - X2, 2) + pow(Y1 - Y2, 2)).

len([]) -> 0;
len([_]) -> 1;
len([_|T]) -> 1 + len(T).

fac(N) -> fac(N, 1).

fac(0, Acc) -> Acc;
fac(N, Acc) when N > 0 -> fac(N-1, N*Acc).

reverse(L) ->
	reverse(L, []).

reverse([], Acc) -> Acc;
reverse([H|T], Acc) -> reverse(T, [H|Acc]).