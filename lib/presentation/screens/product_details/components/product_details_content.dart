import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/cart_item.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/widgets/default_button.dart';
import '../../home/home_screen.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class DetailsScreenContent extends StatefulWidget {
  final Product product;

  const DetailsScreenContent({Key? key, required this.product})
      : super(key: key);

  DetailsScreenContentState createState() => DetailsScreenContentState();
}

class DetailsScreenContentState extends State<DetailsScreenContent> {
  int quantity = 1;
  void onQuantityChanged(int newValue) {
    quantity = newValue;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CartBloc>(context);
    final ProductDescription description = ProductDescription(
      product: widget.product,
      onSeeMorePressed: () {},
      onQuantityChanged: onQuantityChanged,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  description,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getProportionateScreenHeight(8.0)),
                    child: DefaultButton(
                      text: "Add to basket",
                      backgroundColor: primaryColor,
                      forgroundColor: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Product have been added to cart'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeScreen.routeName, (route) => false);
                                  },
                                  child: Text('Ok'))
                            ],
                          ),
                        );
                        bloc.add(AddProductToCartEvent(
                            cartItem: CartItem(
                                product: widget.product, quantity: quantity)));
                      },
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
