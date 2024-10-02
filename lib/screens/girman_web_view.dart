import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GirmanWebView extends StatefulWidget {
  final String title;
  final String link;

  const GirmanWebView({super.key, required this.title, required this.link});

  @override
  State<GirmanWebView> createState() => _GirmanWebViewState();
}

class _GirmanWebViewState extends State<GirmanWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          widget.title,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
