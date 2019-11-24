# Electric Scooters

[![Codemagic build status](https://api.codemagic.io/apps/5d9c76247a0a95001b9f45ca/5d9c76247a0a95001b9f45c9/status_badge.svg)](https://codemagic.io/apps/5d9c76247a0a95001b9f45ca/5d9c76247a0a95001b9f45c9/latest_build)

An application for displaying electric kick-scooters positions.


## Getting Started

Get an API key at [Google Maps](https://cloud.google.com/maps-platform).

### Android

In the `/android/app/src/main/res/values` directory create `secrets.xml` file containing your Google Maps API key:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_maps_api_key" translatable="false">YOUR_MAP_API_KEY</string>
</resources>
```

### IOS

In the `/ios/Runner` directory create `Secrets.plist` file containing your Google Maps API key:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>GoogleMapsApiKey</key>
	<string>YOUR_MAP_API_KEY</string>
</dict>
</plist>
```

## Screenshots
![Map](/screenshots/map.png "Map")


## Built with
* [Flutter](https://github.com/flutter/flutter) - Flutter makes it easy and fast to build beautiful mobile apps.
* [Flutter BLoC](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) - A predictable state management library that helps implement the BLoC design pattern 
* [Equatable](https://github.com/felangel/equatable) - An abstract class that helps to implement equality without needing to explicitly override == and hashCode.
* [Http](https://github.com/dart-lang/http) - A composable, cross-platform, Future-based API for making HTTP requests.
* [Intl](https://github.com/dart-lang/intl) - Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.
* [Google Maps Flutter](https://github.com/flutter/plugins) - A Flutter plugin for integrating Google Maps in iOS and Android applications.
* [Json Serializable](https://github.com/dart-lang/json_serializable) - Generates utilities to aid in serializing to/from JSON.
* [Kiwi](https://github.com/letsar/kiwi) - A simple compile-time dependency injection library for Dart and Flutter.


## Authors

* [Karol Lisiewicz](https://www.linkedin.com/in/karol-lisiewicz/)
