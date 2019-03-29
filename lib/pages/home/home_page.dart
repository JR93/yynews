import 'package:flutter/material.dart';
import './recommend.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Text> tabs = <Text>[
    Text('推荐'),
    Text('分类'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Recommend(),
          Center(child: Text('分类'),),
        ],
      ),
    );
  }
}