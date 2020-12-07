# robots_txt_processor

A robots.txt processor Dart package, converts from text to an easier to manipulate object.

## Importing library
```dart
import 'package:robots_txt_processor/robots_txt_processor.dart';
```

## Process a robots.txt string with only one user-agent
```dart
final RobotsTxt robotsTxt = processor.process('User-agent: googlebot');
print(robotsTxt.groups[0].userAgent);
```

## Process a robots.txt string with only one sitemap
```dart
final RobotsTxt robotsTxt = processor.process('Sitemap: http://example.com/sitemap.xml');
print(robotsTxt.sitemap[0]);
```

## More info
* Robots.txt specifications: https://developers.google.com/search/reference/robots_txt?hl=en
