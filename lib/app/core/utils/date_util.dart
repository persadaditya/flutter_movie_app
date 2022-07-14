import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateUtil{

  static String dateServerToTrailerFormat(String? serverTime){

    if(serverTime == null){
      return "N/A";
    }

    var dateTimes = serverTime.split('T');
    var date = dateTimes[0];
    var dates = date.split('-');
    var year = int.tryParse(dates[0]) ?? 2000;
    var month = int.tryParse(dates[1]) ?? 1;
    var day = int.tryParse(dates[2])  ?? 1;

    var timeZones = dateTimes[0].split('.');
    var time = timeZones[0];

    DateTime dateTime = DateTime(year, month, day);

    return DateFormat.yMMMMd('en_US').format(dateTime);

  }
}