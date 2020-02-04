import 'package:flutter/material.dart';
import '../model/image_model.dart';


class ImageList extends StatelessWidget {
    final List<ImageModel> images;
    ImageList(this.images);

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context,int index) {
          return buildImage(index);
         
        },
      );
    }
    Widget buildImage(int index){
      return Container (
            margin:EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border:Border.all(color:Colors.grey),
            ),
            child: Column(children: <Widget>[
              new Image.network(images[index].url),
              Padding(padding:EdgeInsets.only(top:20.0),child:  Text('${images[index].title}'))
             
            ],) 
          );
    }

} 
