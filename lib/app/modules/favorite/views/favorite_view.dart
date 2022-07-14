import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_movie_app/app/routes/app_pages.dart';

import '../../../core/values/app_values.dart';
import '../../home/widget/item_movies.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends BaseView<FavoriteController> {


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text('Favorite', style: bigTitleStyle,),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    controller.getFavoriteMovies();

    return Obx(() => controller.favMovie.isEmpty ?
    const Center(
      child: Text('No Favorite Movies'),
    ):

    ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
      shrinkWrap: true,
      itemCount: controller.favMovie.length,
      primary: false,
      itemBuilder: (context, index) {
        var model = controller.favMovie[index];

        return ItemMoviesWidget(item: model,
          onClickItem: ()async{
            final data = await Get.toNamed(Routes.MOVIE_DETAIL, arguments: model.id);
            if(data==1){
              controller.getFavoriteMovies();
            }
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
      const SizedBox(height: AppValues.smallMargin),
    ));
  }
}
