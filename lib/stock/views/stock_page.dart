import 'package:basalt_stock_app/di/di.dart';
import 'package:basalt_stock_app/stock/cubit/stock_cubit.dart';
import 'package:basalt_stock_app/stock/views/stock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketstack_api/marketstack_api.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => StockCubit(DiContainer.getIt.get<StockRepository>()), child: const StockView(),);
  }
}
