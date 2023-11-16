import 'package:flutter/material.dart';

class LiquidityAutoComplete<T extends Object> extends StatelessWidget {
  const LiquidityAutoComplete(
      {super.key,
      required this.focusNode,
      required this.optionsBuilder,
      required this.onSelected,
      this.inputDecoration,
      required this.child,
      required this.controller,
      this.validator,
      this.color});

  /// Get output options
  final Iterable<T> Function(TextEditingValue) optionsBuilder;

  /// Need to replace the TextEditingController's text,
  /// e.g. _controller.text = user.name
  final void Function(T) onSelected;

  /// InputDecoration of the input field
  final InputDecoration? inputDecoration;

  /// Widget of the suggestion field ListView item
  final Widget Function(T) child;

  final FocusNode focusNode;
  final TextEditingController controller;

  /// Background color of the suggestion list
  final Color? color;

  /// TextFormField validator of the input field
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      textEditingController: controller,
      focusNode: FocusNode(),
      optionsBuilder: optionsBuilder,
      onSelected: onSelected,
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
            controller: textEditingController,
            decoration: inputDecoration,
            focusNode: focusNode,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
            validator: validator);
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<T> onSelected, Iterable<T> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: color,
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final T option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: child(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
