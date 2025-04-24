import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&sorting=newest&q=computer science',
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

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=subject:programming',
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

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming',
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
