import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import '../../../../home/presentation/view/widget/custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(height: 16),
          Text(
            'Search Result',
            style: Style.textStyle18,
          ),
          SizedBox(height: 16),
          //Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       //shrinkWrap: true,
//       padding: EdgeInsets.zero,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: BookListViewItem(),
//         );
//       },
//     );
//   }
// }
