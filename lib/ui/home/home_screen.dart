import 'package:flutter/material.dart';
import 'package:image_search/data/fake_data.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home screen'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: fakePhotos.map((e) => Image.network(e.previewURL, fit: BoxFit.cover,)).toList(),
      ),
    );
  }
}
