import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cubit/widget/app_large_text.dart';
import 'package:flutter_cubit/widget/app_text.dart';

import '../../misc/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu row
          Container(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: Row(
              children: [
                Icon(Icons.menu),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //Discover text
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: 'Discover')),
          const SizedBox(
            height: 30,
          ),
          //Tabbar
          // ignore: avoid_unnecessary_containers
          Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                  controller: _tabController,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, raduis: 4),
                  tabs: [
                    Tab(
                      text: "places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    )
                  ]),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('img/mountain.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      );
                    }),
                Text(('Hello')),
                Text(('houy')),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: 'Explore more',
                  size: 20,
                ),
                AppText(
                  text: "See all",
                  color: AppColors.textColor1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(right: 50),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    'img/' + images.keys.elementAt(index)),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double raduis;
  CircleTabIndicator({required this.color, required this.raduis});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(
      color: color,
      raduis: raduis,
    );
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double raduis;
  _CirclePainter({required this.color, required this.raduis});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - raduis / 2,
        configuration.size!.height - raduis / 2);
    canvas.drawCircle(offset + circleOffset, raduis, _paint);
  }
}
