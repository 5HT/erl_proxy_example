%% @private
-module(api_cowboy_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", example_h, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, [{port, 8090}], #{
		env => #{dispatch => Dispatch}, 
		request_timeout => 60000
	}),
	api_cowboy_sup:start_link(),
	proxy_server:start_link().

stop(_State) ->
	ok.
