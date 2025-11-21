import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:languamie/core/language_provider.dart';
import 'package:languamie/core/theme.dart';
import 'features/home/home_screen.dart';
import 'features/auth/role_selection_screen.dart';
import 'features/payment/payment_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return MaterialApp(
      title: 'Languamie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Handle RTL/LTR based on selected language
      locale: languageProvider.locale,
      supportedLocales: const [
        Locale('fr'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        // In a real app, add GlobalMaterialLocalizations.delegate here
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/role-selection': (context) => const RoleSelectionScreen(),
        '/payment': (context) => const PaymentScreen(),
      },
    );
  }
}
