import 'package:flutter/material.dart';

Widget progressIndicatorWidget(BuildContext context, {String text = ''}) {
  return Center(
    child: Container(
      color: text.isNotEmpty ? const Color(0xFFE0E0E0) : Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          const CircularProgressIndicator(
            backgroundColor: Color(0xFFf5f5f6),
          ),
          text.isNotEmpty
              ? Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    Text('   $text   ',
                        style: Theme.of(context).textTheme.body2),
                    const SizedBox(height: 10),
                  ],
                )
              : Container(),
        ],
      ),
    ),
  );
}
