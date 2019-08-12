-module(proxy_server).
-behaviour(gen_server).
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, make_req/2]).

make_hackney_request(Url) -> 
    Method = get,
    Headers = [],
    Payload = <<>>,
    Options = [],
    {ok, StatusCode, RespHeaders, ClientRef} = hackney:request(Method, Url,
                                                            Headers, Payload,
                                                            Options),
    {ok, Body} = hackney:body(ClientRef),
    {ok, StatusCode, RespHeaders, Body}.

make_req(From, Url) ->
    From ! make_hackney_request(Url).

start_link() ->
    Return = gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
    io:format("start_link: ~p~n", [Return]),
    Return.

init([]) ->
    State = [],
    Return = {ok, State},
    io:format("init: ~p~n", [State]),
    Return.

handle_call(Url, _From, State) ->
    spawn(?MODULE, make_req, [self(), Url]),
    receive
        {ok, StatusCode, RespHeaders, Body} -> {reply, {StatusCode, RespHeaders, Body}, State}
    end.

handle_cast(_Msg, State) ->
    Return = {noreply, State},
    io:format("handle_cast: ~p~n", [Return]),
    Return.

handle_info(_Info, State) ->
    Return = {noreply, State},
    io:format("handle_info: ~p~n", [Return]),
    Return.

terminate(_Reason, _State) ->
    Return = ok,
    io:format("terminate: ~p~n", [Return]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    Return = {ok, State},
    io:format("code_change: ~p~n", [Return]),
    Return.
