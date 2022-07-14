import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_movie_app/app/core/values/app_colors.dart';
import 'package:pop_movie_app/app/core/values/app_values.dart';
import 'package:pop_movie_app/app/data/model/response/review_entity.dart';

class ItemReviewWidget extends StatelessWidget {
  final ReviewEntity data;

  const ItemReviewWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: AppValues.iconDefaultSize,
              child: CachedNetworkImage(
                imageUrl: '${data.authorDetails?.avatarPath}',
                placeholder: (context, data){
                  return Container(color: AppColors.lightGreyColor,);
                },
                errorWidget: (context, data, error){
                  return Container(decoration: const BoxDecoration(
                      color: AppColors.lightGreyColor,
                      shape: BoxShape.circle
                  ),);
                },
              ),
            ),

            const SizedBox(width: 10,),

            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Text('${data.authorDetails?.name}',
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),),

                    Text('${data.authorDetails?.username}',
                      style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),),

                    Text('${data.authorDetails?.rating}',
                      style: GoogleFonts.poppins(fontSize: 11),),
                  ],
                )
            )
          ],
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text('${data.content}',
            style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w300),),
        )

      ],
    );



    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: AppValues.iconDefaultSize,
                child: CachedNetworkImage(
                  imageUrl: '${data.authorDetails?.avatarPath}',
                  placeholder: (context, data){
                    return Container(color: AppColors.lightGreyColor,);
                  },
                  errorWidget: (context, data, error){
                    return Container(decoration: const BoxDecoration(
                      color: AppColors.lightGreyColor,
                      shape: BoxShape.circle
                    ),);
                  },
                ),
              ),

              Text('${data.authorDetails?.rating}'),

              Flexible(
                  child: Container(),
              )

            ],
          ),

          const SizedBox(width: 10,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('${data.authorDetails?.name}',
                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),),
                const SizedBox(height: 8,),
                Text('${data.content}',
                  style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w300),)
              ],
            )
          )
        ],
      ),
    );
  }
}
