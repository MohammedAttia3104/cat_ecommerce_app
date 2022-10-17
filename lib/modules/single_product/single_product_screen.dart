import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_ecommerce_app/models/cart_product_model/cart_product_model.dart';
import 'package:cat_ecommerce_app/models/products_model/all_products_model.dart';
import 'package:cat_ecommerce_app/modules/cart/cart_screen.dart';
import 'package:cat_ecommerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:cat_ecommerce_app/modules/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cart_product_model/cart_product_model.dart';
import '../all_products/products_screen.dart';

class SingleProductScreen extends StatelessWidget {
  final ProductModel model;

  const SingleProductScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    debugPrint('all height = ${height * 0.1}');
    debugPrint('all width = ${width * 0.3}');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductsScreen(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'Shopee',
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: height * 0.3,
              ),
              CachedNetworkImage(
                imageUrl: '${model.image}',
                fit: BoxFit.contain,
                height: height * 0.2,
                width: width * 0.4,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
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
              height: height * 0.5,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.title}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                '\$${model.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              BlocConsumer<CartCubit, CartStates>(
                                builder: (context, state) {
                                  return FloatingActionButton.extended(
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
                                    onPressed: () {
                                      CartCubit.get(context).addProduct(
                                        CartProductModel(
                                          title: model.title,
                                          image: model.image,
                                          price: model.price,
                                          quantity: 1,
                                        ),
                                      );
                                    },
                                    heroTag: 'b2',
                                  );
                                },
                                listener: (context, state) {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Product Description',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${model.description}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 11,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
