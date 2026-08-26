import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const TempoAlertaApp());
}

class TempoAlertaApp extends StatelessWidget {
  const TempoAlertaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider do clima - gerencia os dados de clima e alertas
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'TempoAlerta',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: AppTheme.fontFamily,
          textTheme: AppTheme.getTextTheme(),
          // Cor primária (não vai usar muito, mas deixa configurado)
          primaryColor: AppTheme.dayPrimaryGradientStart,
          // Remover o leading de volta da AppBar se não usarmos
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        // Remove o banner de debug
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
