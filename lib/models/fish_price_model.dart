class FishPriceModel {
  final String name, kindName, rank, unit;
  final List<String> priceList;

  FishPriceModel.fromJson(List<dynamic> json)
      : name = json[0],
        kindName = json[1],
        rank = json[2],
        unit = json[3],
        priceList = json[4];
}
