import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/models/shimmer.dart';

class LoadingHomePage extends StatefulWidget {
  const LoadingHomePage({super.key});

  @override
  State<LoadingHomePage> createState() => _LoadingHomePageState();
}

class _LoadingHomePageState extends State<LoadingHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
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
                child: SizedBox(
                  height: 30,
                  child: TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    automaticIndicatorColorAdjustment: true,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    controller: _tabController,
                    tabs: List.generate(
                      6,
                      (index) => Skeleton(
                        hasShadow: false,
                        height: 20,
                        width: 60,
                        borderR: 6,
                      ),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 15,
                        left: 25,
                      ),
                      child: Skeleton(
                        hasShadow: false,
                        height: 25,
                        width: 60,
                        borderR: 12,
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 120.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: 0.8,
                        ),
                        items: List.generate(
                          6,
                          (item) => SizedBox(
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Skeleton(
                                  hasShadow: false,
                                  height: 120,
                                  width: 1000,
                                ),
                              ),
                            ),
                          ),
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            clipBehavior: Clip.hardEdge,
            children: List.generate(6, (index) {
              if (screenSize < 480) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 8),
                    ),
                    SliverList.builder(
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return LoadingFoodTile();
                      },
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    ),
                  ],
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 8),
                    ),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        return LoadingGridFood();
                      },
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    ),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class LoadingGridFood extends StatelessWidget {
  const LoadingGridFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Skeleton(
            height: 90,
            width: double.infinity,
            hasShadow: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  hasShadow: false,
                  width: double.infinity,
                  height: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                Skeleton(
                  hasShadow: false,
                  width: double.infinity,
                  height: 15,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Skeleton(
              hasShadow: false,
              width: double.infinity,
              height: 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skeleton(hasShadow: false, height: 24, width: 24, borderR: 12),
                SizedBox(
                  width: 5,
                ),
                Skeleton(hasShadow: false, height: 24, width: 24, borderR: 12),
                SizedBox(
                  width: 5,
                ),
                Skeleton(hasShadow: false, height: 24, width: 24, borderR: 12),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingFoodTile extends StatelessWidget {
  const LoadingFoodTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25, left: 25, bottom: 10, top: 10),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100]!,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Skeleton(
                    hasShadow: false,
                    height: 15,
                    width: 95,
                    borderR: 6,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Skeleton(
                    hasShadow: false,
                    height: 15,
                    width: 125,
                    borderR: 6,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Skeleton(
                    hasShadow: false,
                    height: 15,
                    width: 75,
                    borderR: 6,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Skeleton(
                    hasShadow: false,
                    height: 15,
                    width: 50,
                    borderR: 6,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Skeleton(
              hasShadow: false,
              height: double.infinity,
              width: double.infinity,
              borderR: 8,
            ),
          ),
        ],
      ),
    );
  }
}
