import 'package:flutter/material.dart';

class FilterButton {
  final String name;
  /*final bool isSelected;*/
  FilterButton({required this.name /*required this.isSelected*/});
}

class FilterButtonTile extends StatefulWidget {
  const FilterButtonTile({super.key});

  @override
  State<FilterButtonTile> createState() => _FilterButtonTileState();
}

class _FilterButtonTileState extends State<FilterButtonTile> {
  List<bool> isSelected = [true, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      fillColor: Colors.transparent,
      selectedColor: Color.fromARGB(255, 5, 12, 112),
      borderWidth: 2,
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
      isSelected: isSelected,
      children: const <Widget>[
        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Food",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Protein",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Swallow",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Soups",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Drinks",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Fried",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

List<FilterButton> filterList = [
  FilterButton(
    name: "Food",
  ),
  FilterButton(
    name: "Protein",
  ),
  FilterButton(
    name: "Swallow",
  ),
  FilterButton(
    name: "Soups",
  ),
  FilterButton(
    name: "Drinks",
  ),
  FilterButton(
    name: "Fried",
  ),
];
