import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MemeTile extends StatelessWidget {
  final meme;

  MemeTile({ this.meme });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: Image.network(meme['url']),
          title: Text(meme['name']),
          subtitle: GestureDetector(
            child: Text(meme['url'], style: TextStyle(color: Colors.blue)),
            onTap: () {
              launch(meme['url']);
            }
          )
        ),
      )
    );
  }
}
