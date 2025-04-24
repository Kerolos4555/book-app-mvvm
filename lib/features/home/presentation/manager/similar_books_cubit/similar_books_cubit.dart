import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit({required this.homeRepo}) : super(InitialState());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(
          SimilarBooksErrorState(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (bookModel) {
        emit(
          SimilarBooksSuccessState(
            bookModel: bookModel,
          ),
        );
      },
    );
  }
}
