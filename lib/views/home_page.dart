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
                    child: Column(),
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
