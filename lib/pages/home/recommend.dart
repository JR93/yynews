import 'package:flutter/material.dart';
import 'package:yynews/model/news_data.dart';
import 'package:yynews/model/api.dart';
import 'dart:convert';

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => new _RecommendState();
}

class _RecommendState extends State<Recommend> {
  final int pageSize = 10;
  int offset = 0;
  List data = [];
  Future<List<Data>> futureInstance;
  
  @override
  void initState() {
    super.initState();
    futureInstance = _loadData();
  }

  Future<List<Data>> _loadData() async {
    Map<String, dynamic> res = await Api.get(Api.RECOMMEND, params: {
      "appId": "1004",
      "data": jsonEncode({
        "offset": offset,
        "pageSize": pageSize
      })
    });
    NewsData newsData = NewsData.fromJson(res['data']);
    return newsData.result.retData.data??<Data>[];
  }

  Future refresh() async {
    setState(() {
      futureInstance = _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
      future: futureInstance,
      builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 255, 221, 0)),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR"),
            );
          } else if (snapshot.hasData) {
            List<Data> list = snapshot.data;
            return RefreshIndicator(
              // color: Color.fromARGB(255, 255, 221, 0),
              child: buildListView(context, list),
              onRefresh: refresh
            );
          }
        }
      },
    );
  }

  Widget buildListView(BuildContext context, List<Data> list) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244)
      ),
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          Data item = list[index];
          return Container(
            margin: const EdgeInsets.only(top: 5.0),
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 76.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(
                            color: Color.fromARGB(255, 29, 29, 29),
                            fontSize: 11.0
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textScaleFactor: 1.5,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(right: 5.0),
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 245, 245, 245),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: NetworkImage(item.anchorLogo),
                                    radius: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      item.anchorName,
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
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 245, 245, 245),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text(
                                item.topicName,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromARGB(255, 153, 153, 153)
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.remove_red_eye, color: Color.fromARGB(160, 153, 153, 153), size: 12.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text(
                                      '${item.readCount}',
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
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 118.0,
                  height: 86.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: Image.network(item.cover[0], width: 118.0, height: 86.0, fit: BoxFit.cover),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}