import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/base/base_view.dart';
import 'package:pop_movie_app/app/core/values/text_styles.dart';
import 'package:pop_movie_app/app/core/widget/web_view_page.dart';
import 'package:pop_movie_app/app/routes/app_pages.dart';

import '../controllers/web_content_controller.dart';

class WebContentView extends BaseView<WebContentController> {

  static push(String title, String url){
    Get.toNamed(Routes.WEB_CONTENT, arguments: [title, url]);
  }

  final urlLink = Get.arguments[1];
  final title = Get.arguments[0];

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: (){
          Get.back();
        },
        icon: const Icon(Icons.arrow_back, color: Colors.black87,),
      ),
      centerTitle: false,
      title: Text(title, style: mediumTitleStyle,),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return WebViewPage(url: urlLink);
  }

}
