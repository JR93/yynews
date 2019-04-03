import 'package:flutter/material.dart';
import 'package:yynews/model/topic_data.dart';
import 'package:yynews/utils/news_utils.dart';

// TopicInfo 列表项信息
class TopicInfo extends StatelessWidget {

  TopicInfo({ Key key, @required this.data, this.systemTime }) : super(key: key);

  final Data data;
  final int systemTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          Text(
            data.publishName,
            style: TextStyle(
              fontSize: 12.0,
              height: 1.0,
              color: Color.fromARGB(255, 153, 153, 153)
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 2.0),
            margin: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.remove_red_eye, color: Color.fromARGB(160, 153, 153, 153), size: 12.0),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    NewsUtils.formatNumber(data.readCount),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(255, 153, 153, 153)
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              NewsUtils.timeAlissa(data.publishTime, systemTime: systemTime),
              style: TextStyle(
                fontSize: 12.0,
                height: 1.0,
                color: Color.fromARGB(255, 153, 153, 153)
              ),
            ),
          ),
        ],
      ),
    );
  }
}