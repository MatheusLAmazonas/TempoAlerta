// lib/utils/theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  // Cores para o período DAY (dia - azul claro)
  static const Color dayPrimaryGradientStart = Color(0xFF4BB4D9);
  static const Color dayPrimaryGradientEnd = Color(0xFF7DD3FC);
  static const Color dayAccent = Color(0xFF2E7D99);
  static const Color dayCardBackground = Color(0xFF3E8FA3);
  static const Color dayTextPrimary = Colors.white;
  static const Color dayTextSecondary = Color(0xFFE0F2FE);

  // Cores para o período AFTERNOON (tarde - amarelo/verde)
  static const Color afternoonPrimaryGradientStart = Color(0xFFC4B244);
  static const Color afternoonPrimaryGradientEnd = Color(0xFF7DD57F);
  static const Color afternoonAccent = Color(0xFF9A9035);
  static const Color afternoonCardBackground = Color(0xFF5A9A5F);
  static const Color afternoonTextPrimary = Colors.white;
  static const Color afternoonTextSecondary = Color(0xFFF5F5DC);

  // Cores para o período NIGHT (noite - azul escuro)
  static const Color nightPrimaryGradientStart = Color(0xFF1A3A52);
  static const Color nightPrimaryGradientEnd = Color(0xFF2D5A7B);
  static const Color nightAccent = Color(0xFF4A90E2);
  static const Color nightCardBackground = Color(0xFF2E5F7F);
  static const Color nightTextPrimary = Colors.white;
  static const Color nightTextSecondary = Color(0xFFB0C4DE);

  // Cores para alertas (iguais em todos os temas)
  static const Color alertSeverityHigh = Color(0xFFE53935); // Vermelho (chuva forte)
  static const Color alertSeverityMedium = Color(0xFF7D6B5F); // Cinza/Oliva (tornados)
  static const Color alertSeverityLow = Color(0xFF4BB4D9); // Azul (geada)

  // Tipografia
  static const String fontFamily = 'Roboto';

  static TextTheme getTextTheme() {
    return const TextTheme(
      // Título grande (nome da cidade)
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      // Subtítulo (média umidade)
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.3,
      ),
      // Temperatura grande
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
      ),
      // Máx/Mín
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
      // Labels de dias
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      // Título de alerta
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
      // Descrição de alerta
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
    );
  }

  // Função pra retornar cores baseado no período
  static ThemeColors getColorsByPeriod(String period) {
    switch (period.toLowerCase()) {
      case 'afternoon':
        return ThemeColors(
          gradientStart: afternoonPrimaryGradientStart,
          gradientEnd: afternoonPrimaryGradientEnd,
          accent: afternoonAccent,
          cardBackground: afternoonCardBackground,
          textPrimary: afternoonTextPrimary,
          textSecondary: afternoonTextSecondary,
        );
      case 'night':
        return ThemeColors(
          gradientStart: nightPrimaryGradientStart,
          gradientEnd: nightPrimaryGradientEnd,
          accent: nightAccent,
          cardBackground: nightCardBackground,
          textPrimary: nightTextPrimary,
          textSecondary: nightTextSecondary,
        );
      case 'day':
      default:
        return ThemeColors(
          gradientStart: dayPrimaryGradientStart,
          gradientEnd: dayPrimaryGradientEnd,
          accent: dayAccent,
          cardBackground: dayCardBackground,
          textPrimary: dayTextPrimary,
          textSecondary: dayTextSecondary,
        );
    }
  }

  // Cor do alerta baseado na severidade
  static Color getAlertColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
        return alertSeverityHigh;
      case 'medium':
        return alertSeverityMedium;
      case 'low':
      default:
        return alertSeverityLow;
    }
  }
}

// Classe auxiliar pra armazenar cores
class ThemeColors {
  final Color gradientStart;
  final Color gradientEnd;
  final Color accent;
  final Color cardBackground;
  final Color textPrimary;
  final Color textSecondary;

  ThemeColors({
    required this.gradientStart,
    required this.gradientEnd,
    required this.accent,
    required this.cardBackground,
    required this.textPrimary,
    required this.textSecondary,
  });
}
