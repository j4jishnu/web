# web
A web framework focused on separation of concerns

## Docker Setup

### Build
```
docker build -t web .
```

### Run
```
docker run --rm -p 80:8080 \
--mount type=bind,source="$(pwd)"/app,destination=/root/app/,consistency=cached \
-it web
```
