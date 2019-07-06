/**
 * Import the necessary packages
 * DON'T forget to add the dependencies to pubscpec.yaml:
 * 
 * pubspec.yaml:
 *   dependencies:
 *    http: ^0.12.0+2
 */

import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await
import 'dart:io'; // for http headers

// This method creates a post in JSON Placeholder (https://jsonplaceholder.typicode.com/posts)
// The return type of the function needs to be Future<return Type>, in this case it is Future<String> because it returns a String
// The future is for async processes and dynamic accepts all types
// If you know what data type is returned, you can use that 
// The function also needs to be async
Future<String> createPost() async {

  String url = "https://jsonplaceholder.typicode.com";

  // return type is http.Response
  // for examples with headers, check api_post
  http.Response response = await http.post(
    url + "/posts",
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    },
    body: json.encode({
      "title": 'foo',
      "body": 'bar',
      "userId": 1
    })
  );

  return response.body;
}