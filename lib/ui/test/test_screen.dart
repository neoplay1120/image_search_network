import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/model/Album.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Album? _album;

///sync 그리고 Async
  /// 동기(Sync) , 비동기(Async)
  /// Future 클래스 비동기식
  /// 미래에 <http.Resoponse>
  /// import 'package:http/http.dart' as http; <<<별명 http붙여도 되냐 안되냐!
  /// 탑레벨 사용하는 녀석들 가독성 때문에
  /// 퓨처는 리스폰 미래에 결과를 받을 것이고 언제가 될지 모른다.
  /////
  Future<Album> fetchAlbum() async {
    /// await [Future]가 리턴되는 코드]
    /// async + await 는 세트
    final http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    ///상태코드
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      ///JsonDecode
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      /// Exception
      throw Exception('Failed to load album');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchAlbum().then((album) {
        setState(() {
          _album = album;
        });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Network Sample'),
          ),
          body: Text(_album.toString()),
        );
  }
}
