-module(simple_concurrency).
-export([long_function/1,start_long_once/1,
	start_long_counted/2]).

long_function(Duration) ->
	timer:sleep(1000 * Duration),
	io:format("Done~n").

start_long_once(Duration) ->
	spawn(fun() -> long_function(Duration) end).

start_long_counted(Count, Duration) ->
	[start_long_once(Duration) || _ <- lists:seq(1,Count)].