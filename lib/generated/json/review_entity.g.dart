import 'package:pop_movie_app/generated/json/base/json_convert_content.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';

ReviewEntity $ReviewEntityFromJson(Map<String, dynamic> json) {
	final ReviewEntity reviewEntity = ReviewEntity();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		reviewEntity.author = author;
	}
	final ReviewAuthorDetails? authorDetails = jsonConvert.convert<ReviewAuthorDetails>(json['author_details']);
	if (authorDetails != null) {
		reviewEntity.authorDetails = authorDetails;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		reviewEntity.content = content;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		reviewEntity.createdAt = createdAt;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		reviewEntity.id = id;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		reviewEntity.updatedAt = updatedAt;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		reviewEntity.url = url;
	}
	return reviewEntity;
}

Map<String, dynamic> $ReviewEntityToJson(ReviewEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['author_details'] = entity.authorDetails?.toJson();
	data['content'] = entity.content;
	data['created_at'] = entity.createdAt;
	data['id'] = entity.id;
	data['updated_at'] = entity.updatedAt;
	data['url'] = entity.url;
	return data;
}

ReviewAuthorDetails $ReviewAuthorDetailsFromJson(Map<String, dynamic> json) {
	final ReviewAuthorDetails reviewAuthorDetails = ReviewAuthorDetails();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		reviewAuthorDetails.name = name;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		reviewAuthorDetails.username = username;
	}
	final String? avatarPath = jsonConvert.convert<String>(json['avatar_path']);
	if (avatarPath != null) {
		reviewAuthorDetails.avatarPath = avatarPath;
	}
	final dynamic? rating = jsonConvert.convert<dynamic>(json['rating']);
	if (rating != null) {
		reviewAuthorDetails.rating = rating;
	}
	return reviewAuthorDetails;
}

Map<String, dynamic> $ReviewAuthorDetailsToJson(ReviewAuthorDetails entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['username'] = entity.username;
	data['avatar_path'] = entity.avatarPath;
	data['rating'] = entity.rating;
	return data;
}