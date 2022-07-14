import 'dart:convert';
import 'package:pop_movie_app/generated/json/base/json_field.dart';
import 'package:pop_movie_app/generated/json/movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {

	bool? adult;
	@JSONField(name: "backdrop_path")
	String? backdropPath;
	@JSONField(name: "belongs_to_collection")
	dynamic belongsToCollection;
	int? budget;
	List<MovieGenres>? genres;
	String? homepage;
	int? id;
	@JSONField(name: "imdb_id")
	String? imdbId;
	@JSONField(name: "original_language")
	String? originalLanguage;
	@JSONField(name: "original_title")
	String? originalTitle;
	String? overview;
	double? popularity;
	@JSONField(name: "poster_path")
	dynamic posterPath;
	@JSONField(name: "production_companies")
	List<MovieProductionCompanies>? productionCompanies;
	@JSONField(name: "production_countries")
	List<MovieProductionCountries>? productionCountries;
	@JSONField(name: "release_date")
	String? releaseDate;
	int? revenue;
	int? runtime;
	@JSONField(name: "spoken_languages")
	List<MovieSpokenLanguages>? spokenLanguages;
	String? status;
	String? tagline;
	String? title;
	bool? video;
	@JSONField(name: "vote_average")
	double? voteAverage;
	@JSONField(name: "vote_count")
	int? voteCount;
  
  MovieEntity();

  factory MovieEntity.fromJson(Map<String, dynamic> json) => $MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => $MovieEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MovieGenres {

	int? id;
	String? name;
  
  MovieGenres();

  factory MovieGenres.fromJson(Map<String, dynamic> json) => $MovieGenresFromJson(json);

  Map<String, dynamic> toJson() => $MovieGenresToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MovieProductionCompanies {

	int? id;
	@JSONField(name: "logo_path")
	String? logoPath;
	String? name;
	@JSONField(name: "origin_country")
	String? originCountry;
  
  MovieProductionCompanies();

  factory MovieProductionCompanies.fromJson(Map<String, dynamic> json) => $MovieProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => $MovieProductionCompaniesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MovieProductionCountries {

	@JSONField(name: "iso_3166_1")
	String? iso31661;
	String? name;
  
  MovieProductionCountries();

  factory MovieProductionCountries.fromJson(Map<String, dynamic> json) => $MovieProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => $MovieProductionCountriesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MovieSpokenLanguages {

	@JSONField(name: "iso_639_1")
	String? iso6391;
	String? name;
  
  MovieSpokenLanguages();

  factory MovieSpokenLanguages.fromJson(Map<String, dynamic> json) => $MovieSpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => $MovieSpokenLanguagesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}