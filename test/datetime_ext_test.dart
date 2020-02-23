import 'package:flutter_test/flutter_test.dart';
import 'package:news_reader/main.dart';

import 'package:news_reader/extensions/datetime_ext.dart' show DateFormatExt;

void main(){

  Main();

  test('Testing DateFormat extension method', () {
    DateTime d = DateTime(2020, 1, 1, 17, 30);
    var formattedDate = d.toPrettyDDMMYYYY();
    expect(formattedDate, "1 January 2020 | 5:30 PM");
  } );
}