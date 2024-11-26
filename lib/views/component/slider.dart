import 'package:ass_coffee_clune/views/component/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class Slider_bar extends StatefulWidget {
  const Slider_bar({super.key, required this.onChanged});
  final ValueChanged<double> onChanged;

  @override
  State<Slider_bar> createState() => _Slider_barState();
}

class _Slider_barState extends State<Slider_bar> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: CustomTrackShape(),
      ),
      child: Slider(
        thumbColor: AppColors.primary,
        inactiveColor: Colors.grey,
        activeColor: AppColors.primary,
        min: 0,
        max: 100,
        value: sliderValue,
        onChanged: (value) {
          setState(() {
            sliderValue = value;
          });
        },
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    // Return a rectangle that spans the entire width of the Slider's parent widget
    final double trackHeight = sliderTheme.trackHeight ?? 2;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
