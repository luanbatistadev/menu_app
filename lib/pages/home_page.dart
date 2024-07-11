import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/carousel_slider_home.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/components/search_bar.dart';
import 'package:menu_app/models/filter_tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<String> filterNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    filterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            toolbarHeight: 90,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            leadingWidth: double.infinity,
            leading: Column(
              children: [
                AppBarHome(),
                SearchBarComponent(
                  filterNotifier: filterNotifier,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: FilterTabView(tabController: _tabController),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: const [
                  SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15, left: 25),
                    child: Row(
                      children: [
                        Text(
                          'Conheça:',
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 12, 112),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: CarroselFoodListView1(),
                  ),
                ],
              ),
            ),
          ),
        ],
        body:        
        screenSize < 400
            ? ValueListenableBuilder<String>(
                valueListenable: filterNotifier,
                builder: (context, filter, child) {
                  return TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      6,
                      (index) => ListViewChicken(
                        filter: filter,
                      ),
                    ),
                  );
                },
              )
            :  ValueListenableBuilder<String>(
                valueListenable: filterNotifier,
                builder: (context, filter, child) {
                  return TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      6,
                      (index) => GridViewChicken(
                        filter: filter,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
