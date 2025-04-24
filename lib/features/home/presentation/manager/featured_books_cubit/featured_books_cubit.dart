import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit({required this.homeRepo}) : super(InitialState());

  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedErrorState(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (bookModel) {
        emit(
          FeaturedSuccessState(
            bookModel: bookModel,
          ),
        );
      },
    );
  }
}
