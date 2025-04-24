import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class SimilarBooksStates {}

class InitialState extends SimilarBooksStates {}

class SimilarBooksLoadingState extends SimilarBooksStates {}

class SimilarBooksSuccessState extends SimilarBooksStates {
  final BookModel bookModel;
  SimilarBooksSuccessState({required this.bookModel});
}

class SimilarBooksErrorState extends SimilarBooksStates {
  final String errorMessage;
  SimilarBooksErrorState({required this.errorMessage});
}
