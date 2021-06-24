import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconSize = 20.0,
      this.textStyle,
      required this.onChanged,
      this.initValue = false,
      this.activeColor,
      this.inactiveColor,
      this.padding,
      this.childPadding,
      this.heightBetween = 3})
      : super(key: key);

  final IconData icon;
  final double iconSize;
  final String text;

  /// Default to be primary color of theme and size of bodyText1's size
  final TextStyle? textStyle;

  final Function(bool) onChanged;

  final bool initValue;

  final Color? activeColor;
  final Color? inactiveColor;

  final EdgeInsets? padding;

  final EdgeInsets? childPadding;

  final double? heightBetween;

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _bool = false;

  @override
  void initState() {
    super.initState();
    _bool = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: _bool
                ? widget.activeColor ?? Theme.of(context).primaryColor
                : widget.inactiveColor ?? Theme.of(context).accentColor),
        onPressed: () {
          setState(() {
            _bool = !_bool;
          });
          widget.onChanged(_bool);
        },
        child: Padding(
          padding: widget.childPadding ??
              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: widget.iconSize,
              ),
              Container(
                height: widget.heightBetween,
              ),
              Text(
                widget.text,
                style: widget.textStyle ??
                    TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1?.fontSize ??
                                8.0,
                        color: Theme.of(context).textTheme.bodyText1?.color ??
                            Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
