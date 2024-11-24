import 'package:ass_coffee_clune/views/component/style.dart';
import 'package:flutter/material.dart';

class AppTextFiel extends StatefulWidget {
  const AppTextFiel({super.key});

  @override
  State<AppTextFiel> createState() => _AppTextFielState();
}

class _AppTextFielState extends State<AppTextFiel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignCenter),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 4),
        child: TextField(
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            hintText: "Search your drink or food",
            hintStyle: TextStyle(
              fontFamily: "pp",
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
