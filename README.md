<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This was originally built by [Bolaji Ayodeji](https://github.com/BolajiAyodeji) so all rights goes to him, I only interpreted the **javascript** code to **Dart**


## Getting started

Add the dependency to your pubspec.yaml
```yaml
dependencies:
    nettyfinder: <latest-version>

```

## Usage
```dart
// Import the package
import 'package:nettyfinder/nettyfinder.dart';  
```



```dart
void main() {

    // This is a callable class
    // Just instantiate the class with the number
  var netFinder = NetworkTypeDetect("+2347012345678");

  // Return null if number is valid but not recognized else throw a descriptive exception
  print('Network Type: ${netFinder() ?? 'Not a recognized number'}');
}
```

## Contribution
Contributions are welcome.




