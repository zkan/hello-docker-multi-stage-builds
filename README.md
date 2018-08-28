# Hello, Docker Multi-Stage Builds

## Stopping at a Specific Build Stage

Stop at the stage named `base`:
```sh
docker build --target base -t multistage:base .
```

Stop at the stage named `dev`:
```sh
docker build --target dev -t multistage:dev .
```

Stop at the stage named `test`:
```sh
docker build --target test -t multistage:test .
```
