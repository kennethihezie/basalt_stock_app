import 'package:basalt_stock_app/stock/cubit/stock_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockView extends StatelessWidget {
  const StockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<StockCubit, StockState>(
          listener: (context, state){
            if(state.status.isSuccess){

            }
          },

          builder: (context, state) {

          },
        ),
      ),
    );
  }
}
