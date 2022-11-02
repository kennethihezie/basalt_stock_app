import 'package:basalt_stock_app/stock/cubit/stock_observer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'App/app.dart';
import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //init getit
  DiContainer();

  Bloc.observer = StockObserverBloc();
  runApp(const MyApp());
}
