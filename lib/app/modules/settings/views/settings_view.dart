import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/values/app_colors.dart';
import 'package:pop_movie_app/app/core/values/app_values.dart';
import 'package:pop_movie_app/app/core/widget/asset_image_view.dart';
import 'package:pop_movie_app/app/modules/web_content/views/web_content_view.dart';
import 'package:pop_movie_app/app/routes/app_pages.dart';
import 'package:pop_movie_app/flavors/build_config.dart';
import '../../../core/values/text_styles.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(appLocalization.bottomNavSettings, style: bigTitleStyle,),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        headerApp(),
        Obx(()=> ItemSettings(
          title: appLocalization.settingsTheme,
          prefixImage: 'ic_theme.png',
          suffixImage: 'arrow_forward.svg',
          onTap: _onThemeItemClicked,
          description: controller.isDarkTheme ? "Dark" : "Light",
        ),),

        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization.settingsLanguage,
          prefixImage: 'ic_language.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onLanguageItemClicked,
          description: 'English',
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization.settingsFontSize,
          prefixImage: 'ic_font_size.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onFontSizeItemClicked,
          description: 'Normal',
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: 'Privacy Policy',
          iconData: Icons.privacy_tip_outlined,
          suffixImage: 'arrow_forward.svg',
          onTap: _onPrivacyPolicyClicked,
          description: 'See for detail',
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: 'Terms and Condition',
          iconData: Icons.private_connectivity_outlined,
          suffixImage: 'arrow_forward.svg',
          onTap: _onTermsAndConditionsClicked,
          description: 'See for detail',
        ),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget headerApp(){
    String title = BuildConfig.instance.config.appName;

    return Container(
        color: AppColors.colorAccent,
        padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AssetImageView(fileName: 'movie_launcher.png',
              width: 50,
              height: 50,
              color: Colors.white,
            ),

            Text(title, style: titleStyleWhite,),
            Text('Version: 1.0.0', style: greyDarkTextStyle,)
          ],
        ),
      );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked() {
    showToast('Theme: Development in progress');
  }

  void _onLanguageItemClicked() {
    showToast('Language: Development in progress');
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }

  void _onPrivacyPolicyClicked() {
    WebContentView.push('Privacy Policy', 'https://www.privacypolicyonline.com/live.php?token=QY3lwVkNsIMEMOeBhjcURUz2fgEHKwqa');
  }

  void _onTermsAndConditionsClicked(){
    WebContentView.push('Terms and Condition', 'https://www.privacypolicyonline.com/live.php?token=0LOMg1vwXXHwzNcr3hPpUzFtDL1gixCV');
  }

}
