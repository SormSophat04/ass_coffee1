import 'dart:math';

import 'package:ass_coffee_clune/controllers/product_controller.dart';
import 'package:flutter/material.dart';

import 'component/slider.dart';
import 'component/style.dart';
import 'component/text_feil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quatityCount = 0;

  void incrementQty() {
    setState(() {
      quatityCount++;
    });
  }

  void decrementQty() {
    setState(() {
      if (quatityCount > 0) {
        quatityCount--;
      }
    });
  }

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
                    childAspectRatio: 9 / 17,
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // color: Colors.grey.shade400,
                      border: Border.all(
                        width: 2,
                        color: AppColors.primary.withOpacity(0.1),
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
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
                          flex: 3,
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
                                    child: Slider_bar(
                                      onChanged: (value) {
                                        log('value = $value' as num);
                                      },
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
                              const SizedBox(width: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    "\$${productCtrl.products[index].price[0]}",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.dark,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: decrementQty,
                                          icon: const Icon(
                                            Icons.remove,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          quatityCount.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        IconButton(
                                          onPressed: incrementQty,
                                          icon: const Icon(
                                            Icons.add,
                                            color: AppColors.primary,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
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
