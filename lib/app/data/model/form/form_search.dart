import 'package:pop_movie_app/app/data/api_config.dart';

class FormSearch {
  FormSearch({
      this.apiKey, 
      this.query, 
      this.page,});

  FormSearch.fromJson(dynamic json) {
    apiKey = json['api_key']??ApiConfig.apiKey;
    query = json['query'];
    page = json['page'];
  }
  String? apiKey;
  String? query;
  int? page;
FormSearch copyWith({  String? apiKey,
  String? query,
  int? page,
}) => FormSearch(  apiKey: apiKey ?? this.apiKey,
  query: query ?? this.query,
  page: page ?? this.page,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_key'] = apiKey?? ApiConfig.apiKey;
    map['query'] = query;
    map['page'] = page;
    return map;
  }

}