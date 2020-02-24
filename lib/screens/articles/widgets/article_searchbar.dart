import 'package:flutter/material.dart';

class ArticleSearchBar extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onTextChanged;

  const ArticleSearchBar(
      {Key key, @required this.textController, @required this.onTextChanged})
      : assert(textController != null),
        assert(onTextChanged != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Search by article title',
      ),
      controller: textController,
      onChanged: onTextChanged,
    );
  }
}
