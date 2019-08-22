import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    Key key,
    @required this.text,
    this.onTap,
    this.color,
    this.style,
    this.width,
    this.errorMessage = 'Unable to perform operation...',
  }) : super(key: key);

  final String text, errorMessage;
  final Function onTap;
  final Color color;
  final TextStyle style;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption,
        textAlign: TextAlign.center,
      ),
      onTap: onTap ??
          () {
            final SnackBar snackBar = SnackBar(
              content: Text(errorMessage),
              duration: const Duration(seconds: 2),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
    );
  }
}
