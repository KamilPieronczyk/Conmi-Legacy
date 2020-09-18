import 'package:conmi/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'dart:math' as math;

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Transform.rotate(
            angle: math.pi,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [ConmiColor().primaryDark, ConmiColor().gradientPinkDark],
                  [ConmiColor().primaryLight, ConmiColor().gradientPinkLight],
                  [ConmiColor().primary, ConmiColor().gradientPink],
                  [ConmiColor().primary, ConmiColor().gradientPink]
                ],
                durations: [75000, 100000, 120000, 90000],
                heightPercentages: [0.20, 0.23, math.pi, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 1.4,
              size: Size(
                double.infinity,
                100,
              ),
              waveFrequency: 1.8,
            ),
          ),
          Text("Conmi")
        ],
      ),
      
    );
  }
}
