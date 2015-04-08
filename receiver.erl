-module(receiver).
-export([machine/0, start/0, message_machine/0,
	start/1]).

machine() ->
	receive
		make_widget -> io:format("Widget made.~n"), machine();
		spin_wheel -> io:format("WHEEEEEEEE~n"), machine();
		_ -> io:format("Don't know how to do that. Shutting down.~n")
	end.

start() ->
	spawn(receiver, machine, []).

message_machine() ->
	receive
		{From, make_widget} -> 
			From ! {self(), widget}, message_machine();
		{From, spin_wheel} ->
			From ! {self(), round_and_round}, message_machine();
		{From, _} ->
			From ! {self(), shutdown_triggered}
	end.

start(Func) ->
	spawn(?MODULE, Func, []).