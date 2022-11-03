import 'package:basalt_stock_app/widgets/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Center(child: textSemiBold("No Network.", BasaltColors.A181212));;
  }
}
