import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/cart_item.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/bloc/review/review_bloc.dart';
import 'package:store/presentation/bloc/review/review_event.dart';
import 'package:store/presentation/bloc/review/review_state.dart';
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
    final review_bloc = BlocProvider.of<ReviewBloc>(context);
    final ProductDescription description = ProductDescription(
      product: widget.product,
      onSeeMorePressed: () {},
      onQuantityChanged: onQuantityChanged,
    );
    int productID = widget.product.id;
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
                  BlocBuilder(
                    bloc: review_bloc,
                    builder: (BuildContext context, ReviewState state) {
                      if (state is ReviewLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ReviewSuccessFetchDataState) {
                        List<Map> reviews = state.review;
                        int count = reviews.length;
                        String? review_text;
                        return Column(
                          children: [
                            // Display existing reviews
                            if (reviews.isNotEmpty) ...[
                              Text('Reviews (${reviews.length})'),
                              SizedBox(height: 8.0),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: reviews.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map review = reviews[index];
                                  return ListTile(
                                    title: Text(review["description"]),
                                    subtitle: Text('time: ${review["time"]}'),
                                    trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        // Delete the review
                                        BlocProvider.of<ReviewBloc>(context)
                                            .add(DeleteReviewProductEvent(
                                                productID: productID,
                                                reviewID: review["id"]));
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                            // Add review
                            SizedBox(height: 16.0),
                            Text('Add a review'),
                            SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your review',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                // Update the review text
                                review_text = value;
                              },
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Text('Rating: '),
                                SizedBox(width: 8.0),
                                for (int i = 1; i <= 5; i++) ...[
                                  GestureDetector(
                                    onTap: () {
                                      // Update the rating
                                      review_bloc.add(UpdateReviewRatingEvent(
                                          rating: i, productId: productID));
                                    },
                                    child: Icon(
                                      Icons.star,
                                      size: 32.0,
                                      color: i <= state.rating
                                          ? Colors.orange
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            SizedBox(height: 16.0),
                            DefaultButton(
                              text: 'Submit',
                              onPressed: () {
                                if (review_text != Null) {
                                  review_bloc.add(AddReviewProductEvent(
                                      productID: productID,
                                      review: {
                                        "id": count,
                                        "time": "june 18 2023",
                                        "description": review_text
                                      }));
                                }
                                // Add the review
                              },
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
