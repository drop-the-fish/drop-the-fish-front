import 'package:drop_the_fish/models/recommondation_fish_model.dart';
import 'package:drop_the_fish/widgets/recommendation/recommendation_fish_info_list_widget.dart';
import 'package:flutter/material.dart';

class FishRecommendScreen extends StatelessWidget {
  const FishRecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 18,
              top: 20,
            ),
            child: Text(
              '오늘의 추천',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            child: Text(
              '시세, 제철, 조합, 사용자 경험 등 다양한 기준으로 경쟁력 있는 어종을 추천해줍니다.',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          RecommendationWidget(
            icon: const Icon(
              Icons.show_chart_rounded,
            ),
            title: '오늘의 생선/회',
            description: '평균 시세보다 오늘 특별히 가격이 저렴한 품목을 추천드려요.',
            recommondationFishList: _getRecommondationFishList(),
          ),
          RecommendationWidget(
            icon: const Icon(
              Icons.calendar_today,
            ),
            title: '제철 생선/회',
            description: '제철을 맞아 살이 통통하게 오른 품목을 추천드려요.',
            recommondationFishList: _getRecommondationFishList(),
          ),
          RecommendationWidget(
            icon: const Icon(
              Icons.thumb_up_alt_outlined,
            ),
            title: '꿀조합 생선/회',
            description: '특정 품목이나 주류와 궁합이 좋은 생선/회 등을 추천드려요.',
            recommondationFishList: _getRecommondationFishList(),
          ),
          RecommendationWidget(
            icon: Image.asset(
              'assets/images/fish.png',
              width: 25,
              height: 25,
            ),
            title: '드랍더 피쉬 추천',
            description: '사용자분들이 많이 드시는 품목들을 기반으로 추천드려요',
            recommondationFishList: _getRecommondationFishList(),
          ),
          // RecommendationWidget(),
          // RecommendationWidget(),
          // RecommendationWidget(),
        ],
      ),
    );
  }

  Future<List<RecommendationFishModel>> _getRecommondationFishList() async {
    List<dynamic> tempFishModelList = [
      ["광어", 11000, 10000],
      ["우럭", 15000, 12000],
      ["연어", 16000, 13000],
    ];
    List<RecommendationFishModel> recommondationFishModelList = [];

    for (var json in tempFishModelList) {
      recommondationFishModelList.add(RecommendationFishModel.fromJson(json));
    }

    return recommondationFishModelList;
  }
}

class RecommendationWidget extends StatefulWidget {
  const RecommendationWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.recommondationFishList,
  });

  final dynamic icon;
  final String title;
  final String description;
  final Future<List<RecommendationFishModel>> recommondationFishList;

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  bool _detailVisible = false;
  // late Future<List<RecommendationFishModel>> recommondationFishList =
  // _getRecommondationFishList();

  _onDetailButtonPressed() {
    _detailVisible = !_detailVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: widget.icon,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: _onDetailButtonPressed,
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _detailVisible,
              child: Column(
                children: [
                  Container(
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            '품목',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Center(
                            child: Text(
                              '평균 시세',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Center(
                            child: Text(
                              '현재 시세',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: widget.recommondationFishList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return RecommondationFishInfoListWidget(
                          fishList: snapshot.data!,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
