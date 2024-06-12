import 'package:flutter/material.dart';
import 'package:member_app_v2/common/appbars_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreenWidget extends StatefulWidget {
  final String title, url;
  const WebviewScreenWidget(
      {super.key, required this.title, required this.url});

  @override
  State<WebviewScreenWidget> createState() => _WebviewScreenWidgetState();
}

class _WebviewScreenWidgetState extends State<WebviewScreenWidget> {
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    setState(() {
      webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.arianiAppBar(title: Text(widget.title), noActions: true),
      body: webViewController != null
          ? WebViewWidget(controller: webViewController!)
          : const CircularProgressIndicator(),
    );
  }
}
