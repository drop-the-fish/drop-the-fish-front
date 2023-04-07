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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const TempImage();
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
      'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
      headers: const {
        "User-Agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      },
    );
  }
}
