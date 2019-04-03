import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  WebPage({Key key, this.title = 'YY新闻', @required this.url}) : super(key: key);

  final String title;
  final String url;

  @override
  _WebPageState createState() => new _WebPageState();
}

class _WebPageState extends State<WebPage> {
  int _stackIndex = 1;

  void _handleLoad(String url) {
    setState((){
      _stackIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.0),
        child: AppBar(
          title: Text(widget.title, style: TextStyle(fontSize: 18.0),),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, size: 20.0,),
          ),
          elevation: 0.3,
        ),
      ),
      body: IndexedStack(
        index: _stackIndex,
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: _handleLoad,
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}