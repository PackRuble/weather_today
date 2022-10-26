
## Building app for test
```shell
flutter build apk --target-platform=android-arm64 --split-per-abi
```

## Localization
```shell
flutter pub run slang:watch
```
```shell
flutter pub run slang:build
```

## Build files
```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

## Icons Launcher
```shell
flutter pub run icons_launcher:create
```