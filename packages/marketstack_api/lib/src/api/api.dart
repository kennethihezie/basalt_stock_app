import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../marketstack_api.dart';

final _accessKey = '38664d59e2c8261420fbf2726390dd2e';

class StockRequestFailure implements Exception {}

class StockNotFoundFailure implements Exception {}

enum StockSort{
  DESC,
  ASC
}

class MarketStackApiClient {
  final http.Client _httpClient;
  MarketStackApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  static const _baseUrlWeather = 'https://api.marketstack.com/v1';

  Future<Stock> getStockData(String symbols, {String? exchange, StockSort? sort, DateTime? date_from, DateTime? date_to, int? limit}) async {
    final stockRequest = Uri.https(
      _baseUrlWeather,
      '/intraday/latest',
      {'access_key': _accessKey, 'symbols': symbols, 'exchange': exchange, 'sort': sort, 'date_from': date_from, 'date_to': date_to, 'limit': limit}
    );

    final stockResponse = await _httpClient.get(stockRequest);
    if(stockResponse.statusCode != 200){
      throw StockRequestFailure();
    }

    final stockJson = jsonDecode(stockResponse.body) as Map;
    if(!stockJson.containsKey('data')) throw StockNotFoundFailure();

    final results = stockJson['data'] as List;
    if(results.isEmpty) throw StockNotFoundFailure();

    return Stock.fromJson(results.first as Map<String, dynamic>);
  }

}