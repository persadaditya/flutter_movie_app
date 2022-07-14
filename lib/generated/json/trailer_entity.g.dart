import 'package:pop_movie_app/generated/json/base/json_convert_content.dart';
import 'package:pop_movie_app/app/data/model/response/trailer_entity.dart';

TrailerEntity $TrailerEntityFromJson(Map<String, dynamic> json) {
	final TrailerEntity trailerEntity = TrailerEntity();
	final String? iso6391 = jsonConvert.convert<String>(json['iso_639_1']);
	if (iso6391 != null) {
		trailerEntity.iso6391 = iso6391;
	}
	final String? iso31661 = jsonConvert.convert<String>(json['iso_3166_1']);
	if (iso31661 != null) {
		trailerEntity.iso31661 = iso31661;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		trailerEntity.name = name;
	}
	final String? key = jsonConvert.convert<String>(json['key']);
	if (key != null) {
		trailerEntity.key = key;
	}
	final String? site = jsonConvert.convert<String>(json['site']);
	if (site != null) {
		trailerEntity.site = site;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		trailerEntity.size = size;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		trailerEntity.type = type;
	}
	final bool? official = jsonConvert.convert<bool>(json['official']);
	if (official != null) {
		trailerEntity.official = official;
	}
	final String? publishedAt = jsonConvert.convert<String>(json['published_at']);
	if (publishedAt != null) {
		trailerEntity.publishedAt = publishedAt;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		trailerEntity.id = id;
	}
	return trailerEntity;
}

Map<String, dynamic> $TrailerEntityToJson(TrailerEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['iso_639_1'] = entity.iso6391;
	data['iso_3166_1'] = entity.iso31661;
	data['name'] = entity.name;
	data['key'] = entity.key;
	data['site'] = entity.site;
	data['size'] = entity.size;
	data['type'] = entity.type;
	data['official'] = entity.official;
	data['published_at'] = entity.publishedAt;
	data['id'] = entity.id;
	return data;
}