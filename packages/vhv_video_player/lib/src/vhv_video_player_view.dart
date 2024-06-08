import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'uri_analyzer.dart' as uri_analyzer;

class VhvVideoPlayerView extends StatefulWidget {
  final String url;

  const VhvVideoPlayerView({super.key, required this.url});

  @override
  State<VhvVideoPlayerView> createState() => _VhvVideoPlayerViewState();
}

class _VhvVideoPlayerViewState extends State<VhvVideoPlayerView> {
  late WebViewController _webViewController;
  late bool _firstLoad;
  late Object? _error;
  late ValueNotifier<double> _progressNotifier;

  @override
  void initState() {
    super.initState();

    _error = null;
    _firstLoad = true;
    _progressNotifier = ValueNotifier(0);

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            _progressNotifier.value = progress / 100;
          },
          onPageStarted: (String url) {
            setState(() {
              _error = null;
            });
          },
          onPageFinished: (String url) {
            Future.delayed(const Duration(milliseconds: 20), () {
              _progressNotifier.value = 0;
            });
          },
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
      );

    try {
      final String youtubeUrl = uri_analyzer.standardizedUrl(widget.url);

      _webViewController.loadRequest(Uri.parse(youtubeUrl));
    } catch (error) {
      setState(() {
        _error = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Visibility(
          visible: _error == null,
          replacement: Container(
            color: Colors.black26,
            child: Center(
              child: Text(_error?.toString() ?? '', textAlign: TextAlign.center,),
            ),
          ),
          child: WebViewWidget(
            controller: _webViewController,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _progressNotifier,
          builder: (context, value, child) {
            return LinearProgressIndicator(value: value);
          }
        ),
      ],
    );
  }
}
