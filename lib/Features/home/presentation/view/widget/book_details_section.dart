import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .30),
          child: CustomBookImage(
              imgUrl: bookModel.volumeInfo.imageLinks!.thumbnail),
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo.title!,
          style: Style.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.8,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Style.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 4.5,
          count: bookModel.volumeInfo.ratingsCount ?? 245,
        ),
        const SizedBox(height: 37),
         BooksAction(bookModel: bookModel),
      ],
    );
  }
}
