
## Building app for test
```shell
flutter build apk
```

## Localization
https://pub.dev/packages/slang#tools
```shell
puro dart run slang build
```

```shell
puro dart run slang watch
```

```shell
puro dart run slang analyze
```

```shell
puro dart run slang apply
```

```shell
puro dart run slang normalize
```

There is a command to quickly get the number of words, characters, etc.
```shell
puro dart run slang stats
```

## Build files
```shell
puro dart run slang build_runner build --delete-conflicting-outputs
```

```shell
puro dart run build_runner build `
                                --delete-conflicting-outputs
```

## Generate Icons Launcher
helping: https://pub.dev/packages/icons_launcher

dev icons:
```shell
flutter clean &&
flutter pub get &&
puro dart run icons_launcher:create --flavor dev
 
```
