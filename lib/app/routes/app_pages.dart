import 'package:get/get.dart';

import 'package:pop_movie_app/app/modules/movie_detail/bindings/movie_detail_binding.dart';
import 'package:pop_movie_app/app/modules/movie_detail/views/movie_detail_view.dart';
import 'package:pop_movie_app/app/modules/search/bindings/search_binding.dart';
import 'package:pop_movie_app/app/modules/search/views/search_view.dart';
import 'package:pop_movie_app/app/modules/web_content/bindings/web_content_binding.dart';
import 'package:pop_movie_app/app/modules/web_content/views/web_content_view.dart';

import '/app/modules/favorite/bindings/favorite_binding.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/bindings/main_binding.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/other/bindings/other_binding.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL,
      page: () => MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: _Paths.WEB_CONTENT,
      page: () => WebContentView(),
      binding: WebContentBinding(),
    ),
  ];
}
