import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';

class DeviceCalendarPage extends StatefulWidget {
  DeviceCalendarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DeviceCalendarPageState createState() => _DeviceCalendarPageState();
}

class _DeviceCalendarPageState extends State<DeviceCalendarPage> {
  final _deviceCalendarPlugin = DeviceCalendarPlugin();
  var result = 'Click to add an event';

  void changeResult(String newResult) {
    setState(() {
      result = newResult;
    });
  }

  Future<void> _addEvent() async {
    changeResult('Loading...');
    final now = DateTime.now();
    final calendars = (await _deviceCalendarPlugin.retrieveCalendars()).data;
    if (calendars == null || calendars.isEmpty) {
      changeResult("Não há nenhum calendário no seu dispositivo");
      return;
    }
    final modifiablesCalendars = calendars.where((element) => !element.isReadOnly);
    if (modifiablesCalendars.isEmpty) {
      changeResult("Não há nenhum calendário desbloquado para alterar");
      return;
    }

    final selectedCalendar = modifiablesCalendars.firstWhere(
      (element) => element.name == "Calendar",
      orElse: () => modifiablesCalendars.first,
    );
    if (selectedCalendar == null) {
      changeResult("Você não selecionou um calendário");
      return;
    }

    final event = Event(
      selectedCalendar.id,
      title: 'Ver apartamento',
      description: 'Olhar o partamento marcado com o QuintoAndar Cod: #123',
      start: now,
      end: now.add(Duration(hours: 1)),
    );

    final result = await _deviceCalendarPlugin.createOrUpdateEvent(event);

    setState(() {
      this.result = result.data.toString();
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
