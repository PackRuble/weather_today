## [3.3.0-pre.5] - 23-10-2023
- fix: incorrect unfocused behavior in ApiPage
- add: changelog in about dialog
- fix: eliminated the scrolling effect in markdown texts
- imp: beautiful title text and reduced padding in buttons on the stepper page
- imp: the weather will be updated when the city is updated
- add: info about api in api page
- fix: printing to the console is disabled in the release
- upd: gold sunset now theme by default

## [3.3.0-pre.4] - 03-10-2023
- imp: large migration of files and folders over "some" clean architecture
- add: reset buttons in VisualDesign and Themes pages
- upd: refactoring folders in ui
- upd: use `..Presenter` instead of `..Controller` in ui
- opt: use getters on provider instead creating new provider anyway
- opt: search widget|presenter
- upd: increase custom rules in `analysis_options.yaml`
- upd: translations
- opt: api_page widget|presenter
- fix: animation switch in visual page

## [3.3.0-pre.3+16] - 18-09-2023
- fea: slide effect when closing a page using gestures
- upd: rebuild folders (win, mac, ios, android) using flutter version 3.14.0-0.2.pre
- upd: setting build.gradle (new flavor dev_debug) and associated icons/names in the application itself
- imp: expanded content in daily page now optimized
- imp: `WrapperPage` now contains scrollPhysics and been moved in main 
- imp: new alerts design and fix sender message in ru location
- fix: default weather icon was displayed incorrectly
- upd: `MediaQuery.of` optimization
- upd: resolve hints

## [3.3.0-pre.2+11] - 12-09-2023
- feat: ability to change the location and style of weather pages
- upd: dependencies

## [3.3.0-pre.1+10] - 25-08-2023
- imp: upgrade to dart 3.1 and flutter 3.13
- upd: dependencies with code (routing, old search_bar)
- upd: kotlin_version "1.6.21" to "1.7.10"
- upd: tools.build:gradle "7.4.1" to "7.4.2"
- fix: "zone mismatch" when call `WidgetsFlutterBinding.ensureInitialized()` in another zone
- fix: bottom navigation bar
- fix: duration animation in search bar
- fix: description deleted if it is the same as the main description
- fix: duration in search bar
- add: shadow to weather image
- imp: more flexible ui

## 3.2.0+pre.8
* upd: `pubspec` dependencies
* fix: the section with logging enabled is temporarily hidden
* upd: weather icons have been replaced with the best quality
* add: 12 new color themes 
* add: more new Material Design 3 widgets 
* add: glow effect for weather icon in "Today" tab 
* fix: color of icons in appBar for light theme 
* upd: warning design 
* fix: bug that prevented using Material 3 in dark theme

## 3.0.0-pre.4

* add: terms of use of the app + widget
* upd: improve ui response and become more flexible
* add: message log pump and logger. New page for enable logger.
* add: secret debug menu
* upd: improve behavior when slide and switch between pages
* upd: about dialog now use `package_info_plus`
* upd: `pubspec` dependencies
* fix: lint rules and more small fix

## 3.0.0-pre.3

* fix: attribution label
* fix: overflow in bottom navigation bar
* fix: chip in visual page more without checkmarks

## 3.0.0-pre.2

* upd: intro page
* add: other platforms
* add: attribution owm service
* improve interface weather controller
* upd: package weather_pack
* upd: translation
* some adaptation on windows

## 3.0.0-pre.1

### Quick app building

* update packages in `pubspec.yaml`
* fix gradle version
* build app after creating local repository from github
* create a separate file `icons_launcher.yaml`

## 3.0.0-pre.0

### Major update of the project. What's new?

* update packages in `pubspec.yaml`, some major
  * riverpod 2.0
  * slang 3.0
  * weather_api
* restructure uiProvider with tear-off and instance-way
* update `analysis_option.yaml` with new lints rules
* fix Updater using `meta`
* fix some lint in code
* fix constructor `ServiceInit` class
