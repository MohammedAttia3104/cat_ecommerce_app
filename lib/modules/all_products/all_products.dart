import 'package:carousel_slider/carousel_slider.dart';
import 'package:cat_ecommerce_app/global/constance/AppImages.dart';
import 'package:cat_ecommerce_app/models/products_model/all_products_model.dart';
import 'package:cat_ecommerce_app/modules/all_category/category_screen.dart';
import 'package:cat_ecommerce_app/modules/all_products/category_builder.dart';
import 'package:cat_ecommerce_app/modules/all_products/grid_product_builder.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget allProductScreen(context, List<ProductModel> products) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  var pageController = PageController();
  print('all height = $height');
  print('all width = $width');
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  AppImages.electronicsCategory,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppImages.jewallyCategory,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppImages.menCategory,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppImages.womenCategory,
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(
                  seconds: 3,
                ),
                autoPlayAnimationDuration: const Duration(
                  seconds: 1,
                ),
                autoPlayCurve: Curves.fastOutSlowIn,
                initialPage: 0,
                reverse: false,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: SmoothPageIndicator(
                controller: pageController,
                count: categoriesData.length,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 4,
                  spacing: 5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'view all',
                    ),
                  ),
                ],
              ),
              const CategoryBuilder(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Our Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 1,
              childAspectRatio: 1 / 1.3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                products.length,
                (index) => buildGridProduct(
                  context,
                  products[index],
                ), // number of products
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
