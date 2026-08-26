// lib/providers/weather_provider.dart

import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/api_service.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;
  List<Alert> _alerts = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  Weather? get weather => _weather;
  List<Alert> get alerts => _alerts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Carrega o clima atual
  Future<void> loadWeather({String? cityId}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await ApiService.getCurrentWeather(cityId: cityId);
      _alerts = _weather?.alerts ?? [];
      _error = null;
    } catch (e) {
      _error = 'Erro ao carregar clima: $e';
      debugPrint(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Carrega alertas
  Future<void> loadAlerts({String? cityId}) async {
    try {
      _alerts = await ApiService.getAlerts(cityId: cityId);
      _error = null;
    } catch (e) {
      _error = 'Erro ao carregar alertas: $e';
      debugPrint(_error);
    }
    notifyListeners();
  }

  // Marca um alerta como lido
  Future<void> markAlertAsRead(int alertId) async {
    try {
      await ApiService.markAlertAsRead(alertId);
      // Remove o alerta da lista local (ou marca como lido)
      _alerts.removeWhere((alert) => alert.id == alertId);
      _error = null;
    } catch (e) {
      _error = 'Erro ao marcar alerta como lido: $e';
      debugPrint(_error);
    }
    notifyListeners();
  }

  // Recarrega o clima (pull to refresh)
  Future<void> refreshWeather({String? cityId}) async {
    await loadWeather(cityId: cityId);
  }

  // Define o clima manualmente (útil pra testes)
  void setWeatherFake(String period) {
    _isLoading = false;
    _error = null;
    
    switch (period.toLowerCase()) {
      case 'afternoon':
        _weather = Weather.fakeAfternoonWeather();
        break;
      case 'night':
        _weather = Weather.fakeNightWeather();
        break;
      case 'day':
      default:
        _weather = Weather.fakeDayWeather();
        break;
    }
    
    _alerts = _weather?.alerts ?? [];
    notifyListeners();
  }

  // Limpa os dados
  void clearWeather() {
    _weather = null;
    _alerts = [];
    _error = null;
    notifyListeners();
  }
}
