import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnimatedWebpWebView extends StatefulWidget {
  final String url;

  const AnimatedWebpWebView({super.key, required this.url});

  @override
  State<AnimatedWebpWebView> createState() => _AnimatedWebpWebViewState();
}

class _AnimatedWebpWebViewState extends State<AnimatedWebpWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) => request.url == widget.url
              ? NavigationDecision.navigate
              : NavigationDecision.prevent,
        ),
      )
      ..loadHtmlString(_html(widget.url));
  }

  String _html(String url) {
    final escapedUrl = url
        .replaceAll('&', '&amp;')
        .replaceAll('"', '&quot;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;');

    return '''
<!doctype html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      background: #000;
    }
    img {
      display: block;
      width: 100vw;
      height: 100vh;
      object-fit: cover;
    }
  </style>
</head>
<body>
  <img src="$escapedUrl">
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: WebViewWidget(controller: _controller));
  }
}
