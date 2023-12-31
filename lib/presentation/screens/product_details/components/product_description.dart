import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/text_style.dart';
import 'package:store/presentation/screens/product_details/components/quantiy_modify.dart';

import 'product_colors.dart';

class ProductDescription extends StatefulWidget {
  final Product product;
  final GestureTapCallback? onSeeMorePressed;
  final Function(int) onQuantityChanged;

  const ProductDescription(
      {Key? key,
      required this.product,
      this.onSeeMorePressed,
      required this.onQuantityChanged})
      : super(key: key);
  ProductDescriptionState createState() => ProductDescriptionState();
}

class ProductDescriptionState extends State<ProductDescription> {
  int quantity = 1;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.product.price;
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      totalPrice = quantity * widget.product.price;
      widget.onQuantityChanged(quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product's title widget
          Padding(
            padding: EdgeInsets.only(
                bottom: SizeConfig.getProportionateScreenHeight(10)),
            child: Center(
              child: Text(
                widget.product.title,
                style: productTitleStyle,
              ),
            ),
          ),

          // Product Colors
          ProductColorList(productColors: widget.product.colors),
          Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.getProportionateScreenHeight(20)),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(20),
                    right: SizeConfig.getProportionateScreenWidth(64),
                  ),
                  child: Text('Quantity'))),

          QuantitySelector(initialValue: 1, onValueChanged: updateQuantity),

          // Product Description
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(20)),
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.getProportionateScreenWidth(20),
                right: SizeConfig.getProportionateScreenWidth(64),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product's Headline
                  Text(
                    widget.product.description["headline"]!,
                    style: productHeadlineStyle,
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(5),
                  ),
                  // Product's description
                  Opacity(
                    opacity: 0.50,
                    child: Text(
                      widget.product.description["description"]!,
                      maxLines: 3,
                      style: productDescriptionStyle,
                    ),
                  ),
                  // See more details button
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getProportionateScreenWidth(10)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Text(
                            "Full Description",
                            style: textStyle,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            size: SizeConfig.getProportionateScreenWidth(20),
                            color: primaryColor,
                            semanticLabel: "See More Details",
                          )
                        ],
                      ),
                    ),
                  ),
                  // Total Price
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.black,
                            )),
                        Text(
                          "ETB${totalPrice.toStringAsFixed(2)}",
                          style: priceTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
