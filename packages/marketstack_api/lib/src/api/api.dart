import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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

  static const _baseUrlWeather = 'http://api.marketstack.com/v1/intraday';

  Future<Stock> getStockData(String symbols, {DateTime? date_from, DateTime? date_to, int? limit}) async {
    final dateFormat = DateFormat('y-M-d');
    // final stockResponse = await _httpClient.get(Uri.parse("$_baseUrlWeather?access_key=$_accessKey&symbols=$symbols&date_from=${dateFormat.format(date_from ?? DateTime.now())}&date_to=${dateFormat.format(date_to ?? DateTime.now())}&limit=$limit"));
    final stockResponse = await _httpClient.get(Uri.parse("$_baseUrlWeather?access_key=$_accessKey&symbols=$symbols&limit=$limit"));

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