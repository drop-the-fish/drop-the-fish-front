import 'package:drop_the_fish/models/recommondation_fish_model.dart';
import 'package:flutter/material.dart';

class RecommondationFishInfoListWidget extends StatelessWidget {
  const RecommondationFishInfoListWidget({
    super.key,
    required this.fishList,
  });

  final List<RecommendationFishModel> fishList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var fish in fishList)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  fish.name,
                  style: const TextStyle(
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
                    '${fish.averagePrice}',
                    style: const TextStyle(
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
                    '${fish.todayPrice}',
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
