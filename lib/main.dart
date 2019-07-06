import 'package:api_example/utils/api_post.dart';
/**
 *    __ _       _   _                 _    ____ ___   ____                       
 *   / _| |_   _| |_| |_ ___ _ __     / \  |  _ \_ _| |  _ \  ___ _ __ ___   ___  
 *  | |_| | | | | __| __/ _ \ '__|   / _ \ | |_) | |  | | | |/ _ \ '_ ` _ \ / _ \ 
 *  |  _| | |_| | |_| ||  __/ |     / ___ \|  __/| |  | |_| |  __/ | | | | | (_) |
 *  |_| |_|\__,_|\__|\__\___|_|    /_/   \_\_|  |___| |____/ \___|_| |_| |_|\___/ 
 * 
 * Mushfiq Mahmud 
 * July 7 2019
 * 
 * This is an example for working with APIs in Flutter
 */

import 'package:flutter/material.dart';

import './utils/api_get.dart';
import './utils/class_post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(title: 'Flutter API Demo Home Page'),
    );
  }
}

// the layout needs to be a stateful widget
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  // page variables
  bool isLoading = false;
  List<Post> posts;

  // override initState to run the _fetchData() function on state change
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  // async function to call the API and show/hide loading screens
  Future _fetchData() async {
    // show Loading Screen
    setState(() => isLoading = true);
    // get Posts
    posts = await getPosts();
    // hide Loading Screen
    setState(() => isLoading = false);
    
    // create Post
    // print(await createPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // check if loading screen needs to be shown
        child: isLoading
        // if it is, show the Circular Progress Indicator
        ? CircularProgressIndicator()
        // Otherwise, show the list of Posts
        : ListView.builder(
          // this is going to be the list length
          itemCount: posts.length,
          // this is a function to build each item on the list
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body)
            );
          },
        )
      )
    );
  }
}
