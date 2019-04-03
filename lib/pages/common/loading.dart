import 'package:flutter/material.dart';

// LoadingIndicator 加载中指示器
class LoadingIndicator extends StatelessWidget {

  LoadingIndicator({ Key key, this.isLoading = true }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 0.0,
          child: Column(
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
                width: 20.0,
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text('正在加载中', style: TextStyle(color: Colors.grey, fontSize: 10.0),),
              ),
            ],
          ),
        )
      ),
    );
  }
}

// LoadingCompleteIndicator 加载完成提示
class LoadingCompleteIndicator extends StatelessWidget {

  LoadingCompleteIndicator({ Key key, this.text }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: Text(text??'全部加载完了哦~', style: TextStyle(color: Colors.grey),),
      ),
    );
  }
}