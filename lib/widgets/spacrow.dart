import 'package:flutter/material.dart';

class SpecRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final Widget? val;

  const SpecRow({
    required this.icon,
    required this.title,
    this.value,
    this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),

        Expanded(
          flex: 3,
          child: val != null
              ? val! 
              : Text(
                  value ?? '', 
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
       
      ],
    );
  }
}