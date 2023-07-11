import 'package:bookly/Features/home/presentation/view/widget/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book_model/book_model.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel})
      : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomBookDetailsAppBar(),
              ),
              BookDetailsSection(bookModel: bookModel),
              const Expanded(child: SizedBox(height: 50)),
              const SimilarBooksSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
