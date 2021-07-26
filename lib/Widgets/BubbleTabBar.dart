
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class BubbleTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;


  BubbleTabBar({Key? key,required this.tabs,required this.children}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}


///Tabs ---> Tab(text: " "),
class HomeWidgetState extends State<BubbleTabBar>
    with SingleTickerProviderStateMixin {
  late List<Tab> tabs;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    tabs = widget.tabs;
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //?/ Detect if dark mode is active
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: new TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BubbleTabIndicator(
            indicatorHeight: 25.0,
            indicatorColor: darkModeOn ==false ?Colors.redAccent[100]! :Colors.tealAccent[700]!,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            // Other flags
            // indicatorRadius: 1,
            // insets: EdgeInsets.all(1),
            // padding: EdgeInsets.all(10)
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: widget.children!,
      ),
    );
  }
}