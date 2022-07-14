import 'dart:convert';
import 'package:pop_movie_app/generated/json/base/json_field.dart';
import 'package:pop_movie_app/generated/json/review_entity.g.dart';

@JsonSerializable()
class ReviewEntity {

	String? author;
	@JSONField(name: "author_details")
	ReviewAuthorDetails? authorDetails;
	String? content;
	@JSONField(name: "created_at")
	String? createdAt;
	String? id;
	@JSONField(name: "updated_at")
	String? updatedAt;
	String? url;
  
  ReviewEntity();

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => $ReviewEntityFromJson(json);

  Map<String, dynamic> toJson() => $ReviewEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReviewAuthorDetails {

	String? name;
	String? username;
	@JSONField(name: "avatar_path")
	String? avatarPath;
	dynamic rating;
  
  ReviewAuthorDetails();

  factory ReviewAuthorDetails.fromJson(Map<String, dynamic> json) => $ReviewAuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => $ReviewAuthorDetailsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}