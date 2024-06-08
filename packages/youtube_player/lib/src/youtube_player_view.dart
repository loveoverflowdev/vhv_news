
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'uri_analyzer.dart' as uri_analyzer;

class YoutubePlayerView extends StatefulWidget {
  final String url;

  const YoutubePlayerView({super.key, required this.url});

  @override
  State<YoutubePlayerView> createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  late WebViewController _webViewController;
  late bool _firstLoad;


  @override
  void initState() {
    super.initState();

    final String youtubeUrl = uri_analyzer.standardizedUrl(widget.url);

    _firstLoad = true;
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (_firstLoad) {
              _firstLoad = false;
              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(youtubeUrl));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _webViewController,
    );
  }
}
