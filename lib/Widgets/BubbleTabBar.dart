import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class BubbleTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? indicatorColor;
  final double tabHeight;
  final Color? unselectedLabalColor;

  const BubbleTabBar(
      {super.key,
      required this.tabs,
      required this.children,
      this.backgroundColor,
      this.labelColor,
      this.indicatorColor,
      this.unselectedLabalColor,
      this.tabHeight = 40});

  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

///The number of widget and tab names should be equal
///Tabs ---> Tab(text: " "),
class HomeWidgetState extends State<BubbleTabBar>
    with SingleTickerProviderStateMixin {
  late List<Tab> tabs;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    tabs = widget.tabs;
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //?/ Detect if dark mode is active
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool darkModeOn = brightness == Brightness.dark;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: widget.tabHeight,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: widget.unselectedLabalColor ?? Colors.grey,
              labelColor:
                  widget.labelColor ?? Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BubbleTabIndicator(
                indicatorHeight: 25.0,
                indicatorColor: widget.indicatorColor == null
                    ? Colors.tealAccent[700]!
                    : widget.indicatorColor!,
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
          Expanded(
            flex: 9,
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: widget.children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
