import 'package:pop_movie_app/app/data/api_config.dart';

class FormList {
  FormList({
      this.apiKey, 
      this.language, 
      this.page,});

  FormList.fromJson(dynamic json) {
    apiKey = json['api_key']??ApiConfig.apiKey;
    language = json['language']??ApiConfig.language;
    page = json['page'];
  }
  String? apiKey;
  String? language;
  int? page;
FormList copyWith({  String? apiKey,
  String? language,
  int? page,
}) => FormList(  apiKey: apiKey ?? this.apiKey,
  language: language ?? this.language,
  page: page ?? this.page,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_key'] = apiKey ?? ApiConfig.apiKey;
    map['language'] = language ?? ApiConfig.language;
    map['page'] = page;

    return map;
  }

}