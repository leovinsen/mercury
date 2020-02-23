import 'package:intl/intl.dart';

extension DateFormatExt on DateTime {
  String toPrettyDDMMYYYY(){
    return DateFormat("d MMMM y |").add_jm().format(this);
  }
}