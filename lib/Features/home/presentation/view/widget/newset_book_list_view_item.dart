import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/view/widget/custom_book_image.dart';
import 'package:bookly/core/utils/routes.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  final BookModel? bookModel;

  const BookListViewItem({Key? key, this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.bookDetailsView, arguments: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
                imgUrl: bookModel!.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                      bookModel!.volumeInfo.title!,
                      style:
                          Style.textStyle20.copyWith(fontFamily: kGtSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(bookModel!.volumeInfo.authors![0],
                      style: Style.textStyle14),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Style.textStyle16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        mainAxisAlignment: MainAxisAlignment.start,
                        rating: bookModel!.volumeInfo.averageRating ?? 4.5,
                        count: bookModel!.volumeInfo.ratingsCount ?? 245,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
