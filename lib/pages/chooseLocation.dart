import 'package:flutter/material.dart';

import '../services/worldTime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> worldTimes = [
    WorldTime(location: 'Accra', url: 'Africa/Accra', flag: 'india.png'),
    WorldTime(location: 'New York', url: 'America/New_York', flag: 'usa.png'),
    WorldTime(location: 'Tokyo', url: 'Asia/Tokyo', flag: 'japan.png'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'uk.png'),
    WorldTime(
        location: 'Sydney', url: 'Australia/Sydney', flag: 'australia.png'),
    WorldTime(location: 'Paris', url: 'Europe/Paris', flag: 'france.png'),
    WorldTime(location: 'Moscow', url: 'Europe/Moscow', flag: 'russia.png'),
    WorldTime(location: 'Beijing', url: 'Asia/Shanghai', flag: 'china.png'),
    WorldTime(
        location: 'Rio de Janeiro',
        url: 'America/Sao_Paulo',
        flag: 'brazil.png'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    // Add more WorldTime instances as needed
  ];

  void updateTime(index) async {
    WorldTime instance = worldTimes[index];
    await instance.getTimeData();
    String time = await instance.getTimeData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
      ),
      body: ListView.builder(
          itemCount: worldTimes.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: Text(worldTimes[index].location!),
              onTap: () => updateTime(index),
            ));
          }),
    );
  }
}
