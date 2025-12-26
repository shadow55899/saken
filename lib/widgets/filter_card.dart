import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const FilterCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.teal,
    required this.onTap, 
    required String subtitle, 
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: screen.width.clamp(22.0, 36.0),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: screen.width.clamp(15.0, 22.0),
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}