import 'package:flutter/material.dart';

class FilterButton {
  final String name;
  FilterButton({required this.name});
}

class FilterButtonTile extends StatelessWidget {
  final ValueNotifier<int> isSelectedNotifier;

  const FilterButtonTile({super.key, required this.isSelectedNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: isSelectedNotifier,
      builder: (context, isSelected, _) {
        return ToggleButtons(
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          fillColor: Colors.transparent,
          selectedColor: Color.fromARGB(255, 5, 12, 112),
          borderWidth: 2,
          onPressed: (int newIndex) {
            isSelectedNotifier.value = newIndex;
          },
          isSelected: List.generate(filterList.length, (index) => index == isSelected),
          children: filterList.map(
            (e) {
              final title = e.name;
              return SizedBox(
                width: 80,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

List<FilterButton> filterList = [
  FilterButton(
    name: 'Food',
  ),
  FilterButton(
    name: 'Protein',
  ),
  FilterButton(
    name: 'Swallow',
  ),
  FilterButton(
    name: 'Soups',
  ),
  FilterButton(
    name: 'Drinks',
  ),
  FilterButton(
    name: 'Fried',
  ),
];
