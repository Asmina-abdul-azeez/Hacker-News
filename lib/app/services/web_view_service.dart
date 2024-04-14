import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class WebViewService {
  void loadRequest({required String url});
}

@Singleton(as: WebViewService)
class WebViewServiceImpl implements WebViewService {
  final WebViewController controller = WebViewController();

  @override
  void loadRequest({
    required String url,
    void Function(String)? onPageStarted,
    void Function(String)? onPageFinished,
  }) {
    controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: onPageStarted,
          onPageFinished: onPageFinished,
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}
