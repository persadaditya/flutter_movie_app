
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/base/base_controller.dart';
import 'package:pop_movie_app/app/core/base/paging_controller.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/local/fav_helper.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';
import 'package:pop_movie_app/app/data/model/response/trailer_entity.dart';
import 'package:pop_movie_app/app/data/repository/movie/movie_repository.dart';
import 'package:pop_movie_app/app/data/repository/review/review_repository.dart';
import 'package:pop_movie_app/app/data/repository/trailer/trailer_repository.dart';

class MovieDetailController extends BaseController with GetSingleTickerProviderStateMixin {

  final MovieRepository _repository =
  Get.find(tag: (MovieRepository).toString());

  final ReviewRepository _reviewRepository = Get.find(tag: (ReviewRepository).toString());
  final TrailerRepository _trailerRepository = Get.find(tag: (TrailerRepository).toString());

  final Rx<MovieEntity> _movieData = MovieEntity().obs;
  MovieEntity get data => _movieData.value;

  final RxList<ReviewEntity> _reviewDataController = RxList.empty();
  List<ReviewEntity> get reviewList => _reviewDataController.toList();

  final RxList<TrailerEntity> _trailerDataController = RxList.empty();
  List<TrailerEntity> get trailerList => _trailerDataController.toList();

  final reviewPageController = PagingController<ReviewEntity>();

  final RxList<MovieEntity> _favMoviesController = RxList.empty();
  List<MovieEntity> get favMovies => _favMoviesController.toList();

  final _isFavMovie = false.obs;
  bool get isFavMovie => _isFavMovie.value;


  final id = Get.arguments;

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void getData(){

    FormList form = FormList();
    callDataService(_repository.getMovieById(id, form),
    onSuccess: _handleMovieData
    );
  }

  void _handleMovieData(MovieEntity data){
    _movieData(data);
    getReview();
    getTrailer();
    loadIsFavMovie();
  }

  void getReview(){
    if(!reviewPageController.canLoadNextPage()) return;

    reviewPageController.isLoadingPage = true;

    FormList form = FormList()
      ..page = reviewPageController.pageNumber;
    callDataService(_reviewRepository.getReview(id, form),
    onSuccess: _handleReview
    );
  }

  void _handleReview(BaseEntity<List<ReviewEntity>> data){
    var reviews = data.results ?? [];

    if(_isLastPage(reviews.length, data.totalResults??0)){
      reviewPageController.appendLastPage(reviews);
    } else {
      reviewPageController.appendPage(reviews);
    }

    var reviewList = [...reviewPageController.listItems];

    _reviewDataController(reviewList);
  }

  void getTrailer(){
    callDataService(_trailerRepository.getTrailerByMovieId(id),
    onSuccess: _handleTrailer);
  }

  void _handleTrailer(BaseEntity<List<TrailerEntity>> base){
    _trailerDataController(base.results);
  }

  loadIsFavMovie() async{
    _favMoviesController(await FavHelper().getFavMovies());
    _isFavMovie(await FavHelper().hasFavoriteMovie(id));

  }

  setIsFavMovie() async{

    if(isFavMovie){
      await FavHelper().deleteMovies(data);
    } else {
      await FavHelper().saveMovies(data);
    }

    await loadIsFavMovie();
  }

  onRefreshReview() {
    reviewPageController.initRefresh();
    getReview();
  }

  onLoadNextPage() {

    getReview();
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (reviewList.length + newListItemCount) >= totalCount;
  }
}
