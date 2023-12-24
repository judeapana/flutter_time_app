import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   dynamic data={};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context)?.settings.arguments;
    Color color = data['isDayTime'] ? Colors.blue : Colors.black;
    AssetImage image = data['isDayTime']
        ? const AssetImage('assets/daytime.jpg')
        : const AssetImage('assets/nighttime.jpg');
    print(data);
    return SafeArea(
        child: Scaffold(
      backgroundColor: color,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  dynamic results =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': results['location'],
                      'flag': results['flag'],
                      'time': results['time'],
                      'isDayTime': results['isDayTime']
                    };
                  });
                },
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              data['location'],
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            Text(
              data['time'],
              style: TextStyle(fontSize: 0, color: Colors.white),
            )
          ]),
        ),
      ),
    ));
  }
}
