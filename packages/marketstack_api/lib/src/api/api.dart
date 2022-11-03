import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:marketstack_api/src/models/tickers.dart';
import '../../marketstack_api.dart';

final _accessKey = '182ba6ee7d8fcc4c6e4bbfdaa07de004';

class StockRequestFailure implements Exception {}

class StockNotFoundFailure implements Exception {}


class MarketStackApiClient {
  final http.Client _httpClient;
  MarketStackApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  static const _baseUrlWeather = 'http://api.marketstack.com/v1';

  Future<List<Stock>> getStockData({String? date_from, String? date_to}) async {
     final getTickersResponse = await _httpClient.get(Uri.parse("$_baseUrlWeather/tickers?access_key=$_accessKey&limit=10"));

     if(getTickersResponse.statusCode != 200){
       throw StockRequestFailure();
     }

     final tickerJson = jsonDecode(getTickersResponse.body) as Map;
     if(!tickerJson.containsKey('data')) throw StockNotFoundFailure();

     final tickersResult = tickerJson['data'] as List;
     if(tickersResult.isEmpty) throw StockNotFoundFailure();

     final tickers = List<Tickers>.from(tickersResult.map((data) => Tickers.fromJson(data as Map<String, dynamic>)));

     final stockSymbols = [];

     for(var i in tickers){
       stockSymbols.add(i.symbol);
     }

     final stockResponse = await _httpClient.get(Uri.parse("$_baseUrlWeather/intraday?access_key=$_accessKey&symbols=${stockSymbols.join(',')}&limit=10"));

    if(stockResponse.statusCode != 200){
      throw StockRequestFailure();
    }

    final stockJson = jsonDecode(stockResponse.body) as Map;
    if(!stockJson.containsKey('data')) throw StockNotFoundFailure();

    log("STC $stockJson");

    final results = stockJson['data'] as List;
    if(results.isEmpty) throw StockNotFoundFailure();

    return List<Stock>.from(results.map((data) {
      final stock = Stock.fromJson(data as Map<String, dynamic>);
      for(var i in tickers){
        if(i.symbol == stock.symbol){
          stock.name = i.name;
        }
      }
      return stock;
    }));
  }

}