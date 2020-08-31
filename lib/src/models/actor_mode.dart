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
  ActorDetail actorDetail;

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

class ActorDetail {
  final String _directoryImg = 'https://image.tmdb.org/t/p/w500';

  String birthday;
  String knownForDepartment;
  String deathday;
  int id;
  String name;
  List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;
  bool adult;
  String imdbId;
  String homepage;

  ActorDetail({
    this.birthday,
    this.knownForDepartment,
    this.deathday,
    this.id,
    this.name,
    this.alsoKnownAs,
    this.gender,
    this.biography,
    this.popularity,
    this.placeOfBirth,
    this.profilePath,
    this.adult,
    this.imdbId,
    this.homepage,
  });

  ActorDetail.fromJson(Map<String, dynamic> json) {
    this.birthday = json['birthday'];
    this.knownForDepartment = json['know_for_department'];
    this.deathday = json['deathday'];
    this.id = json['id'];
    this.name = json['name'];
    this.alsoKnownAs = json['also_know_as'];
    this.gender = json['gender'];
    this.biography = json['biography'];
    this.popularity = json['popularity'] / 1;
    this.placeOfBirth = json['place_of_birth'];
    this.profilePath = json['profile_path'];
    this.adult = json['adult'];
    this.imdbId = json['imdb_id'];
    this.homepage = json['homepage'];
  }

  String getPicture() {
    if (profilePath == null) {
      return 'https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png';
    }

    return _directoryImg + profilePath;
  }
}
