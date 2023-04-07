import 'package:drop_the_fish/widgets/fish_image_widget.dart';
import 'package:drop_the_fish/widgets/fish_tip_widget.dart';
import 'package:flutter/material.dart';

class FishDetailScreen extends StatelessWidget {
  final fishName = '광어(넙치)';

  const FishDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                width: 200,
                height: 200,
                child: Transform.scale(
                  scale: 1.5,
                  child: const TempImage(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                '광어(넙치)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                FishImageWidget(fishName: fishName),
                const SizedBox(
                  height: 20,
                ),
                FishTipWidget(fishName: fishName),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// ImageFiltered(
//           imageFilter: ImageFilter.blur(
//             sigmaX: 10,
//             sigmaY: 10,
//           ),
//           child: Image.network(
//             'http://rgo4.com/files/attach/images/2676751/909/558/019/093271cf31ad9cabdf4216e7bbcc7b7b.jpg',
//             headers: const {
//               "User-Agent":
//                   "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
//             },
//           ),
//         ),