#!/bin/sh

for i in {1..1000}
do
	echo "Post: $i"
	
	curl -d @context_logs_large.json -XPOST -H "content-type: application/json" http://localhost:8888/
done
