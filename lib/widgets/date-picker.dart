import 'package:flutter/material.dart';

class DatePickerRow extends StatefulWidget {
  final ValueChanged<DateTime?> onDateSelected;

  const DatePickerRow({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  _DatePickerRowState createState() => _DatePickerRowState();
}

class _DatePickerRowState extends State<DatePickerRow> {
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  final List<int> _days = List.generate(31, (i) => i + 1);
  final List<int> _months = List.generate(12, (i) => i + 1);
  final List<int> _years = List.generate(100, (i) => DateTime.now().year - i);

  void _updateDate() {
    if (_selectedDay != null && _selectedMonth != null && _selectedYear != null) {
      widget.onDateSelected(DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
    } else {
      widget.onDateSelected(null);
    }
  }

  DropdownButton<int> buildDropdown({
    required String label,
    required int? value,
    required List<int> items,
    required ValueChanged<int?> onChanged,
  }) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final textColor = isLight ? Colors.black : Colors.white;
    final dropdownColor = isLight ? Colors.grey[200] : Colors.grey[800];

    return DropdownButton<int>(
      value: value,
      hint: Text(label, style: TextStyle(color: textColor)),
      dropdownColor: dropdownColor,
      iconEnabledColor: textColor,
      underline: Container(height: 1, color: textColor),
      items: items.map((item) {
        return DropdownMenuItem<int>(
          value: item,
          child: Text(item.toString(), style: TextStyle(color: textColor)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildDropdown(
            label: "Day",
            value: _selectedDay,
            items: _days,
            onChanged: (val) {
              setState(() => _selectedDay = val);
              _updateDate();
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: buildDropdown(
            label: "Month",
            value: _selectedMonth,
            items: _months,
            onChanged: (val) {
              setState(() => _selectedMonth = val);
              _updateDate();
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: buildDropdown(
            label: "Year",
            value: _selectedYear,
            items: _years,
            onChanged: (val) {
              setState(() => _selectedYear = val);
              _updateDate();
            },
          ),
        ),
      ],
    );
  }
}
