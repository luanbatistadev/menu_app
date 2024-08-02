import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/carousel_slider_home.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/loading/loading_home_page.dart';
import 'package:menu_app/models/filter_tabview.dart';
import 'package:menu_app/utils/filters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoading;
  late ScrollController scrollController;
  BuildContext? tabContext;

  final List<GlobalKey> foodCategories =
      List.generate(kFilters.length, (int index) => GlobalKey());

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
    scrollController = ScrollController();
    scrollController.addListener(animateToTab);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return _isLoading
        ? LoadingHomePage()
        : SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                controller: scrollController,
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
                      child: FilterTabView(
                        tabController: _tabController,
                        onTabSelected: scrollToIndex,
                      ),
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
                body: Builder(
                  builder: (BuildContext context) {
                    tabContext = context;
                    return SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      child: Column(
                        children: List.generate(kFilters.length, (int index) {
                          return Column(//é um teste, fiz baseado em um gringo
                            children: [
                              Text(
                                kFilters[index],
                                style: Theme.of(context).textTheme.titleMedium,
                                key: foodCategories[index],
                              ),
                              Container(
                                height: 900,
                                child: FoodView(
                                  screenSize: screenSize,
                                  categories: kFilters[index],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void scrollToIndex(int index) async {
    scrollController.removeListener(animateToTab);
    final categories = foodCategories[index].currentContext!;
    await Scrollable.ensureVisible(
      categories,
      duration: const Duration(milliseconds: 600),
    );
    scrollController.addListener(animateToTab);
  }

  void animateToTab() {
    for (var i = 0; i < foodCategories.length; i++) {
      final context = foodCategories[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null && box.hasSize) {
          Offset position = box.localToGlobal(Offset.zero);
          if (scrollController.offset >= position.dy) {
            _tabController.animateTo(
              i,
              duration: const Duration(milliseconds: 100),
            );
          }
        }
      }
    }
  }
}

class FoodView extends StatelessWidget {
  const FoodView({
    super.key,
    required this.screenSize,
    required this.categories,
  });
  final double screenSize;
  final String categories;

  @override
  Widget build(BuildContext context) {
    if (screenSize < 480) {
      return ListViewFood(
        filter: '',
        category: categories,
      );
    } else {
      return GridViewChicken(
        filter: '',
        category: categories,
      );
    }
  }
}
