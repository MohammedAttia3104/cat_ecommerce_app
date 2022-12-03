import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_ecommerce_app/models/products_model/all_products_model.dart';
import 'package:cat_ecommerce_app/modules/single_product/single_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget buildGridProduct(context, ProductModel model,) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleProductScreen(model: model,),
          ));
    },
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.31,
            width: width * 0.45,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0xff707070),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: width * 0.35,
                        height: height * 0.125,
                        child: CachedNetworkImage(
                          imageUrl: '${model.image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${model.title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${model.price?.round()}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'count : ${model.rating?.count}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // toDo : Having Problem Here
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 22,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double? rating) {
                      double value = model.rating?.rate?.round() as double;
                      rating = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                    label: const Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: Colors.blue,
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      size: 12.0,
                    ),
                    onPressed: () {},
                    heroTag: 'b1',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
