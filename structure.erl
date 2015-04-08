-module(structure).
-record(shelf, {aisle,rank,books=[]}).
-export([build_shelf/2, add_book/2, get_props/0, 
	get_name/1, comprehension/1]).
-import(proplists, [get_value/2]).

build_shelf(Aisle, Rank) ->
	#shelf{aisle=Aisle, rank=Rank}.

add_book(#shelf{aisle=Aisle, rank=Rank, books=Books}, 
	Book) ->
	#shelf{aisle=Aisle, rank=Rank, books=[Book|Books]}.

get_props() -> [{name,"Joebob"}, {address,"123 Street Rd."}].

get_name(Props) ->
	proplists:get_value(name, Props).

comprehension(N) ->
	[{X, X * Y} || X <- lists:seq(1,N), Y <- lists:seq(1,N)].