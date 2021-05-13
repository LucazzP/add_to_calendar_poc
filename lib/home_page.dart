import 'package:add_event_calendar_poc/add_2_calendar.dart';
import 'package:add_event_calendar_poc/device_calendar.dart';
import 'package:flutter/material.dart';

import 'device_calendar_with_selector.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Add2CalendarPage(title: "Add2CalendarPage"),
              )),
              child: Text("add_2_calendar Plugin"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            FlatButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DeviceCalendarPage(title: "DeviceCalendarPage"),
              )),
              child: Text("device_calendar Plugin"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            FlatButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    DeviceCalendarWithSelectorPage(title: "DeviceCalendarPage with Selector"),
              )),
              child: Text("device_calendar With selector Plugin"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
