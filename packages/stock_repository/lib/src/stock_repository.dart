import 'package:marketstack_api/marketstack_api.dart';

class StockRepository {
  final MarketStackApiClient _stockApiClient;
  StockRepository({MarketStackApiClient? marketStackApiClient}) : _stockApiClient = marketStackApiClient ?? MarketStackApiClient();

  Future<Stock> getStocksData(String symbols, {String? exchange, StockSort? sort, DateTime? dateFrom, DateTime? dateTo, int? limit}) async {
    return await _stockApiClient.getStockData(symbols, exchange: exchange, sort: sort, date_from: dateFrom, date_to: dateTo, limit: limit);
  }
}