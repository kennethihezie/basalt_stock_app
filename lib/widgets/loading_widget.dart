import 'package:basalt_stock_app/widgets/typography.dart';
import 'package:basalt_stock_app/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),

          const Padding(padding: EdgeInsets.only(top: 8.0)),

          textSmall("Loading Stocks", BasaltColors.A181212)
        ],
      ),
    );
  }
}
