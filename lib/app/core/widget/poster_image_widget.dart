import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pop_movie_app/app/core/widget/asset_image_view.dart';
import 'package:pop_movie_app/flavors/build_config.dart';

import '../values/app_values.dart';
import 'elevated_container.dart';

class PosterImageWidget extends StatelessWidget {
  final String? url;

  const PosterImageWidget({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String baseImage = BuildConfig.instance.config.baseImageUrl;

    return ElevatedContainer(
        child: Container(
          height: AppValues.heightPosterContainer,
          width: AppValues.widthPosterContainer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppValues.smallRadius),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(baseImage+'$url'),
                  fit: BoxFit.cover
              )
          ),
          child: url==null?
          const Center(
            child: AssetImageView(
              fileName: 'movie_launcher.png',
              height: 50,
              width: 50,
            ),
          ) :
          Container(),
        )
    );
  }
}
