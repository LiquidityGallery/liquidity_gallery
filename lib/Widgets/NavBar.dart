



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';




///The number of widget and tab names should be equal
class NavBar extends StatefulWidget {
final List<Widget> children;
final List<BottomNavigationBarItem> items;
final num NumOfItem;
final Color? color;

NavBar({Key? key,required this.NumOfItem,required this.children, required this.items, this.color}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();


}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late List<Widget> _widgetOptions ;

  @override
  void initState() {
    super.initState();
    _widgetOptions= widget.children;
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
        backgroundColor: widget.color== null ? Colors.cyan[800] : widget.color,
        items: widget.items,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}