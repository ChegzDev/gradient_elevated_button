## 2.0.0

- **Breaking:** Migrated from the deprecated `package:flutter/material.dart` to the standalone [`material_ui`](https://pub.dev/packages/material_ui) package.
- Minimum SDK raised to Flutter 3.47.0 / Dart 3.13.0. Apps still on `package:flutter/material.dart` should migrate with `dart fix --apply --code=migrate_design_widgets` or wrap with `MaterialUiCompatibilityBridge` (see README).
- Fixed static analysis issues (unnecessary `this.` qualifier, formatting).
- Example app migrated to `material_ui`; replaced stale example widget test.

## 1.2.0

- Deprecated `GradientButtonThemeData`. Use `GradientButtonThemeExtension` (ThemeExtension) in ThemeData.extensions instead.
- Added migration guide and updated documentation/examples to use ThemeExtension approach.
- Maintained backward compatibility for one major release.


## 1.1.0

- Updated for latest Flutter compatibility.


## 1.0.10

* copyWith Error fixed for latest flutter version

## 1.0.8

* Updated the code to support the latest Flutter version.
* Fixed the issue where the disabled button was not functioning correctly.
* Added a disabled gradient option for the disabled button state.
* Added a default gradient for the disabled button state.
* Resolved the issue where the shadow was not appearing.


## 1.0.4

* Remove Deprecated Codes

## 1.0.0

* Upgrade to latest Flutter version

## 0.0.8

* Added GradientButtonThemeData

## 0.0.7

* Update to latest version

## 0.0.6

* Update to latest version

## 0.0.5

* When Button Click Splash issue solved

## 0.0.4

* Customise Button From Theme
* Bug Fixes

## 0.0.3

* Bug Fixes

## 0.0.2

* No Change

## 0.0.1

* Initial Release
