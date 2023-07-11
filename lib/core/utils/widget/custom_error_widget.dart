import 'package:flutter/material.dart';

import '../style.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;
  const CustomErrorWidget({Key? key, required this.errMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage , style: Style.textStyle18, textAlign: TextAlign.center,));
  }
}
