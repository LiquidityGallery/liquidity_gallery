import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons(
      {Key? key,
      required this.children,
      this.initValue,
      required this.onChanged})
      : super(key: key);

  final List<String> children;

  final String? initValue;

  final void Function(String result) onChanged;

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initValue;
  }

  Widget _button(bool isSelected, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: () {
          setState(() => _selected = value);
          widget.onChanged(value);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.blue : Colors.grey),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            '#$value',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Wrap(
          children: widget.children
              .map((string) => _button(_selected == string, string))
              .toList(),
        );
      } else {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 50,
            child: Row(
                children: widget.children
                    .map((string) => _button(_selected == string, string))
                    .toList()),
          ),
        );
      }
    });
  }
}
