import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit({required this.homeRepo}) : super(InitailState());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestLoadingState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(
          NewestErrorState(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (bookModel) {
        emit(
          NewestSuccessState(
            bookModel: bookModel,
          ),
        );
      },
    );
  }
}
