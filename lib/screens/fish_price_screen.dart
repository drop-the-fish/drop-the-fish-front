import 'package:drop_the_fish/models/fish_price_model.dart';
import 'package:drop_the_fish/widgets/fish_price/fish_price_info_list_widget.dart';
import 'package:flutter/material.dart';

class FishPriceScreen extends StatelessWidget {
  const FishPriceScreen({
    super.key,
    required this.fishPriceList,
  });

  final List<FishPriceModel> fishPriceList;

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
              '오늘의 시세',
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
          for (var fishPrice in fishPriceList)
            FishPriceWidget(
              icon: Image.asset(
                'assets/images/fish.png',
                width: 25,
                height: 25,
              ),
              title: fishPrice.name,
              description:
                  '${fishPrice.kindName} / ${fishPrice.rank} / ${fishPrice.unit}',
              priceList: fishPrice.priceList,
            ),
        ],
      ),
    );
  }
}

class FishPriceWidget extends StatefulWidget {
  const FishPriceWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.priceList,
  });

  final dynamic icon;
  final String title;
  final String description;
  final List<String> priceList;

  @override
  State<FishPriceWidget> createState() => _FishPriceWidgetState();
}

class _FishPriceWidgetState extends State<FishPriceWidget> {
  bool _detailVisible = false;

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
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Center(
                              child: Text(
                                '날짜',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: Center(
                            child: Text(
                              '가격',
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
                  FishPriceInfoListWidget(priceList: widget.priceList),
                  // RecommondationFishInfoListWidget(
                  //   fishList: snapshot.data!,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
