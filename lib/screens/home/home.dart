import 'package:NOMeme/screens/home/loading.dart';
import 'package:NOMeme/screens/home/meme_tile.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List memes = [];

  Future<List<dynamic>> getMeme() async {
    var response = await Dio().get("https://api.imgflip.com/get_memes");
    List meme = response.data['data']['memes'];

    setState(() {
      memes = meme;
    });
  }

  @override
  Widget build(BuildContext context) {
    getMeme();
    return Scaffold(
      appBar: AppBar(title: Text("NOMeme"), centerTitle: true),
      body: memes.length != 0 ? Container(
        child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: memes.length,
        itemBuilder: (context, item) {
          if (memes.length != 0) {
            if (item.isOdd) return Divider();

            final index = item ~/ 2;

            if (index >= memes.length) {
              memes.addAll(memes.take(10));
            }

            return MemeTile(meme: memes[item]);
          } else {
            return null;
          }
        },
      )) : Loading()
    );
  }
}
