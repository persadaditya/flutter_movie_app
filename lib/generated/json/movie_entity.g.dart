import 'package:pop_movie_app/generated/json/base/json_convert_content.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';

MovieEntity $MovieEntityFromJson(Map<String, dynamic> json) {
	final MovieEntity movieEntity = MovieEntity();
	final bool? adult = jsonConvert.convert<bool>(json['adult']);
	if (adult != null) {
		movieEntity.adult = adult;
	}
	final String? backdropPath = jsonConvert.convert<String>(json['backdrop_path']);
	if (backdropPath != null) {
		movieEntity.backdropPath = backdropPath;
	}
	final dynamic? belongsToCollection = jsonConvert.convert<dynamic>(json['belongs_to_collection']);
	if (belongsToCollection != null) {
		movieEntity.belongsToCollection = belongsToCollection;
	}
	final int? budget = jsonConvert.convert<int>(json['budget']);
	if (budget != null) {
		movieEntity.budget = budget;
	}
	final List<MovieGenres>? genres = jsonConvert.convertListNotNull<MovieGenres>(json['genres']);
	if (genres != null) {
		movieEntity.genres = genres;
	}
	final String? homepage = jsonConvert.convert<String>(json['homepage']);
	if (homepage != null) {
		movieEntity.homepage = homepage;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		movieEntity.id = id;
	}
	final String? imdbId = jsonConvert.convert<String>(json['imdb_id']);
	if (imdbId != null) {
		movieEntity.imdbId = imdbId;
	}
	final String? originalLanguage = jsonConvert.convert<String>(json['original_language']);
	if (originalLanguage != null) {
		movieEntity.originalLanguage = originalLanguage;
	}
	final String? originalTitle = jsonConvert.convert<String>(json['original_title']);
	if (originalTitle != null) {
		movieEntity.originalTitle = originalTitle;
	}
	final String? overview = jsonConvert.convert<String>(json['overview']);
	if (overview != null) {
		movieEntity.overview = overview;
	}
	final double? popularity = jsonConvert.convert<double>(json['popularity']);
	if (popularity != null) {
		movieEntity.popularity = popularity;
	}
	final dynamic? posterPath = jsonConvert.convert<dynamic>(json['poster_path']);
	if (posterPath != null) {
		movieEntity.posterPath = posterPath;
	}
	final List<MovieProductionCompanies>? productionCompanies = jsonConvert.convertListNotNull<MovieProductionCompanies>(json['production_companies']);
	if (productionCompanies != null) {
		movieEntity.productionCompanies = productionCompanies;
	}
	final List<MovieProductionCountries>? productionCountries = jsonConvert.convertListNotNull<MovieProductionCountries>(json['production_countries']);
	if (productionCountries != null) {
		movieEntity.productionCountries = productionCountries;
	}
	final String? releaseDate = jsonConvert.convert<String>(json['release_date']);
	if (releaseDate != null) {
		movieEntity.releaseDate = releaseDate;
	}
	final int? revenue = jsonConvert.convert<int>(json['revenue']);
	if (revenue != null) {
		movieEntity.revenue = revenue;
	}
	final int? runtime = jsonConvert.convert<int>(json['runtime']);
	if (runtime != null) {
		movieEntity.runtime = runtime;
	}
	final List<MovieSpokenLanguages>? spokenLanguages = jsonConvert.convertListNotNull<MovieSpokenLanguages>(json['spoken_languages']);
	if (spokenLanguages != null) {
		movieEntity.spokenLanguages = spokenLanguages;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		movieEntity.status = status;
	}
	final String? tagline = jsonConvert.convert<String>(json['tagline']);
	if (tagline != null) {
		movieEntity.tagline = tagline;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		movieEntity.title = title;
	}
	final bool? video = jsonConvert.convert<bool>(json['video']);
	if (video != null) {
		movieEntity.video = video;
	}
	final double? voteAverage = jsonConvert.convert<double>(json['vote_average']);
	if (voteAverage != null) {
		movieEntity.voteAverage = voteAverage;
	}
	final int? voteCount = jsonConvert.convert<int>(json['vote_count']);
	if (voteCount != null) {
		movieEntity.voteCount = voteCount;
	}
	return movieEntity;
}

Map<String, dynamic> $MovieEntityToJson(MovieEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['adult'] = entity.adult;
	data['backdrop_path'] = entity.backdropPath;
	data['belongs_to_collection'] = entity.belongsToCollection;
	data['budget'] = entity.budget;
	data['genres'] =  entity.genres?.map((v) => v.toJson()).toList();
	data['homepage'] = entity.homepage;
	data['id'] = entity.id;
	data['imdb_id'] = entity.imdbId;
	data['original_language'] = entity.originalLanguage;
	data['original_title'] = entity.originalTitle;
	data['overview'] = entity.overview;
	data['popularity'] = entity.popularity;
	data['poster_path'] = entity.posterPath;
	data['production_companies'] =  entity.productionCompanies?.map((v) => v.toJson()).toList();
	data['production_countries'] =  entity.productionCountries?.map((v) => v.toJson()).toList();
	data['release_date'] = entity.releaseDate;
	data['revenue'] = entity.revenue;
	data['runtime'] = entity.runtime;
	data['spoken_languages'] =  entity.spokenLanguages?.map((v) => v.toJson()).toList();
	data['status'] = entity.status;
	data['tagline'] = entity.tagline;
	data['title'] = entity.title;
	data['video'] = entity.video;
	data['vote_average'] = entity.voteAverage;
	data['vote_count'] = entity.voteCount;
	return data;
}

MovieGenres $MovieGenresFromJson(Map<String, dynamic> json) {
	final MovieGenres movieGenres = MovieGenres();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		movieGenres.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		movieGenres.name = name;
	}
	return movieGenres;
}

Map<String, dynamic> $MovieGenresToJson(MovieGenres entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

MovieProductionCompanies $MovieProductionCompaniesFromJson(Map<String, dynamic> json) {
	final MovieProductionCompanies movieProductionCompanies = MovieProductionCompanies();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		movieProductionCompanies.id = id;
	}
	final String? logoPath = jsonConvert.convert<String>(json['logo_path']);
	if (logoPath != null) {
		movieProductionCompanies.logoPath = logoPath;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		movieProductionCompanies.name = name;
	}
	final String? originCountry = jsonConvert.convert<String>(json['origin_country']);
	if (originCountry != null) {
		movieProductionCompanies.originCountry = originCountry;
	}
	return movieProductionCompanies;
}

Map<String, dynamic> $MovieProductionCompaniesToJson(MovieProductionCompanies entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['logo_path'] = entity.logoPath;
	data['name'] = entity.name;
	data['origin_country'] = entity.originCountry;
	return data;
}

MovieProductionCountries $MovieProductionCountriesFromJson(Map<String, dynamic> json) {
	final MovieProductionCountries movieProductionCountries = MovieProductionCountries();
	final String? iso31661 = jsonConvert.convert<String>(json['iso_3166_1']);
	if (iso31661 != null) {
		movieProductionCountries.iso31661 = iso31661;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		movieProductionCountries.name = name;
	}
	return movieProductionCountries;
}

Map<String, dynamic> $MovieProductionCountriesToJson(MovieProductionCountries entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['iso_3166_1'] = entity.iso31661;
	data['name'] = entity.name;
	return data;
}

MovieSpokenLanguages $MovieSpokenLanguagesFromJson(Map<String, dynamic> json) {
	final MovieSpokenLanguages movieSpokenLanguages = MovieSpokenLanguages();
	final String? iso6391 = jsonConvert.convert<String>(json['iso_639_1']);
	if (iso6391 != null) {
		movieSpokenLanguages.iso6391 = iso6391;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		movieSpokenLanguages.name = name;
	}
	return movieSpokenLanguages;
}

Map<String, dynamic> $MovieSpokenLanguagesToJson(MovieSpokenLanguages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['iso_639_1'] = entity.iso6391;
	data['name'] = entity.name;
	return data;
}