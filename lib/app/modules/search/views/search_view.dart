import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_movie_app/app/core/base/base_view.dart';
import 'package:pop_movie_app/app/core/values/app_colors.dart';
import 'package:pop_movie_app/app/routes/app_pages.dart';

import '../../../core/values/app_values.dart';
import '../../../core/widget/paging_view.dart';
import '../../home/widget/item_movies.dart';
import '../controllers/search_controller.dart';

class SearchView extends BaseView<SearchController> {

  static push(){
    Get.toNamed(Routes.SEARCH);
  }


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: (){
          Get.back();
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.textColorGreyDark,),
      ),
      title: textFieldSearch(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Obx(() => controller.movieList.isEmpty ?
        Container(
          height: Get.height - 100,
          child: const Center(
            child: Text('no data search'),
          ),
        ):

        ListView.separated(
          shrinkWrap: true,
          itemCount: controller.movieList.length,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var model = controller.movieList[index];

            return ItemMoviesWidget(item: model);
          },
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: AppValues.smallMargin),
        ),
        ),
      ),
    );
  }

  Widget textFieldSearch(){
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            controller: controller.textEditingController,
            autofocus: true,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.textEditingController.text = '';
                    controller.onRefreshPage();
                  },
                ),
                hintText: 'Search your movie here',
                hintStyle: GoogleFonts.poppins(fontSize: 14, color: AppColors.textColorGreyDark),
                border: InputBorder.none),
            onSubmitted: (text){
              controller.getMovieList();
            },
          ),
        )
    );
  }
}
