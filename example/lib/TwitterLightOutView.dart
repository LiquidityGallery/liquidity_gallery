import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class TwitterLightsOutView extends StatefulWidget {
  const TwitterLightsOutView({super.key});

  @override
  _TwitterLightsOutViewState createState() => _TwitterLightsOutViewState();
}

class _TwitterLightsOutViewState extends State<TwitterLightsOutView> {
  int _currentIndex = 0;

  Widget get _body =>
      _currentIndex == 0 ? _TwitterLightsOutView() : _SettingsView();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: twitterDarkTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: _MyDrawer(),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings')
          ],
          currentIndex: _currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class _TwitterLightsOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            '他們所有得設備和儀器彷彿都是有生命的\nAlmost before we knew it, we had left the ground.\n\nThis is custom home page',
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showMessage(context, 'You can close this message',
                  () => print('User taped the button'), 'tap to close');
            },
            child: const Text('Show message')),
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(value: 'OPEN', child: Text('OPEN')),
            DropdownMenuItem(value: 'CLOSE', child: Text('CLOSE')),
            DropdownMenuItem(value: 'UNDEFINED', child: Text('UNDEFINED'))
          ],
          onChanged: (e) {},
        )
      ],
    );
  }
}

class _SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This is Custom page'),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(17, 19, 22, 1),
        child: Column(
          children: [
            _Header(),
            Expanded(
                child: ListView(
              children: [
                // _DrawerItem(title: 'Home', icon: Icons.home_outlined, onTap: () {
                //   Navigator.popUntil(context, ModalRoute.withName('/'));
                // },),
                _DrawerItem(
                  title: 'Items',
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {},
                ),
                const _DrawerItem(
                  title: 'Workshop',
                  icon: Icons.home_work_outlined,
                ),
                const _DrawerItem(
                  title: 'Merchant',
                  icon: Icons.bookmark_border,
                ),
                const _DrawerItem(
                  title: 'Report',
                  icon: Icons.list_alt_outlined,
                ),
                const Divider(),
                const _DrawerItem(title: 'Settings')
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.account_circle,
                size: 50,
                color: Color.fromRGBO(205, 213, 219, 1),
              )),
          Text(
            'Tony',
            style: TextStyle(color: Color.fromRGBO(193, 193, 193, 1)),
          ),
          Text(
            '@68439181',
            style: TextStyle(color: Color.fromRGBO(136, 153, 166, 1)),
          )
        ],
      ),
    );
  }
}

//TODO: Apply selected color
class _DrawerItem extends StatelessWidget {
  const _DrawerItem({Key? key, required this.title, this.icon, this.onTap})
      : super(key: key);
  final String title;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(),
        child: ListTile(
          selected: true,
          selectedTileColor: const Color.fromRGBO(34, 34, 34, 1),
          leading: icon != null
              ? Icon(
                  icon,
                  size: 23,
                  color: const Color.fromRGBO(106, 106, 106, 1),
                )
              : null,
          title: Text(
            title,
            style: const TextStyle(color: Color.fromRGBO(193, 193, 193, 1)),
          ),
          onTap: onTap,
        ));
  }
}
