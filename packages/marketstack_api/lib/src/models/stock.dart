/*
(De)Serialization
In order for code generation to work, we need to annotate our code using the following:

@JsonSerializable to label classes which can be serialized
@JsonKey to provide string representations of field names
@JsonValue to provide string representations of field values
Implement JSONConverter to convert object representations into JSON representations
For each file we also need to:

Import json_annotation
Include the generated code using the part keyword
Include fromJson methods for deserialization.

build runner command to generate code
flutter packages pub run build_runner build
 */
import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final double? volume;
  final double? adj_high;
  final double? adj_low;
  final double? adj_close;
  final double? adj_open;
  final double? adj_volume;
  final double? split_factor;
  final double? dividend;
  final String? symbol;
  final String? exchange;
  final String? date;

  const Stock(this.adj_close, this.adj_open, {this.open, this.high, this.low, this.close, this.volume,
  this.adj_high, this.adj_low, this.adj_volume, this.split_factor, this.dividend,
  this.symbol, this.exchange, this.date});

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}