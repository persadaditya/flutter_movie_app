import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_movie_app/app/core/base/base_widget_mixin.dart';
import 'package:pop_movie_app/app/core/values/app_colors.dart';
import 'package:pop_movie_app/app/core/values/app_values.dart';
import 'package:pop_movie_app/app/core/widget/elevated_container.dart';
import 'package:pop_movie_app/app/core/widget/poster_image_widget.dart';
import 'package:pop_movie_app/app/data/model/response/movie_entity.dart';
import 'package:pop_movie_app/app/modules/movie_detail/views/movie_detail_view.dart';
import 'package:pop_movie_app/flavors/build_config.dart';

class ItemMoviesWidget extends StatelessWidget with BaseWidgetMixin{
  final MovieEntity item;
  final Function()? onClickItem;

  ItemMoviesWidget({Key? key, required this.item, this.onClickItem}) : super(key: key);


  @override
  Widget body(BuildContext context) {
    return InkWell(
      onTap: onClickItem ?? (){
        MovieDetailView.push(item.id);
      },
      child: Row(
        children: [
          PosterImageWidget(url: item.posterPath,),

          const SizedBox(width: 10,),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Title:', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,)),),
                Text(item.title?? 'Movie Name', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),),

                const SizedBox(height: 8,),

                Text('Release Date:', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,)),),
                Text(item.releaseDate?? 'date release', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),),

                const SizedBox(height: 8,),

                Text('Average Rating:', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,)),),
                Text('${item.voteAverage}', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),),

              ],
            )
          ),

          // favoriteButton()
        ],
      ),
    );
  }


  Widget favoriteButton(){
    return Column(
      children: [
        IconButton(
            onPressed: (){
              //TODO
            },
            icon: const Icon(Icons.bookmark_border, color: AppColors.colorAccent,)
        ),


      ],
    );
  }

}
