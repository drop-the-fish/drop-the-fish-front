import 'package:flutter/material.dart';

class FishBottomNavigationBar extends StatelessWidget {
  const FishBottomNavigationBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: [
            GestureDetector(
              child: const Tab(
                height: 60,
                text: '어종 찾기',
                iconMargin: EdgeInsets.symmetric(vertical: 5),
                icon: Icon(
                  Icons.camera_alt_outlined,
                ),
              ),
            ),
            GestureDetector(
              child: const Tab(
                text: '추천',
                iconMargin: EdgeInsets.symmetric(vertical: 5),
                icon: Icon(
                  Icons.search,
                ),
              ),
            ),
            GestureDetector(
              child: const Tab(
                text: '시세',
                iconMargin: EdgeInsets.symmetric(vertical: 5),
                icon: Icon(
                  Icons.bar_chart_rounded,
                ),
              ),
            ),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
