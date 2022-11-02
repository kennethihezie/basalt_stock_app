import 'package:basalt_stock_app/widgets/typography.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/colors.dart';

class StockModel extends StatelessWidget {
   StockModel({Key? key, required this.symbol, required this.name, required this.value, required this.counter, }) : super(key: key);
   final String symbol;
   final String name;
   final String value;
   final String counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: BasaltColors.white,
        borderRadius: BorderRadius.circular(12.5),
      ),

      child: Row(
        children: [
          textSemiBold(symbol, BasaltColors.A181212),

          const Padding(padding: EdgeInsets.only(left: 8.0)),

          textMiniTextRegular(name, BasaltColors.A181212),

          const Spacer(),

          textSemiBold(value, BasaltColors.A181212),

          const Padding(padding: EdgeInsets.only(left: 8.0)),

          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: BasaltColors.green,
              borderRadius: BorderRadius.circular(8.0)
            ),

            child: textSmall(counter, BasaltColors.white),
          )
        ],
      ),
    );
  }
}
