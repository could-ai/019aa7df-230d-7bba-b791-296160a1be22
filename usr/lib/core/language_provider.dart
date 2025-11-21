import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('fr');

  Locale get locale => _locale;
  bool get isFrench => _locale.languageCode == 'fr';

  void toggleLanguage() {
    _locale = _locale.languageCode == 'fr' 
        ? const Locale('ar') 
        : const Locale('fr');
    notifyListeners();
  }

  // Helper for simple translations (In a real app, use intl package or arb files)
  String getText(String key) {
    if (_locale.languageCode == 'fr') {
      return _fr[key] ?? key;
    } else {
      return _ar[key] ?? key;
    }
  }

  static final Map<String, String> _fr = {
    'app_title': 'Languamie',
    'welcome': 'Bienvenue !',
    'learn_basics': 'Apprends les bases du Français',
    'alphabet': 'Alphabet',
    'numbers': 'Chiffres',
    'i_am_student': 'Je suis Parent/Élève',
    'i_am_teacher': 'Je suis Enseignant',
    'premium_offer': 'Abonnement Premium',
    'unlock_all': 'Débloquez tout le contenu !',
    'price': '500 DA / mois',
    'pay_now': 'Payer Maintenant',
    'payment_method': 'Méthode de paiement',
    'card_cib': 'Carte CIB',
    'card_gold': 'Carte Eddahabia',
  };

  static final Map<String, String> _ar = {
    'app_title': 'Languamie',
    'welcome': 'mrahba !', // Phonetic for simplicity in this demo
    'learn_basics': 'تعلم أساسيات اللغة الفرنسية',
    'alphabet': 'الحروف',
    'numbers': 'الأرقام',
    'i_am_student': 'أنا ولي أمر / تلميذ',
    'i_am_teacher': 'أنا معلم',
    'premium_offer': 'اشتراك مميز',
    'unlock_all': 'افتح جميع المحتويات!',
    'price': '500 دج / شهر',
    'pay_now': 'ادفع الآن',
    'payment_method': 'طريقة الدفع',
    'card_cib': 'بطاقة CIB',
    'card_gold': 'الذهبية',
  };
}
