import 'dart:convert';
import 'package:pop_movie_app/generated/json/base/json_field.dart';
import 'package:pop_movie_app/generated/json/trailer_entity.g.dart';

@JsonSerializable()
class TrailerEntity {

	@JSONField(name: "iso_639_1")
	String? iso6391;
	@JSONField(name: "iso_3166_1")
	String? iso31661;
	String? name;
	String? key;
	String? site;
	int? size;
	String? type;
	bool? official;
	@JSONField(name: "published_at")
	String? publishedAt;
	String? id;
  
  TrailerEntity();

  factory TrailerEntity.fromJson(Map<String, dynamic> json) => $TrailerEntityFromJson(json);

  Map<String, dynamic> toJson() => $TrailerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}