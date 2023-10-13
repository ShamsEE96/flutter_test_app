import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class DateTimePickers {
  static Future<DateTime?> showIosTimePicker(
      BuildContext context, DateTime _selectedDate) {
    return showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime? _tempPickedDate;
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    cupertino.CupertinoButton(
                      child: Text('cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    cupertino.CupertinoButton(
                      child: Text('done'),
                      onPressed: () {
                        Navigator.of(context).pop(_tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: cupertino.CupertinoDatePicker(
                    onDateTimeChanged: (dateTime) {
                      _tempPickedDate = dateTime;
                    },
                    use24hFormat: true,
                    initialDateTime: _selectedDate,
                    mode: cupertino.CupertinoDatePickerMode.time,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<TimeOfDay?> showMaterialTimePicker(
      BuildContext context, TimeOfDay _selectedTime) {
    return showTimePicker(
        context: context,
        initialTime: _selectedTime,
        builder: (context, child) => Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.highContrastDark(
                  primary: AppColors.redColor,
                  secondary: AppColors.redColor,
                ),
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              child: child ?? Container(),
            ));
  }
}
