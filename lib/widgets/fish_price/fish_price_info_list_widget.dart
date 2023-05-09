import 'package:flutter/material.dart';

class FishPriceInfoListWidget extends StatefulWidget {
  const FishPriceInfoListWidget({
    super.key,
    required this.priceList,
  });

  final List<String> priceList;

  @override
  State<FishPriceInfoListWidget> createState() =>
      _FishPriceInfoListWidgetState();
}

class _FishPriceInfoListWidgetState extends State<FishPriceInfoListWidget> {
  final List<String> dateList = [
    "당일",
    "1일 전",
    "1주일 전",
    "2주일 전",
    "1개월 전",
    "1년 전",
    "일평년",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < widget.priceList.length; index++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      dateList[index],
                      style: const TextStyle(
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
                fit: FlexFit.loose,
                child: Center(
                  child: Text(
                    widget.priceList[index],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
