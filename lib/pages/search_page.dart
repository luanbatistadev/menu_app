import 'package:flutter/material.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/components/search_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final ValueNotifier<String> filterNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SearchBarComponent(
            filterNotifier: filterNotifier,
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: filterNotifier,
          builder: (context, filter, child) => screenSize < 480
              ? ListViewChicken(
                  filter: filter,
                )
              : GridViewChicken(
                  filter: filter,
                ),
        ),
      ),
    );
  }
}
