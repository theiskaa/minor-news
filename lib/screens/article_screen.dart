import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/widget/components/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget {
  final String blogUrl;
  ArticleScreen({this.blogUrl});
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      child: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
      ),
    );
  }

  CustomAppBar buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
