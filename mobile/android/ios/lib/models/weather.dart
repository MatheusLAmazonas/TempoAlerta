// lib/models/weather.dart

class Weather {
  final String cityName;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final double humidity;
  final String condition; // 'sunny', 'cloudy', 'rainy', etc
  final String period; // 'day', 'afternoon', 'night'
  final List<HourlyForecast> hourlyForecasts;
  final List<DailyForecast> dailyForecasts;
  final List<Alert> alerts;

  Weather({
    required this.cityName,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.condition,
    required this.period,
    required this.hourlyForecasts,
    required this.dailyForecasts,
    required this.alerts,
  });

  // Dados fake pra testes
  static Weather fakeDayWeather() {
    return Weather(
      cityName: 'União da Vitória',
      currentTemp: 18,
      maxTemp: 23,
      minTemp: 12,
      humidity: 75,
      condition: 'cloudy',
      period: 'day',
      hourlyForecasts: [
        HourlyForecast(time: '11:00', condition: 'cloudy'),
        HourlyForecast(time: '12:00', condition: 'cloudy'),
        HourlyForecast(time: '13:00', condition: 'sunny'),
        HourlyForecast(time: '14:00', condition: 'sunny'),
        HourlyForecast(time: '15:00', condition: 'sunny'),
        HourlyForecast(time: '16:00', condition: 'rainy'),
      ],
      dailyForecasts: [
        DailyForecast(
          day: 'Quarta-Feira',
          condition: 'cloudy',
          maxTemp: 23,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Quinta-Feira',
          condition: 'cloudy',
          maxTemp: 22,
          minTemp: 11,
        ),
        DailyForecast(
          day: 'Sexta-Feira',
          condition: 'sunny',
          maxTemp: 25,
          minTemp: 13,
        ),
        DailyForecast(
          day: 'Sábado',
          condition: 'cloudy',
          maxTemp: 20,
          minTemp: 10,
        ),
        DailyForecast(
          day: 'Domingo',
          condition: 'cloudy',
          maxTemp: 21,
          minTemp: 11,
        ),
        DailyForecast(
          day: 'Segunda-Feira',
          condition: 'cloudy',
          maxTemp: 22,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Terça-Feira',
          condition: 'sunny',
          maxTemp: 24,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Quarta-Feira',
          condition: 'sunny',
          maxTemp: 26,
          minTemp: 13,
        ),
        DailyForecast(
          day: 'Quinta-Feira',
          condition: 'sunny',
          maxTemp: 27,
          minTemp: 14,
        ),
      ],
      alerts: [
        Alert(
          id: 1,
          title: 'Alerta de chuvas fortes',
          description: 'Previsão para chuvas fortes com risco de alagamento.',
          type: 'heavy_rain',
          severity: 'high', // 'low', 'medium', 'high'
          startTime: '13:30',
          endTime: '17:00',
          location: 'União da Vitória, PR',
        ),
        Alert(
          id: 2,
          title: 'Alerta de Tornados',
          description:
              'Previsão para ocorrência de Tornados com grau 1 de intensidade.',
          type: 'tornado',
          severity: 'medium',
          startTime: '15:00',
          endTime: '16:00',
          location: 'União da Vitória, PR',
        ),
      ],
    );
  }

  static Weather fakeAfternoonWeather() {
    return Weather(
      cityName: 'União da Vitória',
      currentTemp: 22,
      maxTemp: 26,
      minTemp: 15,
      humidity: 60,
      condition: 'sunny',
      period: 'afternoon',
      hourlyForecasts: [
        HourlyForecast(time: '14:00', condition: 'sunny'),
        HourlyForecast(time: '15:00', condition: 'sunny'),
        HourlyForecast(time: '16:00', condition: 'sunny'),
        HourlyForecast(time: '17:00', condition: 'sunny'),
        HourlyForecast(time: '18:00', condition: 'cloudy'),
        HourlyForecast(time: '19:00', condition: 'cloudy'),
      ],
      dailyForecasts: [
        DailyForecast(
          day: 'Quarta-Feira',
          condition: 'sunny',
          maxTemp: 26,
          minTemp: 15,
        ),
        DailyForecast(
          day: 'Quinta-Feira',
          condition: 'sunny',
          maxTemp: 25,
          minTemp: 14,
        ),
        DailyForecast(
          day: 'Sexta-Feira',
          condition: 'cloudy',
          maxTemp: 23,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Sábado',
          condition: 'sunny',
          maxTemp: 27,
          minTemp: 16,
        ),
        DailyForecast(
          day: 'Domingo',
          condition: 'cloudy',
          maxTemp: 21,
          minTemp: 11,
        ),
        DailyForecast(
          day: 'Segunda-Feira',
          condition: 'rainy',
          maxTemp: 19,
          minTemp: 10,
        ),
        DailyForecast(
          day: 'Terça-Feira',
          condition: 'sunny',
          maxTemp: 25,
          minTemp: 13,
        ),
        DailyForecast(
          day: 'Quarta-Feira',
          condition: 'sunny',
          maxTemp: 28,
          minTemp: 15,
        ),
        DailyForecast(
          day: 'Quinta-Feira',
          condition: 'cloudy',
          maxTemp: 24,
          minTemp: 13,
        ),
      ],
      alerts: [],
    );
  }

  static Weather fakeNightWeather() {
    return Weather(
      cityName: 'União da Vitória',
      currentTemp: 15,
      maxTemp: 20,
      minTemp: 12,
      humidity: 85,
      condition: 'cloudy',
      period: 'night',
      hourlyForecasts: [
        HourlyForecast(time: '20:00', condition: 'cloudy'),
        HourlyForecast(time: '21:00', condition: 'cloudy'),
        HourlyForecast(time: '22:00', condition: 'rainy'),
        HourlyForecast(time: '23:00', condition: 'rainy'),
        HourlyForecast(time: '00:00', condition: 'cloudy'),
        HourlyForecast(time: '01:00', condition: 'cloudy'),
      ],
      dailyForecasts: [
        DailyForecast(
          day: 'Quarta-Feira',
          condition: 'cloudy',
          maxTemp: 20,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Quinta-Feira',
          condition: 'rainy',
          maxTemp: 18,
          minTemp: 10,
        ),
        DailyForecast(
          day: 'Sexta-Feira',
          condition: 'cloudy',
          maxTemp: 21,
          minTemp: 11,
        ),
        DailyForecast(
          day: 'Sábado',
          condition: 'sunny',
          maxTemp: 25,
          minTemp: 14,
        ),
        DailyForecast(
          day: 'Domingo',
          condition: 'cloudy',
          maxTemp: 19,
          minTemp: 10,
        ),
        DailyForecast(
          day: 'Segunda-Feira',
          condition: 'rainy',
          maxTemp: 17,
          minTemp: 9,
        ),
        DailyForecast(
          day: 'Terça-Feira',
          condition: 'sunny',
          maxTemp: 23,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Quarta-Feira',
          condition: 'cloudy',
          maxTemp: 22,
          minTemp: 12,
        ),
        DailyForecast(
          day: 'Quinta-Feira',
          condition: 'cloudy',
          maxTemp: 20,
          minTemp: 11,
        ),
      ],
      alerts: [
        Alert(
          id: 1,
          title: 'Alerta de Geada',
          description:
              'Previsão para quedas de temperaturas com possibilidade de geada.',
          type: 'frost',
          severity: 'medium',
          startTime: '02:00',
          endTime: '06:00',
          location: 'União da Vitória, PR',
        ),
      ],
    );
  }
}

class HourlyForecast {
  final String time;
  final String condition;

  HourlyForecast({
    required this.time,
    required this.condition,
  });
}

class DailyForecast {
  final String day;
  final String condition;
  final double maxTemp;
  final double minTemp;

  DailyForecast({
    required this.day,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });
}

class Alert {
  final int id;
  final String title;
  final String description;
  final String type; // 'heavy_rain', 'tornado', 'frost', etc
  final String severity; // 'low', 'medium', 'high'
  final String startTime;
  final String endTime;
  final String location;

  Alert({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.severity,
    required this.startTime,
    required this.endTime,
    required this.location,
  });
}
