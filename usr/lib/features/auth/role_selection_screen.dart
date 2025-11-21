import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:languamie/core/language_provider.dart';
import 'package:languamie/core/theme.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              lang.isFrench ? "Qui êtes-vous ?" : "من أنت؟",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            
            // Student/Parent Card
            _buildRoleCard(
              context,
              title: lang.getText('i_am_student'),
              icon: Icons.child_care,
              color: AppTheme.primaryOrange,
              onTap: () {
                // Navigate to Student Dashboard (Mock)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Student Flow Selected")),
                );
                Navigator.pushNamed(context, '/payment'); // Direct to payment for demo
              },
            ),
            
            const SizedBox(height: 24),

            // Teacher Card
            _buildRoleCard(
              context,
              title: lang.getText('i_am_teacher'),
              icon: Icons.school,
              color: AppTheme.primaryTeal,
              onTap: () {
                // Navigate to Teacher Dashboard (Mock)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Teacher Flow Selected")),
                );
                Navigator.pushNamed(context, '/payment'); // Direct to payment for demo
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, {
    required String title, 
    required IconData icon, 
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.fredoka(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
