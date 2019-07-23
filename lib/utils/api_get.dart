import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await

// the Post class
import './class_post.dart';

// This method gets 100 posts from JSON Placeholder (https://jsonplaceholder.typicode.com/posts)
// The return type of the function needs to be Future<return Type>, in this case it is Future<List<Post>> because it returns a list of Posts
// The future is for async processes and dynamic accepts all types
// If you know what data type is returned, you can use that 
// The function also needs to be async
Future<List<Post>> getPosts() async {

  String url = "https://jsonplaceholder.typicode.com";

  // return type is http.Response
  // for examples with headers, check api_post
  http.Response response = await http.get(url + "/posts");

  // check response status code
  if (response.statusCode == 200) {
    // the response body
    String responseBody = response.body;

    // use dart:convert to decode JSON
    dynamic decodedJson = json.decode(responseBody);

    // use this when the response contains an array
    List resList = (decodedJson as List)
      // map each element of the array/list to a new Post object as defined in class_post.dart
      .map((item) => new Post.getfromJson(item))
      // convert the json to a list
      .toList();

    // the returned data will be a list of Posts
    return resList;
  } else {
    print("ERROR in getting post: status code: " + response.statusCode.toString());
    return null;
  }
}