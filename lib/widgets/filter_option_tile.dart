import 'package:flutter/material.dart';

class FilterOptionTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final Widget? trailing;

  const FilterOptionTile({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color = Colors.red,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: (screen.width * 0.06).clamp(20.0, 30.0),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize:
              ((screen.width * 0.04) + (screen.width * 0.01)).clamp(14.0, 20.0),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}