import 'package:flutter/material.dart';
import 'package:yynews/event/bus.dart';
import 'package:yynews/pages/home/recommend.dart';
import 'package:yynews/pages/home/topic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Tab> tabs = <Tab>[
    Tab(text: '推荐'),
    Tab(text: '主播趣闻'),
    Tab(text: '神壕八卦'),
    Tab(text: '春季头条'),
    Tab(text: '周星盘点'),
    Tab(text: '公会动态'),
    Tab(text: '萌新求罩'),
    Tab(text: '交友'),
    Tab(text: '户外'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
    bus.on('jumpTo', (index) {
      _tabController.animateTo(index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(38.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: TabBar(
            controller: _tabController,
            tabs: tabs,
            isScrollable: true,
            indicatorColor: Color.fromARGB(255, 255, 221, 0),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Recommend(),
          Topic(id: 19),
          Topic(id: 152),
          Topic(id: 392),
          Topic(id: 349),
          Topic(id: 351),
          Topic(id: 21),
          Topic(id: 384),
          Topic(id: 385),
        ],
      ),
    );
  }
}