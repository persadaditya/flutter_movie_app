import 'package:flutter/material.dart';
import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/core/widget/ripple.dart';

class ItemSettings extends StatelessWidget with BaseWidgetMixin {
  final String? prefixImage;
  final String suffixImage;
  final String title;
  final String description;
  final Function()? onTap;
  final IconData? iconData;

  ItemSettings({
    this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
    required this.description,
    this.iconData
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          children: [
            prefixImage !=null ?
            AssetImageView(
              fileName: prefixImage ?? '',
              height: AppValues.iconSize_20,
              width: AppValues.iconSize_20,
            ) :
            Icon(iconData, size: AppValues.iconSize_20,),
            const SizedBox(width: AppValues.smallPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: settingsItemStyle),
                Text(description, style: greyDarkTextStyle,)
              ],
            ),
            const Spacer(),
            AssetImageView(
              fileName: suffixImage,
              color: AppColors.suffixImageColor,
              height: AppValues.iconSize_20,
              width: AppValues.iconSize_20,
            ),
          ],
        ),
      ),
    );
  }
}