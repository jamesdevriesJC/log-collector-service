# Log Collector

Simple Fluent Bit setup to receive logs by HTTP and apply the context to each entry in the log list.

To run:
```shell
docker-compose up
```

Sending data to the collector:
```shell
curl -d @context_logs.json -XPOST -H "content-type: application/json" http://localhost:8888/
```


