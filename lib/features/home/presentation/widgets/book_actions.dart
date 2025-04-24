import 'package:bookly_app/core/helper/helper_functions.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  final Item bookItem;
  const BookActions({super.key, required this.bookItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPress: () async {
                launchCustomUrl(context, bookItem.volumeInfo!.previewLink);
              },
              text: bookItem.volumeInfo!.previewLink == null
                  ? 'Not Avaliable'
                  : 'Preview',
              textColor: Colors.white,
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
