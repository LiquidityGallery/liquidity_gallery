import 'dart:io';

import 'package:flutter/material.dart';

Future<T> showSearchModal<T>(BuildContext context,
    {InputDecoration? inputDecoration,
    String? initText,
    required List<T> items,
    required String Function(T) itemAsString,
    required bool Function(T, String filter) filterFunction,
    bool? showCancelTextButton}) async {
  if (Platform.isIOS) {
    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return _SearchPage<T>(
              inputDecoration: inputDecoration,
              initText: initText ?? '',
              items: items,
              itemAsString: itemAsString,
              filterFunction: filterFunction,
              showCancelTextButton: showCancelTextButton ?? true);
        });
  } else {
    return await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return _SearchPage<T>(
              inputDecoration: inputDecoration,
              initText: initText ?? '',
              items: items,
              itemAsString: itemAsString,
              filterFunction: filterFunction,
              showCancelTextButton: showCancelTextButton ?? true);
        });
  }
}

class _SearchPage<T> extends StatefulWidget {
  const _SearchPage(
      {Key? key,
      this.inputDecoration,
      required this.initText,
      required this.items,
      required this.itemAsString,
      required this.filterFunction,
      required this.showCancelTextButton})
      : super(key: key);

  final InputDecoration? inputDecoration;

  final String initText;

  final List<T> items;

  final String Function(T item) itemAsString;

  final bool Function(T item, String filter) filterFunction;

  final bool showCancelTextButton;

  @override
  __SearchPageState<T> createState() => __SearchPageState<T>();
}

class __SearchPageState<T> extends State<_SearchPage<T>> {
  // List<String> _tempList = [
  //   'abc',
  //   'bcd',
  //   'cde',
  //   'def',
  //   'efg',
  // ];

  String _filter = '';
  final _filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filterController.text = widget.initText;
    _filter = widget.initText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 50,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.search),
          title: const Text('Search'),
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.cancel))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _filterController,
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (String filter) => Navigator.pop(
                          context,
                          widget.items
                              .where((item) =>
                                  widget.filterFunction(item, _filter))
                              .first),
                      decoration: widget.inputDecoration ??
                          const InputDecoration(
                            hintText: 'Search',
                          ),
                      onChanged: (String string) {
                        setState(() {
                          _filter = string;
                        });
                      },
                    ),
                  ),
                  widget.showCancelTextButton
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              _filterController.clear();
                              _filter = '';
                            });
                          },
                          child: const Text('Cancel'))
                      : Container()
                ],
              ),
              Expanded(
                  child: ListView(
                children: widget.items
                    .where((item) => widget.filterFunction(item, _filter))
                    .map((e) => ListTile(
                          title: Text(widget.itemAsString(e)),
                          onTap: () => Navigator.pop(context, e),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
