class RecommendationFishModel {
  final String name;
  final int averagePrice, todayPrice;

  RecommendationFishModel.fromJson(List<dynamic> json)
      : name = json[0],
        averagePrice = json[1],
        todayPrice = json[2];
}
