import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';

class SelectCalendarBottomSheet extends StatelessWidget {
  final List<Calendar> calendars;

  const SelectCalendarBottomSheet({
    Key key,
    this.calendars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAlias,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final calendar = calendars[index];
              return ListTile(
                title: Text(calendar.name),
                onTap: () => Navigator.of(context).pop(calendar),
                tileColor: index.isOdd ? Colors.transparent : Colors.grey[200],
              );
            },
            itemCount: calendars.length,
          ),
        );
      },
    );
  }
}
