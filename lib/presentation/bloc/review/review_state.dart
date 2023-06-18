import 'package:equatable/equatable.dart';
import 'package:store/data/models/product.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();
}

class ReviewInitialState extends ReviewState {
  const ReviewInitialState();

  @override
  List<Object?> get props => [];
}

// Loading state for the Review page
class ReviewLoadingState extends ReviewState {
  const ReviewLoadingState();

  @override
  List<Object?> get props => [];
}

// Error state for the Review page
class ReviewErrorFetchDataState extends ReviewState {
  final String errorMessage;
  const ReviewErrorFetchDataState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

// Success state for the Review page
class ReviewSuccessFetchDataState extends ReviewState {
  final List<Map> review;

  const ReviewSuccessFetchDataState({required this.review});
  @override
  List<Object?> get props => [];
}

// class ReviewItemFetchReviewState extends ReviewState{
//   const ReviewItemFetchReviewState();
//   @override
//   List<Object?> get props => [];
// }
