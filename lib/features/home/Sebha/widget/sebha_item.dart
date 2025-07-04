import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/app_assets.dart';
import 'package:islamic_app/core/constants/app_text_style.dart';

class SebhaWidget extends StatefulWidget {
  final List<String> azkar;
  final int stepCount;

  const SebhaWidget({super.key, required this.azkar, this.stepCount = 33});

  @override
  State<SebhaWidget> createState() => _SebhaWidgetState();
}

class _SebhaWidgetState extends State<SebhaWidget> {
  int count = 0;
  double rotation = 0;
  late String currentZikr;

  @override
  void initState() {
    super.initState();
    currentZikr = widget.azkar.first;
  }

  void incrementCounter() {
    setState(() {
      count++;
      rotation += pi / 15;

      if (count % widget.stepCount == 0) {
        int i = widget.azkar.indexOf(currentZikr);
        currentZikr = widget.azkar[(i + 1) % widget.azkar.length];
      }
      if (count == 33) {
        count = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: incrementCounter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedRotation(
            turns: rotation / (2 * pi),
            duration: const Duration(milliseconds: 400),
            child: Image.asset(
              AppAssets.sebhaBody,
              width: size.width * 0.8,
              fit: BoxFit.contain,
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentZikr,
                style: AppTextStyle.bold20white.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: AppTextStyle.bold20white.copyWith(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
