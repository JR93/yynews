import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yynews/event/bus.dart';
import 'package:yynews/model/news_data.dart';
import 'package:yynews/pages/common/web_page.dart';
import 'package:yynews/utils/news_utils.dart';

// NewsCover 列表项封面
class NewsCover extends StatelessWidget {

  NewsCover({ Key key, @required this.cover, this.width = 132.0, this.height = 96.0 }) : super(key: key);

  final String cover;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Image.network(cover, width: width, height: height, fit: BoxFit.cover),
    );
  }
}

// NewsTitle 列表项标题
class NewsTitle extends StatelessWidget {

  NewsTitle({ Key key, @required this.title, this.maxLines = 1 }) : super(key: key);

  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 29, 29, 29),
          fontSize: 18.0,
          height: 1.0,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      ),
    );
  }
}

// NewsInfo 列表项信息
class NewsInfo extends StatelessWidget {

  NewsInfo({ Key key, @required this.data }) : super(key: key);

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return WebPage(
                    url: 'https://mobi.yy.com/mobileweb/u/${data.anchorYYid}',
                    title: '${data.anchorName}视频资料大全',
                  ); // 跳转详情页
                }
              ));
            },
            child: Container(
              padding: const EdgeInsets.only(right: 5.0),
              height: 22.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(11.0)
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(data.anchorLogo),
                    radius: 11.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      data.anchorName,
                      style: TextStyle(
                        fontSize: 12.0,
                        height: 1.0,
                        color: Color.fromARGB(255, 153, 153, 153)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              int index;
              switch (data.topicId) {
                case 19:
                  index = 1; // 主播趣闻
                  break;
                case 152:
                  index = 2; // 神壕八卦
                  break;
                case 392:
                  index = 3; // 春季头条
                  break;
                case 349:
                  index = 4; // 周星盘点
                  break;
                case 351:
                  index = 5; // 公会动态
                  break;
                case 21:
                  index = 6; // 萌新求罩
                  break;
                case 384:
                  index = 7; // 交友
                  break;
                case 385:
                  index = 8; // 户外
                  break;
                default:
                  index = 0;
                  break;
              }
              bus.emit('jumpTo', index);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              height: 22.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(11.0)
              ),
              child: Center(
                child: Text(
                  data.topicName,
                  style: TextStyle(
                    fontSize: 12.0,
                    height: 1.0,
                    color: Color.fromARGB(255, 153, 153, 153)
                  ),
                ),
              ),
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
        ],
      ),
    );
  }
}