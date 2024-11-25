import 'package:ass_coffee_clune/controllers/product_controller.dart';
import 'package:flutter/material.dart';

import 'component/style.dart';
import 'component/text_feil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productCtrl = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "WELCOME TO ORIF COFFEE",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4C7766),
                ),
                const SizedBox(height: 14),
                AppText(
                  "Find your favorite & take your order",
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 30,
                ),
                const AppTextFiel(),
                const SizedBox(height: 24),
                AppText("All"),
                const SizedBox(height: 24),
                GridView.builder(
                  itemCount: productCtrl.products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // color: Colors.grey.shade400,
                      border: Border.all(
                        width: 2,
                        color: AppColors.primary.withOpacity(0.3),
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              productCtrl.products[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    productCtrl.products[index].name,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  GestureDetector(
                                    child: AppText(
                                        productCtrl.products[index].sizes[0],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.primary),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        trackShape: CustomTrackShape(),
                                      ),
                                      child: Slider(
                                        min: 0,
                                        max: 100,
                                        value: 50,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  AppText(
                                    '50',
                                    textAlign: TextAlign.right,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
