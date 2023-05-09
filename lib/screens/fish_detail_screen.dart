import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drop_the_fish/screens/loading_screen.dart';
import 'package:drop_the_fish/widgets/fish_image_widget.dart';
import 'package:drop_the_fish/widgets/fish_recipe_widget.dart';
import 'package:drop_the_fish/widgets/fish_tip_widget.dart';
import 'package:flutter/material.dart';

class FishDetailScreen extends StatefulWidget {
  final String imagePath;

  const FishDetailScreen({super.key, required this.imagePath});

  @override
  State<FishDetailScreen> createState() => _FishDetailScreenState();
}

class _FishDetailScreenState extends State<FishDetailScreen> {
  String fishName = '연어';
  String fishPercentage = '';

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String url = 'http://13.124.226.254:8080/fish';

    // 파일 경로를 통해 formData 생성
    var dio = Dio();
    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(widget.imagePath)});

    // 업로드 요청
    final response = await dio.post(url, data: formData);

    Map<String, dynamic> fishInfo = json.decode(response.data);
    print(fishInfo);
    String findFishName = fishInfo.keys.toList()[0];
    String findFishPercentage = fishInfo.values.toList()[0];

    if (findFishName != 'NULL') {
      fishName = findFishName;
      fishPercentage = findFishPercentage;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoadingScreen();
    } else {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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
                      scale: 1,
                      child: const TempImage(),
                    ),
                  ),
                ),
                 Center(
                  child: Text(
                    fishName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    FishImageWidget(fishName: fishName),
                    const SizedBox(
                      height: 20,
                    ),
                    FishTipWidget(fishName: fishName),
                    const SizedBox(
                      height: 20,
                    ),
                    FishRecipeWidget(fishName: fishName),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
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