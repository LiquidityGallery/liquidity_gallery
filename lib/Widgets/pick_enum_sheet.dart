import 'package:flutter/material.dart';

Future<T?> showPickEnumSheet<T extends Enum>(
    BuildContext context, List<T> values) async {
  /// Show all values in enum and return value when tap.
  /// Usage:
  ///   item = (await showPickEnumSheet(context, Items.values) ?? item);

  final value = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: PickEnumSheet<T>(
                values: values,
              ),
            ),
          ));

  if (value != null) return value;
  return null;
}

class PickEnumSheet<T extends Enum> extends StatefulWidget {
  const PickEnumSheet({Key? key, required this.values}) : super(key: key);

  final List<T> values;

  @override
  State<PickEnumSheet<T>> createState() => _PickEnumSheetState<T>();
}

class _PickEnumSheetState<T extends Enum> extends State<PickEnumSheet<T>> {
  late final _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (input) => setState(() {}),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: const Icon(Icons.clear))),
          ),
          Expanded(
              child: ListView(
                  children: widget.values
                      .where((value) => value.name
                          .replaceAll(' ', '')
                          .toLowerCase()
                          .contains(_controller.text
                              .replaceAll(' ', '')
                              .toLowerCase()))
                      .map(
                        (value) => ListTile(
                          title: Center(
                            child: Text(value.name),
                          ),
                          onTap: () => Navigator.pop(context, value),
                        ),
                      )
                      .toList())),
          const Divider(),
          ListTile(
            title: const Center(
              child: Text('Cancel'),
            ),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    ));
  }
}
