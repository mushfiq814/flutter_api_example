# Flutter API Example File

This is an example file to remind me how to use APIs with flutter and dart.

All code is located in `/lib`

# Notes

## Structure
* `main.dart` has the main layout page
* `/lib/utils/class_post.dart` contains the Post class
* `/lib/utils/api_get.dart` contains the get method sample to get 100 posts from [JSON Placeholder](https://jsonplaceholder.typicode.com/posts)
* `/lib/utils/api_post.dart` contains the post method sample to create a post in [JSON Placeholder](https://jsonplaceholder.typicode.com/posts)


## Points of Interest

* Decoding JSON response
```dart
// use dart:convert to decode JSON
dynamic decodedJson = json.decode(responseBody);
```

* Converting http response array: 
```dart
// use this when the response contains an array
List resList = (decodedJson as List)
  // map each element of the array/list to a new Post object as defined in class_post.dart
  .map((item) => new Post.getfromJson(item))
  // convert the json to a list
  .toList();
```

## Packages Used

[HTTP](https://pub.dev/packages/http), [Convert](https://api.dartlang.org/stable/2.4.0/dart-convert/dart-convert-library.html), [Async](https://api.dartlang.org/stable/2.4.0/dart-async/dart-async-library.html), [IO](https://api.dartlang.org/stable/2.4.0/dart-io/dart-io-library.html)

```dart
import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await
import 'dart:io'; // for http headers
```

Note: For external packages like http, the package name needs to be added to `pubspec.yaml` in the `dependencies` or `dev_dependencies` section:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  
  http: ^0.12.0+2
```
