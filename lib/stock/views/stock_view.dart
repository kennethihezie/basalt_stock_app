import 'package:basalt_stock_app/stock/cubit/stock_cubit.dart';
import 'package:basalt_stock_app/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/typography.dart';
import '../model/stock_model.dart';

class StockView extends StatelessWidget {
  const StockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: textSemiBold("Stocks", BasaltColors.white),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: BasaltColors.background,
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<StockCubit, StockState>(
          listener: (context, state){
            if(state.status.isSuccess){
              print("success");
            }
          },

          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((context, index) => StockModel(symbol: 'AAPL', name: 'Apple inc', value: '100.23', counter: '-10.8',)))
              ],
            );
          /*   switch(state.status){
               case StockStatus.initial:
                 return const Text("State Initial");
               case StockStatus.loading:
                 return const Text("State Loading");
               case StockStatus.success:
                 return const Text("State Success");
               case StockStatus.failure:
                 return const Text("State failure");
             }*/
          },
        ),
      ),

      bottomNavigationBar: _buildBottomBar(),

      floatingActionButton: FloatingActionButton(onPressed: () => {
        context.read<StockCubit>().getStockData("AAPL")
      }, child: const Icon(Icons.add, color: Colors.white,),),
    );
  }

  Widget _buildBottomBar(){
    return  BottomNavigationBar(
      items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Stocks",
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: "Search",
      ),

    ],
      // currentIndex: _currentIndex,
      // onTap: (index) {
      //   setState(() {
      //     _currentIndex = index;
      //   });
      // },
    );
  }
}
