import 'package:flutter/material.dart';

import 'main.dart';

class Indicatiors extends StatelessWidget {
  const Indicatiors({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...List.generate(data.length, (index) {
        final isSelected = selectedIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isSelected ? 20 : 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
              color: isSelected ? Colors.grey.shade500 : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20)),
        );
      })
    ]);
  }
}
