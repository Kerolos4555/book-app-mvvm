import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.searchRepo}) : super(InitialState());

  final SearchRepo searchRepo;
  Future<void> fetchResultsBooks({required String q}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.fetchResults(q: q);
    result.fold(
      (failure) {
        emit(
          SearchErrorState(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (bookModel) {
        emit(
          SearchSuccessState(
            bookModel: bookModel,
          ),
        );
      },
    );
  }
}
