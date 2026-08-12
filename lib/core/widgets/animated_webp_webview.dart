import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
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
          onNavigationRequest: (request) =>
              request.url == widget.url ||
              request.url.startsWith('about:blank') ||
              request.url.startsWith('data:')
                  ? NavigationDecision.navigate
                  : NavigationDecision.prevent,
        ),
      );
    _loadContent(widget.url);
  }

  @override
  void didUpdateWidget(AnimatedWebpWebView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _loadContent(widget.url);
    }
  }

  Future<void> _loadContent(String url) async {
    final htmlContent = await _getHtmlForUrl(url);
    if (mounted) {
      await _controller.loadHtmlString(htmlContent);
    }
  }

  Future<String> _getHtmlForUrl(String url) async {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return _html(url);
    } else if (url.startsWith('assets/')) {
      try {
        final byteData = await rootBundle.load(url);
        final bytes = byteData.buffer.asUint8List();
        final base64Image = base64Encode(bytes);
        final mimeType = url.endsWith('.webp') ? 'image/webp' : 'image/png';
        return _html('data:$mimeType;base64,$base64Image');
      } catch (e) {
        return _html(url);
      }
    } else if (url.startsWith('file://') || url.startsWith('/')) {
      try {
        final cleanPath = url.replaceFirst('file://', '');
        final file = File(cleanPath);
        if (await file.exists()) {
          final bytes = await file.readAsBytes();
          final base64Image = base64Encode(bytes);
          final mimeType = url.endsWith('.webp') ? 'image/webp' : 'image/png';
          return _html('data:$mimeType;base64,$base64Image');
        }
      } catch (e) {
        return _html(url);
      }
    }
    return _html(url);
  }

  String _html(String src) {
    final escapedSrc = src
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
  <img src="$escapedSrc">
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.black,
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
