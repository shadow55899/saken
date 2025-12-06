import 'package:flutter/material.dart';

class DatePickerRow extends StatefulWidget {
  final ValueChanged<DateTime?> onDateSelected;

  const DatePickerRow({Key? key, required this.onDateSelected})
    : super(key: key);

  @override
  _DatePickerRowState createState() => _DatePickerRowState();
}

class _DatePickerRowState extends State<DatePickerRow> {
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  final List<int> _days = List.generate(31, (i) => i + 1);
  final List<int> _months = List.generate(12, (i) => i + 1);

  // 👇 Generate years reversed (latest first)
  final List<int> _years = List.generate(100, (i) => DateTime.now().year - i);

  void _updateDate() {
    if (_selectedDay != null &&
        _selectedMonth != null &&
        _selectedYear != null) {
      widget.onDateSelected(
        DateTime(_selectedYear!, _selectedMonth!, _selectedDay!),
      );
    } else {
      widget.onDateSelected(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<int>(
          hint: Text(
            "Day",
            style: Theme.of(context).brightness == Brightness.dark
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black),
          ),
          value: _selectedDay,
          items: _days
              .map(
                (d) => DropdownMenuItem(
                  value: d,
                  child: Text(
                    "$d",
                    style: Theme.of(context).brightness == Brightness.dark
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {
            setState(() => _selectedDay = val);
            _updateDate();
          },
        ),
        DropdownButton<int>(
          hint: Text(
            "Month",
            style: Theme.of(context).brightness == Brightness.dark
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black),
          ),
          value: _selectedMonth,
          items: _months
              .map(
                (m) => DropdownMenuItem(
                  value: m,
                  child: Text(
                    "$m",
                    style: Theme.of(context).brightness == Brightness.dark
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {
            setState(() => _selectedMonth = val);
            _updateDate();
          },
        ),
        DropdownButton<int>(
          hint: Text(
            "Year",
            style: Theme.of(context).brightness == Brightness.dark
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black),
          ),
          value: _selectedYear,
          items: _years
              .map(
                (y) => DropdownMenuItem(
                  value: y,
                  child: Text(
                    "$y",
                    style: Theme.of(context).brightness == Brightness.dark
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {
            setState(() => _selectedYear = val);
            _updateDate();
          },
        ),
      ],
    );
  }
}
