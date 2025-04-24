import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, BookModel>> fetchResults({required String q}) async {
    try {
      var data = await apiService.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=$q',
      );
      return right(
        BookModel.fromJson(data),
      );
    } catch (error) {
      if (error is DioException) {
        return left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }
}
