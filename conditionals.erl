-module(conditionals).
-export([ifs/1, cases/1]).

ifs(X) ->
	if X > 10 -> big_x;
		X > 5 -> regular_x;
		true -> tiny_x %% the else
	end.

cases(X) ->
	case X of
		X when X rem 2 =:= 0 -> even;
		X when X rem 2 =/= 0 -> odd
	end.