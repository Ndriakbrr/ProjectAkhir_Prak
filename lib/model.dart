import 'dart:convert';

class Games {
  final String? id;
  final String? title;
  final String? thumbnail;
  final String? short_description;
  final String? game_url;
  final String? genre;
  final String? platform;
  final String? publisher;
  final String? developer;
  final String? release_date;
  final String? freetogame_profile_url;

  Games({
  this.id,
  this.title,
  this.thumbnail,
  this.short_description,
  this.game_url,
  this.genre,
  this.platform,
  this.publisher,
  this.developer,
  this.release_date,
  this.freetogame_profile_url,
  });

  Games.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        thumbnail = json['thumbnail'] as String?,
        short_description = json['short_description'] as String?,
        game_url = json['game_url'] as String?,
        genre = json['genre'] as String?,
        platform = json['platform'] as String?,
        publisher = json['publisher'] as String?,
        developer = json['developer'] as String?,
        release_date = json['release_date'] as String?,
        freetogame_profile_url = json['freetogame_profile_url'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'thumbnail' : thumbnail,
    'short_description' : short_description,
    'game_url' : game_url,
    'genre' : genre,
    'platform' : platform,
    'publisher' : publisher,
    'developer' : developer,
    'release_date' : release_date,
    'freetogame_profile_url' : freetogame_profile_url,
  };
}