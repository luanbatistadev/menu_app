import 'package:flutter/material.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/components/search_bar.dart';
import 'package:menu_app/loading/loading_search_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ValueNotifier<String> filterNotifier = ValueNotifier<String>('');
  // ignore: unused_field
  late bool _isLoading;
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return _isLoading
        ? LoadingSearchPage()
        : SafeArea(
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

  @override
  void dispose() {
    super.dispose();
  }
}
