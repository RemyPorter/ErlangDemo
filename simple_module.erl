-module(simple_module).
-export([add/2, pattern/2, f/1, aand/2]).
add(A,B) -> A + B.

pattern(atom,A) -> A * A;
pattern(other,A) -> A + A.

f(X) when X > 2 -> X + f(X/2);
f(_) -> 0.

%% and(X,Y) -> x and y.
aand(false, _) -> false;
aand(_, false) -> false;
aand(true, true) -> true.