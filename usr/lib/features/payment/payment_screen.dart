import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:languamie/core/language_provider.dart';
import 'package:languamie/core/theme.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.magicalPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Premium Badge
              const Icon(Icons.star, size: 80, color: AppTheme.accentPink),
              const SizedBox(height: 16),
              Text(
                lang.getText('premium_offer'),
                style: GoogleFonts.fredoka(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                lang.getText('unlock_all'),
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),

              // Pricing Card
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      lang.getText('price'),
                      style: GoogleFonts.fredoka(
                        fontSize: 40,
                        color: AppTheme.primaryOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        lang.getText('payment_method'),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Payment Methods (Mock)
                    _buildPaymentMethod(
                      context, 
                      label: lang.getText('card_cib'), 
                      color: Colors.blue.shade100,
                      icon: Icons.credit_card,
                    ),
                    const SizedBox(height: 12),
                    _buildPaymentMethod(
                      context, 
                      label: lang.getText('card_gold'), 
                      color: Colors.amber.shade100,
                      icon: Icons.credit_score,
                    ),

                    const SizedBox(height: 30),
                    
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                           ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Simulating Payment Gateway...")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryTeal,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: Text(
                          lang.getText('pay_now'),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(BuildContext context, {
    required String label, 
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 16),
          Text(
            label,
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Radio(value: true, groupValue: true, onChanged: (v) {}),
        ],
      ),
    );
  }
}
