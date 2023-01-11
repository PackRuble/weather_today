## Weather Today

Weather for every day.

✨ Handy application for tracking weather conditions with an amazing design.

## Table of Contents
<!-- TOC -->
  * [Weather Today](#weather-today)
  * [Table of Contents](#table-of-contents)
  * [Building an android application](#building-an-android-application)
  * [Error in the generated files](#error-in-the-generated-files)
  * [Error in the app's launcher icon](#error-in-the-apps-launcher-icon)
<!-- TOC -->

## Building an android application

1. `flutter pub get`
2. create file `.env` in root with the following content:
    ```dotenv
    API_WEATHER='YOUR_APIKEY_OPENWEATHERMAP'
    ```
3. Building apk use `flutter build apk`:
   ```shell 
   flutter build apk --target-platform=android-arm64 --split-per-abi
   ```

   with flag(optional):

   `--target-platform=android-arm,android-arm64,android-x64` - choose the right platforms

   `--split-per-abi` - build a release APK for each target ABI (Application Binary Interface)

   `--obfuscate --split-debug-info=build/app/outputs/symbols` - Once you’ve obfuscated your binary,
   save the symbols file. You need this if you later want to de-obfuscate a stack trace.

## Error in the generated files

If you have a problem with the files `*.g.dart` and others generated files try this:

`flutter pub run build_runner build`

with flag(optional):

`--delete-conflicting-outputs` - deletes previously generated files

`--build-filter=lib/PATH_FILE` - build concrete file

## Error in the app's launcher icon

```shell
flutter pub run icons_launcher:create
```
