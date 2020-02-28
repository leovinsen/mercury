import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final int tileIndex;
  final int chosenIndex;
  final IconData iconData;
  final String tileName;
  final VoidCallback onTap;

  const DrawerTile(
      {Key key,
      @required this.tileIndex,
      @required this.chosenIndex,
      @required this.iconData,
      @required this.tileName,
      this.onTap})
      : assert(tileIndex != null),
        assert(chosenIndex != null),
        assert(iconData != null),
        assert(tileName != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: chosenIndex != tileIndex ? Colors.transparent : Color(0xFFEAEAEA),
      ///Not using [ListTile] onTap because I prefer the splash effect from [InkWell]
      child: InkWell(
        onTap: onTap,
        child: ListTile(
            leading: Icon(
              iconData,
              color: Colors.black54,
            ),
            title: Text(tileName)),
      ),
    );
  }
}
