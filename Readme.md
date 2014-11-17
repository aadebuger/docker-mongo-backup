Usage

```shell
docker run \
  --rm \
  -it \
  --link $YOUR_MONGO_CONTAINER:mongo \
  --volume ~/dump:/dump \
  lzrski/mongo-dump
```

Best served with chilled Cron.
