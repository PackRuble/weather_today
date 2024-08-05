
## Building app for test
```shell
flutter build apk --target-platform=android-arm64 --split-per-abi
```

## Localization
https://pub.dev/packages/slang#tools
```shell
puro dart pub run slang build
```
```shell
flutter pub run slang watch
```
```shell
flutter pub run slang build
```
```shell
flutter pub run slang analyze
```
```shell
flutter pub run slang apply
```
There is a command to quickly get the number of words, characters, etc.
```shell
flutter pub run slang stats
```

## Build files
```shell
flutter pub run build_runner build --delete-conflicting-outputs
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
