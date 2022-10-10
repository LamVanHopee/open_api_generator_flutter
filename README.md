# open_api_generator_flutter

A new Flutter project.

## Folder structure
> api  -> Directory created by openapi generator

> lib

> ...

> petstore.yaml -> API config file (used by both client and server side)

> openapi-generator-cli.jar -> OpenAPI generator SDK

> ...


## How to generator code
```bash
java -jar openapi-generator-cli.jar generate -i petstore.yaml -g dart-dio -o api
cd api
flutter pub get
flutter pub run build_runner build
```
