import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    @required this.title,
    this.onPressed,
    this.color,
    this.style,
    this.width,
    this.errorMessage = 'Unable to perform operation...',
  }) : super(key: key);

  final String title, errorMessage;
  final Function onPressed;
  final Color color;
  final TextStyle style;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width ?? 325,
      height: 50,
      child: RaisedButton(
        color: color ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: onPressed ??
            () {
              final SnackBar snackBar = SnackBar(
                content: Text(errorMessage),
                duration: const Duration(seconds: 2),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
        child: Text(title, style: style),
      ),
    );
  }
}
