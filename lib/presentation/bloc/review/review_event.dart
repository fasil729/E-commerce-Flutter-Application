import 'package:equatable/equatable.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();
}

class FetchReviewProductEvent extends ReviewEvent {
  final int productId;
  const FetchReviewProductEvent({required this.productId});

  @override
  List<Object?> get props => [];
}

class AddReviewProductEvent extends ReviewEvent {
  final int productID;
  final Map review;

  const AddReviewProductEvent({required this.productID, required this.review});
  @override
  List<Object?> get props => [];
}

class DeleteReviewProductEvent extends ReviewEvent {
  final int productID;
  final int reviewID;

  const DeleteReviewProductEvent(
      {required this.productID, required this.reviewID});
  @override
  List<Object?> get props => [];
}

class UpdateReviewRatingEvent extends ReviewEvent {
  final int rating;
  final int productId;
  UpdateReviewRatingEvent({required this.rating, required this.productId});
  @override
  List<Object> get props => [];
}
