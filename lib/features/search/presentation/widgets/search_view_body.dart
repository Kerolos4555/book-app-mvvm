import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_results_list.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(
            onChange: (value) {
              BlocProvider.of<SearchCubit>(context).fetchResultsBooks(q: value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Results',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 8,
          ),
          const Expanded(
            child: SearchResultsList(),
          ),
        ],
      ),
    );
  }
}
