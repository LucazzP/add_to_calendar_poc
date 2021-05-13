import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';

class Add2CalendarPage extends StatefulWidget {
  Add2CalendarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Add2CalendarPageState createState() => _Add2CalendarPageState();
}

class _Add2CalendarPageState extends State<Add2CalendarPage> {
  var result = 'Click to add an event';

  Future<void> _addEvent() async {
    setState(() {
      this.result = 'Loading...';
    });
    final now = DateTime.now();
    final event = Event(
      title: 'Ver apartamento',
      description: 'Olhar o partamento marcado com o QuintoAndar Cod: #123',
      startDate: now,
      endDate: now.add(Duration(hours: 1)),
      location: "Quinto Andar",
    );
    final result = await Add2Calendar.addEvent2Cal(event);
    setState(() {
      this.result = result.toString();
    });
  }

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
            Text(
              'Result of add the event:',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(result),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
