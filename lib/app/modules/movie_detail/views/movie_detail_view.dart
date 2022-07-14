import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_movie_app/app/core/base/base_view.dart';
import 'package:pop_movie_app/app/core/values/app_colors.dart';
import 'package:pop_movie_app/app/core/values/app_values.dart';
import 'package:pop_movie_app/app/core/widget/asset_image_view.dart';
import 'package:pop_movie_app/app/core/widget/poster_image_widget.dart';
import 'package:pop_movie_app/app/modules/movie_detail/widget/item_review_widet.dart';
import 'package:pop_movie_app/app/modules/movie_detail/widget/item_trailer_widget.dart';
import 'package:pop_movie_app/app/routes/app_pages.dart';
import 'package:pop_movie_app/flavors/build_config.dart';

import '../../../core/widget/paging_view.dart';
import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends BaseView<MovieDetailController> {

  static push(int? id){
    Get.toNamed(Routes.MOVIE_DETAIL, arguments: id);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: innerBoxIsScrolled? Colors.transparent: Colors.white,
            pinned: true,
            stretch: true,
            snap: false,
            centerTitle: false,
            leading: arrowBack(),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Obx(()=> Text(controller.data.title ?? 'Movie Name', maxLines: !innerBoxIsScrolled ? 2 : 1, overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),)
              ),
              expandedTitleScale: 1.1,
              titlePadding: !innerBoxIsScrolled ?
              const EdgeInsets.only(left: 120, bottom: 40) :
              const EdgeInsets.all(0),
              background: headerSliverWidget(),
            ),
            bottom: tabBarWidget()
          ),
        ];
      },
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
        padding: const EdgeInsets.only(top: AppValues.margin_20),
        child: TabBarView(
          controller: controller.tabController,
          children: [
            movieData(),
            reviewData(),
            trailerData()
          ],
        ),
      )
    );
  }

  PreferredSizeWidget tabBarWidget(){
    return TabBar(
      controller: controller.tabController,
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      tabs: const [
        Tab(text: "About Movie"),
        Tab(text: "Review"),
        Tab(text: "Trailer"),
      ],
    );
  }

  Widget headerSliverWidget(){
    String baseImageUrl = BuildConfig.instance.config.baseImageUrl;

    return Obx(()=>Container(
      height: 330,
      child: Stack(
        children: [

          controller.data.backdropPath == null ?
          const Center(
            child: AssetImageView(
              fileName: 'movie_launcher.png',
              width: 50,
              height: 50,
            ),
          ) :
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(AppValues.radius)),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      baseImageUrl + '${controller.data.backdropPath}'
                  ),
                  fit: BoxFit.fill
              ),
            ),
          ),

          Align(
            alignment: const Alignment(-0.95, 0.5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              child: PosterImageWidget(url: controller.data.posterPath),
            ),
          )

        ],
      ),
    ));
  }


  Widget arrowBack(){
    return Align(
      alignment: const Alignment(-0.9, -0.9),
      child: CircleAvatar(
        radius: AppValues.iconSize_20,
        backgroundColor: AppColors.lightGreyColor,
        child: IconButton(onPressed: (){
          Get.back(result: 1);
        }, icon: const Center(child: Icon(Icons.arrow_back))
        ),
      )
    );
  }

  Widget genreWidget(){
    return Obx(()=>controller.data.genres == null ?
    Container() :

    ListView(
      scrollDirection: Axis.horizontal,
      children: controller.data.genres!.toList().map((e) => genreItem(e.name ?? '')).toList(),
    ));
  }

  Widget genreItem(String item){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding,),
      margin: const EdgeInsets.only(right: AppValues.margin_6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppValues.radius),
          right: Radius.circular(AppValues.radius)
        ),
        color: AppColors.lightGreyColor
      ),
      child: Center(child: Text(item, style: GoogleFonts.poppins(fontSize: 12),)),
    );
  }

  Widget movieData(){
    return ListView(
      // padding: const EdgeInsets.only(top: 50),
      shrinkWrap: true,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  height: 24,
                  margin: const EdgeInsets.only(bottom: AppValues.margin_10),
                  child: genreWidget()
              ),
            ),

            Obx(()=>CircleAvatar(
              backgroundColor: AppColors.lightGreyColor,
              child: IconButton(
                  onPressed: (){
                    controller.setIsFavMovie();
                  },
                  icon: controller.isFavMovie ? const Icon(Icons.bookmark): const Icon(Icons.bookmark_border)
              ),
            ))
          ],
        ),

        Obx(()=>movieDataItem('Overview:', controller.data.overview?? 'Overview data here')),

        const SizedBox(height: 10,),

        Obx(()=>movieDataItem('Release Date:', controller.data.releaseDate?? 'no data')),

        const SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Expanded(
                child: Obx(()=>
                    movieDataItem('Average Rating:',
                        controller.data.voteAverage.toString())
                )
            ),

            Expanded(
              child: Obx(()=>
                  movieDataItem('Rate Count:',
                      controller.data.voteCount.toString())
              ),
            ),
          ],
        ),

        const SizedBox(height: 10,),

        Obx(()=>movieDataItem('Popularity:', controller.data.popularity.toString())),

      ],
    );
  }

  Widget movieDataItem(String title, String content){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
        Text(content)
      ],
    );
  }

  Widget reviewData(){
    return PagingView(
      onRefresh: () async {
        controller.onRefreshReview();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Obx(() => controller.reviewList.isEmpty ?
        const Center(
          child: Text('No data review'),
        ):

        ListView.separated(
          shrinkWrap: true,
          itemCount: controller.reviewList.length,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var model = controller.reviewList[index];

            return ItemReviewWidget(data: model);
          },
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: AppValues.margin_20),
        ),
        ),
      ),
    );
  }

  Widget trailerData(){
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Obx(() => controller.trailerList.isEmpty ?
      const Center(
        child: Text('No data review'),
      ):

      ListView.separated(
        shrinkWrap: true,
        itemCount: controller.trailerList.length,
        primary: false,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var model = controller.trailerList[index];

          return ItemTrailerWidget(item: model);
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(height: AppValues.margin_20),
      ),
      ),
    );
  }
}
