FROM amberframework/amber:v0.11.2

WORKDIR /app

COPY shard.* /app/
RUN shards install 

COPY . /app

CMD crystal src/backend.cr
