import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Searchbar for ios style
class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final Function(String)? onChanged;
  final Color? backgroundColor;
  final Widget? suffix;

  const SearchBar(
      {super.key,
      required this.controller,
      this.placeholder = 'Search',
      this.onChanged,
      this.backgroundColor,
      this.suffix});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 1),
      child: CupertinoTextField(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(11)),
        controller: widget.controller,
        onChanged: widget.onChanged,
        prefix: const Icon(
          Icons.search,
          color: CupertinoColors.systemGrey,
        ),
        placeholder: widget.placeholder,
        placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
        suffix: widget.suffix ?? Container(),
      ),
    );
  }
}
