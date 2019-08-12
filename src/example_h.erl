-module(example_h).

-export([init/2]).

init(Req0, Opts) ->
	{StatusCode, _RespHeaders, Body} = gen_server:call(proxy_server, <<"http://localhost/">>),
	Req = cowboy_req:reply(StatusCode, #{
		<<"content-type">> => <<"text/html">>
	}, Body, Req0),
	{ok, Req, Opts}.
