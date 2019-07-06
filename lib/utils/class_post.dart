/**
 * This is a Post class that is going to extract all information from a post object from a http Response
 * The fields within each of the post objects need to be created here as attributes
 * A factory method must then be created to perform the extraction from the JSON
 */

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  // the constructor will take the parameters as objects.
  // This is important for the factory method
  Post({
    this.userId, 
    this.id, 
    this.title, 
    this.body
  });

  factory Post.getfromJson(Map<String,dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}