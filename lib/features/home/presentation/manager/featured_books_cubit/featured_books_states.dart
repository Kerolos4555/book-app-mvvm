import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class FeaturedBooksStates {}

class InitialState extends FeaturedBooksStates {}

class FeaturedLoadingState extends FeaturedBooksStates {}

class FeaturedSuccessState extends FeaturedBooksStates {
  final BookModel bookModel;

  FeaturedSuccessState({required this.bookModel});
}

class FeaturedErrorState extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedErrorState({required this.errorMessage});
}
