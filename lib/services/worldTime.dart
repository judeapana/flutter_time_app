import "dart:convert";

import "package:http/http.dart";
import "package:intl/intl.dart";

class WorldTime {
  String? flag;
  String? location;
  String? url;
  bool? isDayTime;

  WorldTime({required this.location, required this.url, required this.flag});

  Future<String> getTimeData() async {
    Uri uri = Uri.http("worldtimeapi.org", "/api/timezone/$url");
    Response response = await get(uri);
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_datetime'];
    DateTime dt = DateTime.parse(datetime);
    // print(dt);
    dt.add(Duration(
        hours: int.parse(offset.substring(1, 3)),
        minutes: int.parse(offset.substring(4, 6))));
    isDayTime = dt.hour > 6 || 20 < dt.hour;
    // var time = DateFormat.jm().format();
    return datetime;
  }
}
