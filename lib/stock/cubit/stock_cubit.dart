import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:stock_repository/stock_repository.dart';
import '../model/stock.dart';

part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  final StockRepository _stockRepository;

  StockCubit(this._stockRepository) : super(StockState());

  Future<void> getStockData(String symbols, {String? exchange, DateTime? dateFrom, DateTime? dateTo, int? limit}) async {
    emit(state.copyWith(status: StockStatus.loading));

    try {
      final stock = await _stockRepository.getStocksData(symbols);
      print(stock);
      emit(state.copyWith(status: StockStatus.success, stock: stock as Stock));
    } on Exception {
      emit(state.copyWith(status: StockStatus.failure));
    }
  }
}
