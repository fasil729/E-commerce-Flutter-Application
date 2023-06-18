import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/product.dart';
import 'review_event.dart';
import 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(const ReviewInitialState()) {
    on<FetchReviewProductEvent>(_onFetchReviewProductEvent);
    on<AddReviewProductEvent>(_onAddReviewProductEvent);
    on<DeleteReviewProductEvent>(_onDeleteReviewProductEvent);
    // on<ChangeItemReviewEvent>(_onChangeItemReviewEvent);
  }
  void _onFetchReviewProductEvent(
      FetchReviewProductEvent event, Emitter<ReviewState> emitter) async {
    // Change the state to LoadingState
    emitter(const ReviewLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    List<Map> review = demoProducts
        .firstWhere((product) => product.id == event.productId)
        .review;
    if (review.length >= 0) {
      emitter(ReviewSuccessFetchDataState(review: review));
    } else {
      emitter(const ReviewErrorFetchDataState(errorMessage: "No reviews"));
    }
  }

  void _onAddReviewProductEvent(
      AddReviewProductEvent event, Emitter<ReviewState> emitter) async {
    // Change the state to LoadingState
    emitter(const ReviewLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    Product product =
        demoProducts.firstWhere((product) => product.id == event.productID);
    product.review.add(event.review);
    List<Map> review = product.review;
    if (review.length >= 0) {
      emitter(ReviewSuccessFetchDataState(review: review));
    } else {
      emitter(const ReviewErrorFetchDataState(errorMessage: "No reviews"));
    }
  }

  void _onDeleteReviewProductEvent(
      DeleteReviewProductEvent event, Emitter<ReviewState> emitter) async {
    // Change the state to LoadingState
    emitter(const ReviewLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    Product product =
        demoProducts.firstWhere((product) => product.id == event.productID);
    product.review.removeWhere((review) => review["id"] == event.reviewID);



    List<Map> review = product.review;

    if (review.length >= 0) {
      emitter(ReviewSuccessFetchDataState(review: review));
    } else {
      emitter(const ReviewErrorFetchDataState(errorMessage: "No reviews"));
    }
  }

  // void _onChangeItemReviewEvent(
  //     ChangeItemReviewEvent event, Emitter<ReviewState> emitter) {
  //     var isReview = demoProducts
  //       .where((product) => (product.id == event.productID))
  //       .first
  //       .isFavourite == (true) ? false : true;
  //     emitter(const ReviewItemFetchReviewState(isFavorite: isFavorite));
  // }
}
