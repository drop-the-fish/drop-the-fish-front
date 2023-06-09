import 'package:flutter/material.dart';

class FishImageWidget extends StatelessWidget {
  const FishImageWidget({
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
                  '$fishName의 이미지',
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
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const TempImage1();
                  } else if (index == 1) {
                    return const TempImage2();

                  } else {
                    return const TempImage3();

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

class TempImage extends StatelessWidget {
  const TempImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://images.ctfassets.net/lufu0clouua1/1pri5R009Gg26o4IEA46cO/722b5d2943e1ac5897a51d71154e2c97/Sockeye-Salmon.jpg',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
    );
  }
}

class TempImage1 extends StatelessWidget {
  const TempImage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://media.fisheries.noaa.gov/styles/original/s3/2022-08/640x427-Salmon-Atlantic-NOAAFisheries.png?itok=z_tFH1qP',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
    );
  }
}

class TempImage2 extends StatelessWidget {
  const TempImage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://cdn.shopify.com/s/files/1/0436/4976/1446/products/Artboard29e.jpg?v=1596815114',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
    );
  }
}

class TempImage3 extends StatelessWidget {
  const TempImage3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // 'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSam-ZSQeb1PYCE5VQkKXlz5lTIY604imtOFA&usqp=CAU',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
    );
  }
}
