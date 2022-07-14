import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:logger/logger.dart';

import '../../../flavors/build_config.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';

class WebViewPage extends StatefulWidget {

  final String url;

  const WebViewPage({
    Key? key, required this.url,
  }) : super(key: key);


  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late PullToRefreshController pullToRefreshController;
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  double progress = 0;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.url;
    Logger logger = BuildConfig.instance.config.logger;
    logger.d('aap, loadWebUrl: $url');

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        progress < 1.0
            ? LinearProgressIndicator(value: progress)
            : Container(),

        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(url)),
            initialOptions: options,
            pullToRefreshController: pullToRefreshController,
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              //TODO
            },
            androidOnPermissionRequest: (controller, origin, resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },

            onLoadStop: (controller, url) async {
              pullToRefreshController.endRefreshing();
            },
            onLoadError: (controller, url, code, message) {
              pullToRefreshController.endRefreshing();
            },
            onProgressChanged: (controller, progress) {
              if (progress == AppValues.maxProgress) {
                pullToRefreshController.endRefreshing();
              }
              setState(() {
                this.progress = progress / AppValues.maxProgress;
              });
            },
          ),
        ),
      ],
    );
  }
}
