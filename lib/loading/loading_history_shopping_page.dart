import 'package:flutter/material.dart';
import 'package:menu_app/main.dart';
import 'package:menu_app/models/shimmer.dart';

class LoadingHistoryShoppingPage extends StatelessWidget {
  const LoadingHistoryShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: ThemeWidgetTest(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Skeleton(
                hasShadow: false,
                width: double.infinity,
                height: 40,
                borderR: 8,
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 8),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.04,
                                          borderR: 8,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.3,
                                          borderR: 8,
                                        ),
                                        Spacer(),
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.05,
                                          borderR: 8,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.04,
                                          borderR: 8,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.2,
                                          borderR: 8,
                                        ),
                                        Spacer(),
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.05,
                                          borderR: 8,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.04,
                                          borderR: 8,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.4,
                                          borderR: 8,
                                        ),
                                        Spacer(),
                                        Skeleton(
                                          hasShadow: false,
                                          height: 6,
                                          width: screenSize * 0.05,
                                          borderR: 8,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Skeleton(
                                hasShadow: false,
                                height: 12,
                                width: double.infinity,
                                borderR: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
