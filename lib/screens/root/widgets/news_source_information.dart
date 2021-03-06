import 'package:flutter/material.dart';

class NewsSourceInformation extends StatelessWidget {
  final String sourceName;
  final String sourceDescription;

  const NewsSourceInformation(
      {Key key, @required this.sourceName, @required this.sourceDescription})
      : assert(sourceName != null),
        assert(sourceDescription != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(sourceName,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .apply(fontSizeFactor: 1.3)),
        SizedBox(
          height: 5.0,
        ),
        Flexible(
          child: Text(
            sourceDescription,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
