import 'package:flutter/material.dart';

class NewsSourceAvatar extends StatelessWidget {
  final Widget avatar;
  const NewsSourceAvatar({Key key, @required this.avatar})
      : assert(avatar != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      child: avatar,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
    );
  }
}
