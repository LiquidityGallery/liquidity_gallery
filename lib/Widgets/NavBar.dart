import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

///The number of widget and tab names should be equal
class NavBar extends StatefulWidget {
  final List<Widget> children;
  final List<BottomNavigationBarItem> items;
  final num NumOfItem;
  final Color? color;
  final double unselectedFontSize;
  final double selectedFontSize;

  const NavBar(
      {Key? key,
      required this.NumOfItem,
      required this.children,
      required this.items,
      this.color,
      this.unselectedFontSize = 12,
      this.selectedFontSize = 14})
      : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = widget.children;
  }

  void _onItemTapped(int index) {
    if (index == widget.NumOfItem) {
      showModal(context, Container());
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: widget.color ?? Colors.cyan[800],
        items: widget.items,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: widget.selectedFontSize,
        unselectedFontSize: widget.unselectedFontSize,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
