import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../model/image_model.dart';
import '../widgets/image_list.dart';
class App extends StatefulWidget {
  createState() {
    return new AppState();
  }
}
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    final result = await get('https://jsonplaceholder.typicode.com/photos/${counter}');
    final imageModel = new ImageModel.fromJson(json.decode(result.body));
    setState(() => images.add(imageModel));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.yellowAccent),
        onPressed: fetchImage,
      ) ,
      appBar:AppBar(
       
        title: Text("Let's see some images!"),
      ),
      body: new ImageList(images),
    ),
   
  );
  }
}