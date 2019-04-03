import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:yynews/model/topic_data.dart';
import 'package:yynews/model/api.dart';
import 'package:yynews/pages/common/loading.dart';
import 'package:yynews/pages/common/news_item.dart';
import 'package:yynews/pages/common/topic_item.dart';
import 'package:yynews/pages/common/web_page.dart';

class Topic extends StatefulWidget {
  Topic({Key key, @required this.id}) : super(key: key);

  final int id;

  @override
  _TopicState createState() => new _TopicState();
}

class _TopicState extends State<Topic> with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController(); // 滚动监听
  List<Data> lists = []; // 存储列表数据
  final int pageSize = 10;
  int offset = 0;
  int systemTime;
  bool isLoading = true; // 是否加载中
  bool isComplete = false; // 是否加载完了

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 初始化加载
    _loadMoreData();
    // 监听滚动到底部加载
    _scrollController.addListener((){
      if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 30) {
        if (!isComplete && !isLoading) {
          _loadMoreData();
        }
      }
    });
  }

  @override
  void dispose() {
    // 销毁，避免内存泄漏
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Data>> _loadData() async {
    print('当前索引位置：$offset');
    Map<String, dynamic> res = await Api.get(Api.TOPIC, params: {
      "appId": "1004",
      "data": jsonEncode({
        "tabId": widget.id,
        "offset": offset,
        "pageSize": pageSize
      })
    });
    TopicData newsData = TopicData.fromJson(res['data']);
    setState(() {
      systemTime = newsData.result.retData.extend.systemTime;
    });
    return newsData.result.retData.data??<Data>[];
  }

  void _loadMoreData() async {
    setState(() {
      isLoading = true;
    });
    List<Data> data = await _loadData();
    if (!mounted) {
      return;
    }
    print('长度：${data.length}');
    // 有数据
    if (data.length > 0) {
      // 有下页
      if (data.length >= 10) {
        setState(() {
          offset += pageSize;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          isComplete = true;
        });
      }
      setState(() {
        lists.addAll(data);
      });
    } else {
      // over
      setState(() {
        isLoading = false;
        isComplete = true;
      });
    }
    print('总长度：${lists.length}');
  }

  Future _refresh() async {
    setState(() {
      isComplete = false;
      offset = 0;
      lists.clear();
    });
    _loadMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: lists.length > 0 ?
        _buildListView(context, lists, systemTime) :
        Container(
          child: (isComplete && offset == 0) ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      isComplete = false;
                    });
                    _loadMoreData();
                  },
                  child: Text('点击刷新'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text('暂无数据~', style: TextStyle(color: Colors.grey),),
                ),
              ],
            ) :
            Center(
              child: CircularProgressIndicator(),
            ),
        ),
    );
  }

  Widget _buildListView(BuildContext context, List<Data> lists, int systemTime) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244)
      ),
      child: ListView.builder(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: lists.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == lists.length) {
            // 用于展示加载loading或者完成提示
            if (isComplete) {
              return LoadingCompleteIndicator();
            } else {
              return LoadingIndicator(isLoading: isLoading);
            }
          } else {
            Data item = lists[index];
            return Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.all(5.0),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return WebPage(
                        url: 'https://web.yy.com/myue/article.html?aid=${item.messageId}',
                      ); // 跳转详情页
                    }
                  ));
                },
                child:
                  item.messageType == 1 ?
                  _listViewStyle1(item, systemTime) :
                  item.messageType == 2 ?
                  _listViewStyle2(item, systemTime) :
                  _listViewStyle3(item, systemTime),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _listViewStyle1(Data item, int systemTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 84.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NewsTitle(
                  title: item.title,
                  maxLines: 2,
                ),
                TopicInfo(data: item, systemTime: systemTime),
              ],
            ),
          ),
        ),
        NewsCover(cover: item.cover[0])
      ],
    );
  }

  Widget _listViewStyle2(Data item, int systemTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NewsTitle(
            title: item.title,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: item.cover.map((cover) => NewsCover(cover: cover)).toList()
            ),
          ),
          TopicInfo(data: item, systemTime: systemTime),
        ],
      ),
    );
  }

  Widget _listViewStyle3(Data item, int systemTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NewsTitle(
            title: item.title,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                NewsCover(
                  cover: item.cover[0],
                  width: 404.0,
                  height: 227.0,
                ),
                Container(
                  width: 74.0,
                  height: 74.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    borderRadius: BorderRadius.all(Radius.circular(37.0))
                  ),
                ),
                Icon(Icons.play_arrow, color: Color.fromARGB(255, 255, 221, 0), size: 42.0,)
              ],
            ),
          ),
          TopicInfo(data: item, systemTime: systemTime),
        ],
      ),
    );
  }
}