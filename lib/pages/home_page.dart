import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/carousel_slider_home.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/components/tab_bar_view_home.dart';
import 'package:menu_app/loading/loading_home_page.dart';
import 'package:menu_app/models/filter_tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return _isLoading
        ? LoadingHomePage()
        : SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    expandedHeight: 230,
                    pinned: true,
                    toolbarHeight: 38,
                    surfaceTintColor: Colors.white,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    leadingWidth: double.infinity,
                    leading: Column(
                      children: [
                        AppBarHome(),
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(30),
                      child: FilterTabView(tabController: _tabController),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Semantics(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 15,
                                left: 25,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Conheça:',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
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
                body: TabBarViewHome(screenSize: screenSize, tabController: _tabController,),
              ),
            ),
          );
  }  

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
