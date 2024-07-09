import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Pesquisa',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
