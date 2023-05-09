import 'package:flutter/material.dart';

class FishTipWidget extends StatelessWidget {
  const FishTipWidget({
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$fishName의 특징',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Text(
                '연어의 형태는 몸은 약간 가늘고 긴 편으로 꼬리는 가는 것이 특징입니다. 양턱의 이빨은 송곳니 모양으로 뾰족합니다. 머리는 원추형이고, 배지느러미는 배의 정중앙에 위치하며, 각 지느러미에는 가시가 없습니다.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
