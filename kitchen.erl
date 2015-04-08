-module(kitchen).
-export([start/0, store/2, fetch/2, fridge/1]).

start() ->
	[spawn(?MODULE, fridge, [[]])].

store(Fridge, Item) ->
	Fridge ! {self(), {store, Item}},
	receive
		{Fridge, Msg} -> Msg
	end.

fetch(Fridge, Item) ->
	Fridge ! {self(), {fetch, Item}},
	receive
		{Fridge, Msg} -> Msg
	end.

store(Sender, Item, Contents) ->
	Sender ! {self(), {stored, Item}},
	fridge([Item|Contents]).

fetch(Sender, Item, Contents) ->
	case lists:member(Item, Contents) of
		true -> 
			Sender ! {self(), {ok, Item}},
			fridge(lists:delete(Item, Contents));
		false ->
			Sender ! {self(), {not_found, Item}},
			fridge(Contents)
	end.

fridge(Contents) ->
	receive
		{From, {store, Item}} ->
			store(From, Item, Contents);
		{From, {fetch, Item}} ->
			fetch(From, Item, Contents)
	end.