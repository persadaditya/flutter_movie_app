import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/model/base_entity.dart';
import 'package:pop_movie_app/app/data/local/movie_category.dart';
import 'package:pop_movie_app/app/data/model/form/form_list.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';
import 'package:pop_movie_app/app/data/repository/movie/movie_repository.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';

class HomeController extends BaseController {
  
  final MovieRepository _movieRepository = 
      Get.find(tag: (MovieRepository).toString());

  final RxList<MovieEntity> _movieListController = RxList.empty();
  List<MovieEntity> get movieList => _movieListController.toList();
  
  final moviePagingController = PagingController<MovieEntity>();

  final _category = MovieCategory.Now_Playing.obs;
  MovieCategory  get category => _category.value;
  setCategory(MovieCategory category){
    _category.value = category;

    moviePagingController.initRefresh();
    getMovieList();
  }





  void getMovieList(){
    if(!moviePagingController.canLoadNextPage()) return;
    
    moviePagingController.isLoadingPage = true;
    
    FormList form = FormList()
      ..page = moviePagingController.pageNumber;
    Future<BaseEntity<List<MovieEntity>>> movieRepo;

    switch(category){
      case MovieCategory.Now_Playing:
        movieRepo = _movieRepository.getNowPlayingMovie(form);
        break;
      case MovieCategory.Popular:
        movieRepo = _movieRepository.getPopularMovie(form);
        break;
      case MovieCategory.Top_Rated:
        movieRepo = _movieRepository.getTopRatedMovie(form);
        break;
      case MovieCategory.Upcoming:
        movieRepo = _movieRepository.getUpcomingMovie(form);
        break;
    }
    
    callDataService(movieRepo, onSuccess: _handleMovieList);

    moviePagingController.isLoadingPage = false;
  }

  void _handleMovieList(BaseEntity<List<MovieEntity>> data){
    var movies = data.results ?? [];

    if(_isLastPage(movies.length, data.totalResults??0)){
      moviePagingController.appendLastPage(movies);
    } else {
      moviePagingController.appendPage(movies);
    }

    var movieList = [...moviePagingController.listItems];
    _movieListController(movieList);
  }

  onRefreshPage() {
    moviePagingController.initRefresh();
    getMovieList();
  }

  onLoadNextPage() {
    logger.i("On load next: page-${moviePagingController.pageNumber}");

    getMovieList();
  }


  bool _isLastPage(int newListItemCount, int totalCount) {
    return (movieList.length + newListItemCount) >= totalCount;
  }
}
