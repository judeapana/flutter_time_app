import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/worldTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String appState = "Loading.";

  void action() async {
    WorldTime worldTime =
        WorldTime(location: 'Accra', url: 'Africa/Accra', flag: "india.png");
    String time = await worldTime.getTimeData();
    print(worldTime.isDayTime);
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    action();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFadingGrid(
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
