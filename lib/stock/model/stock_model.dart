import 'package:basalt_stock_app/widgets/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketstack_api/marketstack_api.dart';

import '../../widgets/colors.dart';

class StockModel extends StatelessWidget {
   StockModel({Key? key, required this.stock}) : super(key: key);
   final Stock stock;

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
          textSemiBold(stock.symbol ?? '', BasaltColors.A181212),

          const Padding(padding: EdgeInsets.only(left: 8.0)),

          textMiniTextRegular(stock.name ?? '', BasaltColors.A181212),

          const Spacer(),

          textSemiBold(stock.open.toString() ?? '', BasaltColors.A181212),

          const Padding(padding: EdgeInsets.only(left: 8.0)),

          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: BasaltColors.green,
              borderRadius: BorderRadius.circular(8.0)
            ),

            child: textSmall("+ ${(stock.high! - stock.low!).toStringAsPrecision(2)}" ?? '', BasaltColors.white),
          )
        ],
      ),
    );
  }
}
