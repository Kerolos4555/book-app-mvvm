import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class SearchStates {}

class InitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final BookModel bookModel;
  SearchSuccessState({required this.bookModel});
}

class SearchErrorState extends SearchStates {
  final String errorMessage;
  SearchErrorState({required this.errorMessage});
}
