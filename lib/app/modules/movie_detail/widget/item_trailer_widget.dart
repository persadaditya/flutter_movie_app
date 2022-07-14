import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_movie_app/app/core/utils/date_util.dart';
import 'package:pop_movie_app/app/core/values/app_values.dart';
import 'package:pop_movie_app/app/core/values/text_styles.dart';
import 'package:pop_movie_app/app/data/model/response/trailer_entity.dart';

class ItemTrailerWidget extends StatelessWidget {
  final TrailerEntity item;

  const ItemTrailerWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageYoutube(String? id) => 'http://i3.ytimg.com/vi/$id/hqdefault.jpg';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.radius),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageYoutube(item.key)),
              fit: BoxFit.cover
            )
          ),
          child: const Center(child: Icon(Icons.play_circle_outline, size: 30,),),
        ),
        const SizedBox(height: 10,),
        Text(item.name ?? 'Name', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),),
        Text(DateUtil.dateServerToTrailerFormat(item.publishedAt), style: greyDarkTextStyle,)
      ],
    );
  }
}
