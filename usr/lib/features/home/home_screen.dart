import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:languamie/core/language_provider.dart';
import 'package:languamie/core/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FlutterTts flutterTts = FlutterTts();

  final List<String> alphabet = List.generate(26, (index) => String.fromCharCode(65 + index));
  final List<String> numbers = List.generate(31, (index) => index.toString());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("fr-FR");
    await flutterTts.setPitch(1.2); // Slightly higher pitch for "cute" voice
    await flutterTts.setSpeechRate(0.4); // Slower for kids
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.getText('app_title')),
        actions: [
          IconButton(
            icon: Icon(
              Icons.language, 
              color: AppTheme.magicalPurple,
              size: 30,
            ),
            onPressed: () => lang.toggleLanguage(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Welcome Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryTeal.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Text(
                  lang.getText('welcome'),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  lang.getText('learn_basics'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/role-selection'),
                  icon: const Icon(Icons.login),
                  label: Text(lang.isFrench ? "Connexion" : "تسجيل الدخول"),
                )
              ],
            ),
          ),
          
          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: AppTheme.magicalPurple,
            unselectedLabelColor: Colors.grey,
            labelStyle: Theme.of(context).textTheme.headlineMedium,
            indicatorColor: AppTheme.primaryOrange,
            indicatorWeight: 4,
            tabs: [
              Tab(text: lang.getText('alphabet')),
              Tab(text: lang.getText('numbers')),
            ],
          ),

          // Grid Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGrid(alphabet, isNumber: false),
                _buildGrid(numbers, isNumber: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<String> items, {required bool isNumber}) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _speak(items[index]),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryOrange.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
              border: Border.all(
                color: isNumber ? AppTheme.primaryTeal : AppTheme.accentPink,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                items[index],
                style: GoogleFonts.fredoka(
                  fontSize: 40,
                  color: isNumber ? AppTheme.primaryTeal : AppTheme.magicalPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
