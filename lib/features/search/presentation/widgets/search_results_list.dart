import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BookItem(
                bookItem: state.bookModel.items![index],
              ),
            ),
            separatorBuilder: (context, index) => Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[700],
            ),
            itemCount: state.bookModel.items!.length,
          );
        } else if (state is SearchErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchLoadingState) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text(
              'Searching....',
              style: Styles.textStyle20,
            ),
          );
        }
      },
    );
  }
}
