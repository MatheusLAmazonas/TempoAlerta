// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../utils/theme.dart';
import '../widgets/alert_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Carrega o clima ao iniciar a tela, usando dados fake até o retorno do back
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().setWeatherFake('day');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        final weather = weatherProvider.weather;

        // Se não tiver dados, mostra carregamento
        if (weather == null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Carregando clima...'),
                ],
              ),
            ),
          );
        }

        // Pega as cores baseado no período
        final colors = AppTheme.getColorsByPeriod(weather.period);
        final textTheme = AppTheme.getTextTheme();

        return Scaffold(
          body: Container(
            // Fundo com gradiente baseado no período
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colors.gradientStart,
                  colors.gradientEnd,
                ],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                // Barra superior com status bar customizado
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors.gradientStart,
                            colors.gradientEnd,
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: colors.cardBackground,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // TODO: Abrir tela de adicionar cidade
                              debugPrint('Adicionar cidade');
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Icon(
                              Icons.add,
                              color: colors.textPrimary,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Conteúdo principal
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),

                        // Nome da cidade
                        Text(
                          weather.cityName,
                          style: textTheme.headlineLarge!.copyWith(
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Subtítulo (tipo de medição)
                        Text(
                          'Média umidade',
                          style: textTheme.headlineSmall!.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Temperatura grande
                        Text(
                          '${weather.currentTemp.toStringAsFixed(0)}° C',
                          style: textTheme.displayLarge!.copyWith(
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Máx/Mín
                        Text(
                          'Máx.: ${weather.maxTemp.toStringAsFixed(0)}° Mín.: ${weather.minTemp.toStringAsFixed(0)}°',
                          style: textTheme.bodyLarge!.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Card de previsão por hora
                        _HourlyForecastCard(
                          hourlyForecasts: weather.hourlyForecasts,
                          cardColor: colors.cardBackground,
                          textColor: colors.textPrimary,
                        ),
                        const SizedBox(height: 32),

                        // Previsão dos próximos dias
                        Text(
                          'Próximos dias',
                          style: textTheme.labelLarge!.copyWith(
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Lista de dias
                        ..._buildDailyForecastList(
                          weather.dailyForecasts,
                          colors.textSecondary,
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),

                // Seção de alertas (só aparece se houver alertas)
                if (weather.alerts.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '⚠️ Alertas meteorológicos',
                            style: textTheme.labelLarge!.copyWith(
                              color: colors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Lista de alertas
                          ...weather.alerts.map((alert) {
                            return AlertCard(
                              alert: alert,
                              onDismiss: () {
                                context
                                    .read<WeatherProvider>()
                                    .markAlertAsRead(alert.id);
                              },
                              onTap: () {
                                // TODO: Abrir detalhes do alerta
                                debugPrint('Alerta ${alert.id} tapped');
                              },
                            );
                          }).toList(),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Função auxiliar pra construir a lista de dias
  List<Widget> _buildDailyForecastList(
    List<dynamic> forecasts,
    Color textColor,
  ) {
    return forecasts.map((forecast) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              forecast.day,
              style: AppTheme.getTextTheme().labelLarge!.copyWith(
                    color: textColor,
                  ),
            ),
            // TODO: Adicionar ícone do clima baseado em forecast.condition
            Icon(
              _getWeatherIcon(forecast.condition),
              color: textColor,
              size: 20,
            ),
          ],
        ),
      );
    }).toList();
  }

  // Função auxiliar pra obter ícone do clima
  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Icons.wb_sunny_outlined;
      case 'cloudy':
      case 'cloud':
        return Icons.cloud_outlined;
      case 'rainy':
      case 'rain':
        return Icons.cloud_queue_outlined;
      case 'stormy':
      case 'storm':
        return Icons.cloud_queue_outlined;
      default:
        return Icons.cloud_outlined;
    }
  }
}

// Widget para a seção de previsão por hora
class _HourlyForecastCard extends StatelessWidget {
  final List<dynamic> hourlyForecasts;
  final Color cardColor;
  final Color textColor;

  const _HourlyForecastCard({
    required this.hourlyForecasts,
    required this.cardColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hora inicial
          Text(
            hourlyForecasts.isNotEmpty ? hourlyForecasts.first.time : '--:--',
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 12),
          // Linha de ícones
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hourlyForecasts
                  .map((forecast) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        _getWeatherIcon(forecast.condition),
                        color: textColor,
                        size: 24,
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Icons.wb_sunny_outlined;
      case 'cloudy':
      case 'cloud':
        return Icons.cloud_outlined;
      case 'rainy':
      case 'rain':
        return Icons.cloud_queue_outlined;
      case 'stormy':
      case 'storm':
        return Icons.cloud_queue_outlined;
      default:
        return Icons.cloud_outlined;
    }
  }
}
