class Cast {
  List<Actor> actores = new List();

  Cast() {}

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final Actor actor = new Actor.fromJsonMap(item);
      actores.add(actor);
    }
  }
}

class Actor {
  final String _directoryImg = 'https://image.tmdb.org/t/p/w500';

  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    this.castId = json['cast_id'];
    this.character = json['character'];
    this.creditId = json['credit_id'];
    this.gender = json['gender'];
    this.id = json['id'];
    this.name = json['name'];
    this.order = json['order'];
    this.profilePath = json['profile_path'];
  }

  String getPicture() {
    if (profilePath == null) {
      return 'https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png';
    }

    return _directoryImg + profilePath;
  }
}
