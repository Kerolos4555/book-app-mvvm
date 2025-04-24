import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class NewestBooksStates {}

class InitailState extends NewestBooksStates {}

class NewestLoadingState extends NewestBooksStates {}

class NewestSuccessState extends NewestBooksStates {
  final BookModel bookModel;

  NewestSuccessState({required this.bookModel});
}

class NewestErrorState extends NewestBooksStates {
  final String errorMessage;

  NewestErrorState({required this.errorMessage});
}
