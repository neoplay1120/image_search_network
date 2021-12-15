class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  ///제이슨으로 변환 해서 사용되는 메서드
  ///이름 있는 생성
  ///앨범을 만들어 주는 생성자 무엇으로 부터 json
  /// {
  ///     "userId": 1,
  ///     "id": 1,
  ///     "title": "quidem molestiae enim"
  ///   }
  /// 제이슨 형식이 다트 형태와 같아서
  /// 제이슨 형식이 다트 형태와 같아서 중요해서 두번씀
  /// 생성자가 2개 있는것 같지만 하나는 제이슨형식으로 변
  ///
  /// factory로 만들어지면 재사용되게 해주는
  factory Album.fromJson(Map<String, dynamic> json) {

    return Album(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    );
  }

  @override
  String toString() {
    return 'Album{userId: $userId, id: $id, title: $title}';
  }
}

