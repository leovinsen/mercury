import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  final String text;

  const SimpleAlertDialog({Key key, @required this.text})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
      content: Text(text),
    );
  }
}
