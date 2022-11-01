import 'package:basalt_stock_app/stock/cubit/stock_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_repository/stock_repository.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => StockCubit(context.read<StockRepository>()), child: StockView(),);
  }
}
