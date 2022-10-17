import 'package:cat_ecommerce_app/global/constance/AppImages.dart';
import 'package:flutter/material.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    List<String> categoryTitles = [
      'Electronics',
      'Jewelery',
      'men\'s clothing',
      'women\'s clothing',
    ];
    List<Widget> categoryImages = [
      Image.asset(
        AppImages.electronicsCategory,
      ),
      Image.asset(
        AppImages.jewallyCategory,
      ),
      Image.asset(
        AppImages.menCategory,
      ),
      Image.asset(
        AppImages.womenCategory,
      ),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          categoryTitles.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: width * 0.3,
              height: height * 0.06,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.electronicsCategory,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    categoryTitles[index],
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, String> categoriesData = {
  'Electronics': AppImages.electronicsCategory,
  'Jewelery': AppImages.jewallyCategory,
  'men\'s clothing': AppImages.menCategory,
  'women\'s clothing': AppImages.womenCategory,
};
