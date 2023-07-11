import 'package:bookly/Features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/core/utils/widget/custom_error_widget.dart';
import 'package:bookly/core/utils/widget/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: size.height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(imgUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? ''),
                );
              },
            ),
          );
        }else if (state is SimilarBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
