import 'package:abook/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VideoConferenceScreen extends StatefulWidget {
  static const String id = 'VideoConferenceScreen';

  const VideoConferenceScreen({super.key});
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> {
  Uri url = Uri.parse("https://api.africaudio.ng/api/v1/auth/google/login");
  double progress = 0;
  bool isWebLoaded = false;
  Future getPermissions() async {
    si.permissionService.requestPermission();
  }

  @override
  void initState() {
    super.initState();
    getPermissions();
    isWebLoaded = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InAppWebView Example")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://api.africaudio.ng/api/v1/auth/google/login"),
        ),
        onWebViewCreated: (InAppWebViewController controller) {},
        onLoadStart: (InAppWebViewController controller, Uri? url) {
          print("Started loading: $url");
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          print("Finished loading: $url");
        },
      ),
    );
  }
}
