import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/view/home_view.dart';
import 'package:bookly/Features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/core/service_locator.dart';
import 'package:bookly/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/presentation/view/book_details_view.dart';
import '../../Features/search/presentation/view/search_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );

    case AppRoutes.homeView:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
        settings: settings,
      );

    case AppRoutes.bookDetailsView:
      final bookModel = settings.arguments as BookModel ;
      return MaterialPageRoute(
        builder: (_) =>
            BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child:  BookDetailsView(bookModel: bookModel),
            ),
        settings: settings,
      );

    case AppRoutes.searchView:
      return MaterialPageRoute(
        builder: (_) => const SearchView(),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );
  }
}
