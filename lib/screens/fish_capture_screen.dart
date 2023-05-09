import 'dart:io';

import 'package:drop_the_fish/screens/fish_detail_screen.dart';
import 'package:flutter/material.dart';

class FishCaptureScreen extends StatefulWidget {
  final String imagePath;
  const FishCaptureScreen({super.key, required this.imagePath});

  @override
  State<FishCaptureScreen> createState() => _FishCaptureScreenState();
}

class _FishCaptureScreenState extends State<FishCaptureScreen> {
  onRetryTap(BuildContext context) {
    Navigator.pop(context);
  }

  onOkTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FishDetailScreen(imagePath: widget.imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
      // 경로로 `Image.file`을 생성하세요.
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
            ),
            child: Image.file(File(widget.imagePath)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  onRetryTap(context);
                },
                child: const Text(
                  '다시 시도',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  onOkTap(context);
                },
                child: const Text(
                  '확인',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
