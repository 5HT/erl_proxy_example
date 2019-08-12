Erlang proxy example
=====

```
make run
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