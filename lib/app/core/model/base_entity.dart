import 'package:pop_movie_app/generated/json/base/json_convert_content.dart';

class BaseEntity<T> {
  BaseEntity({
      this.page, 
      this.results, 
      this.dates, 
      this.totalPages, 
      this.totalResults, 
      this.statusMessage, 
      this.success, 
      this.statusCode,});

  BaseEntity.fromJson(dynamic json) {
    page = json['page'];
    results = json['results']!=null ? JsonConvert.fromJsonAsT<T>(json['results']): null;
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
  }
  int? page;
  T? results;
  Dates? dates;
  int? totalPages;
  int? totalResults;
  String? statusMessage;
  bool? success;
  int? statusCode;
BaseEntity copyWith({  int? page,
  String? results,
  Dates? dates,
  int? totalPages,
  int? totalResults,
  String? statusMessage,
  bool? success,
  int? statusCode,
}) => BaseEntity(  page: page ?? this.page,
  results: results ?? this.results,
  dates: dates ?? this.dates,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
  statusMessage: statusMessage ?? this.statusMessage,
  success: success ?? this.success,
  statusCode: statusCode ?? this.statusCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['results'] = results;
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    map['status_message'] = statusMessage;
    map['success'] = success;
    map['status_code'] = statusCode;

    return map;
  }

}

class Dates {
  Dates({
      this.maximum, 
      this.minimum,});

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;
Dates copyWith({  String? maximum,
  String? minimum,
}) => Dates(  maximum: maximum ?? this.maximum,
  minimum: minimum ?? this.minimum,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;

    return map;
  }

}