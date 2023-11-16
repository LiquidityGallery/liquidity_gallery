import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Area {
  ITEM,
  MERCHANT,
  REPORT,
}

class Access {
  Area area;
  int level;

  Access({required this.area, required this.level});

  factory Access.fromJson(Map<String, dynamic> data) {
    return Access(area: Area.values[data['area']], level: data['level']);
  }
}

class User {
  String id;
  String name;
  List<Access> accesses;

  User({required this.id, required this.name, required this.accesses});

  bool canAccess(Area area) {
    return accesses.any((access) => access.area == area);
  }

  int accessLevel(Area area) {
    return accesses.firstWhere((element) => element.area == area).level;
  }

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        id: data['id'],
        name: data['name'],
        accesses: List<Map<String, dynamic>>.from(data['accesses'] ?? {})
            .map((e) => Access.fromJson(e))
            .toList());
  }
}

List<Map<String, dynamic>> userDocuments = [
  {
    'id': '01',
    'name': 'user 01',
    'accesses': [
      {
        'area': 0,
        'level': 99,
      },
      {
        'area': 1,
        'level': 1,
      },
      {'area': 2, 'level': 3}
    ]
  },
  {
    'id': '02',
    'name': 'user 02',
    'accesses': [
      {
        'area': 0,
        'level': 2,
      },
    ]
  },
  {'id': '03', 'name': 'user 03', 'accesses': []}
];

class AccessView extends StatefulWidget {
  const AccessView({super.key});

  @override
  _AccessViewState createState() => _AccessViewState();
}

class _AccessViewState extends State<AccessView> {
  late List<User> users;
  late User currentUser;

  @override
  void initState() {
    super.initState();
    users = userDocuments.map((e) => User.fromJson(e)).toList();
    currentUser = users.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access'),
      ),
      body: ListView(
        children: [
          Text('Current logged in as ${currentUser.name}'),
          Text(
              'You can access ${currentUser.accesses.fold<String>('', (previousValue, element) => '$previousValue${describeEnum(element.area)}(${element.level}) ')}'),
          ListTile(
            title: const Text('Change user'),
            onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => _SelectUserView(
                              users: users,
                            )))
                .then((value) => setState(() => currentUser = value)),
          ),
          ListTile(
            title: const Text('Item'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RightView(user: currentUser))),
          )
        ],
      ),
    );
  }
}

class RightView extends StatelessWidget {
  const RightView({super.key, required this.user});

  final User user;

  final Area area = Area.ITEM;

  @override
  Widget build(BuildContext context) {
    if (user.canAccess(area)) {
      return _build();
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('You do have the access right'),
        ),
      );
    }
  }

  Widget _build() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item'),
      ),
      body: ListView(
        children: [
          AccessListTile(
            userLevel: user.accessLevel(area),
            level: 1,
            child: const ListTile(
              title: Text('If you can see this, you have access right level 1'),
            ),
          ),
          AccessListTile(
            userLevel: user.accessLevel(area),
            level: 2,
            child: const ListTile(
              title: Text('If you can see this, you have access right level 2'),
            ),
          ),
          AccessListTile(
            userLevel: user.accessLevel(area),
            level: 3,
            child: const ListTile(
              title: Text('If you can see this, you have access right level 3'),
            ),
          ),
          AccessListTile(
            userLevel: user.accessLevel(area),
            level: 4,
            child: const ListTile(
              title: Text('If you can see this, you have access right level 4'),
            ),
          )
        ],
      ),
    );
  }
}

class _SelectUserView extends StatelessWidget {
  const _SelectUserView({required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select user'),
      ),
      body: ListView(
        children: users
            .map((e) => ListTile(
                  title: Text(e.name),
                  onTap: () => Navigator.pop(context, e),
                ))
            .toList(),
      ),
    );
  }
}

class AccessListTile extends StatelessWidget {
  const AccessListTile(
      {super.key,
      required this.level,
      required this.userLevel,
      required this.child});

  final int userLevel;
  final int level;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: userLevel >= level,
      child: child,
    );
  }
}
