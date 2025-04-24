import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rate.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_books_list.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final Item bookItem;
  const BookDetailsViewBody({super.key, required this.bookItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const BookDetailsAppBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.23,
                    ),
                    child: BookImage(
                      radius: 16,
                      imageURL:
                          bookItem.volumeInfo!.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  Text(
                    bookItem.volumeInfo!.title!,
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: Text(
                      textAlign: TextAlign.center,
                      bookItem.volumeInfo!.authors?[0] ?? '',
                      style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  BookRate(
                    rating: bookItem.volumeInfo!.averageRating ?? 0,
                    count: bookItem.volumeInfo!.ratingsCount ?? 0,
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  BookActions(
                    bookItem: bookItem,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SimilarBooksList(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
