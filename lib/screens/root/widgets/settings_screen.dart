import 'package:flutter/material.dart';
import 'package:mercury/global.dart';
import 'package:mercury/database/article_dao.dart';

class SettingsScreen extends StatelessWidget {
  static const appBarTitle = "Settings";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: ListTile(
              title: Text('Clear all favorited articles'),
              onTap: () => _showDeleteConfirmationDialog(context),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
            'Clear all your favorited articles? This action cannot be undone.',
            style: Theme.of(context).textTheme.body1),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('NO', style: Theme.of(context).textTheme.body1),
          ),
          FlatButton(
            onPressed: () {
              _deleteSavedArticles(context);
              Navigator.of(context).pop();
            },
            child: Text(
              'YES',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      ),
    );
  }

  void _deleteSavedArticles(BuildContext context) async {
    await sl.get<ArticleDao>().deleteAll();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully cleared all favorited articles.'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
