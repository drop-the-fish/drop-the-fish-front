import 'package:flutter/material.dart';

class FishRecipeWidget extends StatelessWidget {
  const FishRecipeWidget({
    super.key,
    required this.fishName,
  });

  final String fishName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.image_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$fishName 요리',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  if(index == 0) {
                    return SizedBox(
                      height: 200,
                      width: 200,
                        child: Column(
                          children: const [TempImage4(),
                          SizedBox(height: 20,),
                          Text('연어 스테이크', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if(index == 1) {
                    return SizedBox(
                      height: 200,
                      width: 200,
                        child: Column(
                          children: const [TempImage5(),
                          SizedBox(height: 20,),
                          Text('연어 샐러드', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if(index == 2) {
                    return SizedBox(
                      height: 200,
                      width: 200,
                        child: Column(
                          children: const [TempImage6(),
                          SizedBox(height: 20,),
                          Text('연어 덮밥', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return null;
                  
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TempImage4 extends StatelessWidget {
  const TempImage4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://hansando.godohosting.com/yamtable_cdn/data/goods/21/09/36/1000000515/1000000515_detail_094.jpg',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
      height: 200,
      width: 200,
    );
  }
}

class TempImage5 extends StatelessWidget {
  const TempImage5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://static.megamart.com/product/image/0875/08751225/08751225_1_960.jpg',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
      height: 200,
      width: 200,
    );
  }
}

class TempImage6 extends StatelessWidget {
  const TempImage6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1PbSMmqAC5oa5VjxPB7pbGQKmg_PZH2OiPA&usqp=CAU',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
      height: 200,
      width: 200,
    );
  }
}
