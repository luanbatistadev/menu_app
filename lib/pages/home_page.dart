import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/filter_tabview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: AppBarHome(),
              expandedHeight: 60.0,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 5,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    Text('Pesquisa'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 15, left: 25),
                child: Row(
                  children: const [
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: CarroselFoodListView(),
              ),
            ),
            SliverToBoxAdapter(
              child: FilterTabView(
                tabController: _tabController,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 1600,
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  delegate: CustomSliverDelegate(
                    expandedHeight: 150,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: Text('SASDONSOINA'),
          ),
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverDelegate({required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
          children: [
            AppBarHome(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),
          ],
    );
  }

  @override
  double get minExtent => 100;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}