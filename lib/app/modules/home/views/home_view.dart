import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_movie_app/app/core/values/app_colors.dart';
import 'package:pop_movie_app/app/core/values/text_styles.dart';
import 'package:pop_movie_app/app/data/local/movie_category.dart';
import 'package:pop_movie_app/app/modules/home/widget/item_movies.dart';
import 'package:pop_movie_app/app/modules/search/views/search_view.dart';
import 'package:pop_movie_app/flavors/build_config.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/paging_view.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getMovieList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    String title = BuildConfig.instance.config.appName;

    return AppBar(
      centerTitle: false,
      title: Text(title,),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: (){
              SearchView.push();
            },
            icon: const Icon(Icons.search, color: Colors.black87,)
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [

        // searchContainer(),

        const SizedBox(height: 10,),

        categoryData(),

        const SizedBox(height: 10,),

        Expanded(child: pagingData()),


      ],
    );
  }

  Widget categoryData(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppValues.padding),
          child: Text('Categories', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),),
        ),

        const SizedBox(height: 10,),

        Container(
            height: 40,
            margin: const EdgeInsets.only(left: AppValues.padding),
            child: categoriesMovie()
        ),
      ],
    );
  }

  Widget categoriesMovie(){
    return ListView(
      scrollDirection: Axis.horizontal, children:
      MovieCategory.values.map((e) => categoryContainer(e))
          .toList(),
    );
  }

  Widget categoryContainer(MovieCategory category){
    return Obx((){
      bool isSelected = category.name == controller.category.name;

      return InkWell(
        onTap: (){
          controller.setCategory(category);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding,
              vertical: AppValues.padding_4),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.colorAccent : AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(AppValues.radius)
          ),
          child: Center(child: Text(category.name.replaceAll('_', ' '),
            style: TextStyle(color: isSelected? Colors.white : AppColors.textColorGreyDark,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300),)),
        ),
      );
    });
  }

  Widget searchContainer(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppValues.padding),
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.smallPadding),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(AppValues.smallRadius)
      ),
      child: Row(
        children:  [

          const Icon(Icons.search),

          const SizedBox(width: 10,),

          Expanded(
            child: TextField(
              readOnly: true,
              onTap: (){
                SearchView.push();
              },
              decoration: const InputDecoration.collapsed(hintText: 'Search movie here')
            ),
          ),

        ],
      ),
    );
  }


  Widget pagingData(){
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Obx(() => ListView.separated(
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

}
