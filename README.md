Erlang proxy example
=====

Features
--------

* mix
* rebar3
* mad
* erlang.mk

rebar3
------

```
$ rebar3 get-deps
$ rebar3 compile
$ rebar3 release
$ _build/default/rel/erl_proxy_example/bin/erl_proxy_example console
```

mad
---

```
$ mad dep com pla bun beam erl_proxy_example
$ tar -xvf erl_proxy_example.tgz
$ chmod +x bin/start
$ bin/start
```

mix
---

```
$ mix deps.get
$ mix compile
$ mix release
$ _build/default/rel/erl_proxy_example/bin/erl_proxy_example start_iex
```

Then point your browser to http://localhost:8090

```
curl -i http://localhost:8090
```

or

```
nghttp -v http://localhost:8090
```

Bench:

```
wrk -t12 -c400 -d30s http://127.0.0.1:8090/
```