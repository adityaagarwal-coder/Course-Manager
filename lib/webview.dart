import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  // const WebView({Key? key}) : super(key: key);
  String video;
  WebView({required this.video});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        InAppWebView(initialUrlRequest: URLRequest(url: Uri.parse(widget.video))),
        Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close))))
      ]),
    );
  }
}
