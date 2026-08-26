// lib/services/api_service.dart

import 'package:flutter/material.dart';
import '../models/weather.dart';

class ApiService {
  // Por enquanto, a URL é fake. Quando o back tiver pronto, mude pra:
  // static const String baseUrl = 'http://localhost:8000';
  static const String baseUrl = 'http://api.tempoalerta.local';

  // Simula um delay de rede (remove depois que conectar com a API real)
  static Future<T> _simulateDelay<T>(T value) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return value;
  }

  // Pega o clima atual
  // Depois que o back tiver pronto, isso vai fazer um GET /clima/atual
  static Future<Weather> getCurrentWeather({String? cityId}) async {
    try {
      // TODO: Implementar chamada real
      // final response = await http.get(Uri.parse('$baseUrl/clima/atual?cidade_id=$cityId'));
      // if (response.statusCode == 200) {
      //   return Weather.fromJson(jsonDecode(response.body));
      // }

      // Por enquanto, retorna dados fake
      return _simulateDelay(Weather.fakeDayWeather());
    } catch (e) {
      debugPrint('Erro ao buscar clima atual: $e');
      rethrow;
    }
  }

  // Pega a previsão dos próximos dias
  // Depois que o back tiver pronto: GET /previsao/semanal?cidade_id=$cityId
  static Future<List<DailyForecast>> getWeeklyForecast({String? cityId}) async {
    try {
      // TODO: Implementar chamada real
      // final response = await http.get(Uri.parse('$baseUrl/previsao/semanal?cidade_id=$cityId'));
      // if (response.statusCode == 200) {
      //   final data = jsonDecode(response.body);
      //   return (data['forecasts'] as List)
      //     .map((f) => DailyForecast.fromJson(f))
      //     .toList();
      // }

      final weather = await _simulateDelay(Weather.fakeDayWeather());
      return weather.dailyForecasts;
    } catch (e) {
      debugPrint('Erro ao buscar previsão semanal: $e');
      rethrow;
    }
  }

  // Pega os alertas da cidade
  // Depois que o back tiver pronto: GET /alertas?cidade_id=$cityId
  static Future<List<Alert>> getAlerts({String? cityId}) async {
    try {
      // TODO: Implementar chamada real
      // final response = await http.get(Uri.parse('$baseUrl/alertas?cidade_id=$cityId'));
      // if (response.statusCode == 200) {
      //   final data = jsonDecode(response.body);
      //   return (data['alertas'] as List)
      //     .map((a) => Alert.fromJson(a))
      //     .toList();
      // }

      final weather = await _simulateDelay(Weather.fakeDayWeather());
      return weather.alerts;
    } catch (e) {
      debugPrint('Erro ao buscar alertas: $e');
      rethrow;
    }
  }

  // Marca um alerta como lido
  // Depois que o back tiver pronto: PUT /alertas/{id}/marcar-como-lido
  static Future<void> markAlertAsRead(int alertId) async {
    try {
      // TODO: Implementar chamada real
      // final response = await http.put(
      //   Uri.parse('$baseUrl/alertas/$alertId/marcar-como-lido'),
      // );
      // if (response.statusCode != 200) {
      //   throw Exception('Erro ao marcar alerta como lido');
      // }

      await _simulateDelay(null);
      debugPrint('Alerta $alertId marcado como lido');
    } catch (e) {
      debugPrint('Erro ao marcar alerta como lido: $e');
      rethrow;
    }
  }

  // Adiciona uma cidade aos favoritos do usuário
  // Depois que o back tiver pronto: POST /usuarios/{user_id}/cidades
  static Future<void> addCityToUser({
    required String userId,
    required String cityId,
  }) async {
    try {
      // TODO: Implementar chamada real
      // final response = await http.post(
      //   Uri.parse('$baseUrl/usuarios/$userId/cidades'),
      //   body: jsonEncode({'cidade_id': cityId}),
      // );
      // if (response.statusCode != 201) {
      //   throw Exception('Erro ao adicionar cidade');
      // }

      await _simulateDelay(null);
      debugPrint('Cidade $cityId adicionada ao usuário $userId');
    } catch (e) {
      debugPrint('Erro ao adicionar cidade: $e');
      rethrow;
    }
  }

  // Busca cidades pelo nome
  // Depois que o back tiver pronto: GET /cidades?nome=$query
  static Future<List<String>> searchCities(String query) async {
    try {
      // TODO: Implementar chamada real
      // final response = await http.get(Uri.parse('$baseUrl/cidades?nome=$query'));
      // if (response.statusCode == 200) {
      //   final data = jsonDecode(response.body);
      //   return List<String>.from(data['cidades']);
      // }

      // Dados fake pra busca
      final citiesFake = [
        'União da Vitória',
        'Curitiba',
        'São Paulo',
        'Rio de Janeiro',
      ];
      
      return _simulateDelay(
        citiesFake
            .where((city) =>
                city.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    } catch (e) {
      debugPrint('Erro ao buscar cidades: $e');
      rethrow;
    }
  }
}
