
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_card.dart';

class SelectGrid extends StatelessWidget {
  final String title;
  final List<String> options;
  final RxString selectedValue;
  final Function(String) onChanged;

  const SelectGrid({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${'filter_by'.tr} $title",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),


            Obx(() => Container(
              constraints: const BoxConstraints(maxWidth: 140, maxHeight: 28),
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                border: Border.all(color: Colors.teal, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                selectedValue.value.isEmpty
                    ? "${'no'.tr} $title ${'selected'.tr}"
                    : selectedValue.value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
          ],
        ),

        const SizedBox(height: 10),

        // 🔹 شبكة الفلاتر باستخدام FilterCard
        Expanded(
          child: GridView.builder(

            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              maxCrossAxisExtent: 400,
              childAspectRatio: 2.7,
              // 🔹 يجعل الكروت أفقية وأنحف
            ),
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return Obx(() {
                final isSelected = selectedValue.value == option;
                return Transform.scale(
                  scale: 0.9, // 👈 تصغير الكارد بنسبة 90% من حجمه الأصلي
                  child: FilterCard(
                    title: option,
                    subtitle: '',
                    icon: Icons.location_city,
                    color: isSelected ? Colors.teal : Colors.grey.shade300,
                    onTap: () => onChanged(option),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
