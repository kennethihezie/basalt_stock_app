import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:marketstack_api/marketstack_api.dart';
part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  final StockRepository _stockRepository;

  StockCubit(this._stockRepository) : super(const StockState());

  Future<void> getStockData(String symbols, {DateTime? dateFrom, DateTime? dateTo, int? limit}) async {
    emit(state.copyWith(status: StockStatus.loading));

    try {
      final stock = await _stockRepository.getStocksData(symbols, dateFrom: dateFrom, dateTo: dateTo, limit: limit);
      emit(state.copyWith(status: StockStatus.success, stock: stock));
    } on Exception {
      emit(state.copyWith(status: StockStatus.failure));
    }
  }
}
