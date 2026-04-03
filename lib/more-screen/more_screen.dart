import 'package:cellcard_app/more-screen/about.dart';
import 'package:cellcard_app/more-screen/cellcard_store.dart';
import 'package:cellcard_app/more-screen/link-card.dart';
import 'package:cellcard_app/more-screen/manage_acc.dart';
import 'package:cellcard_app/more-screen/setting.dart';
import 'package:cellcard_app/more-screen/support.dart';
import 'package:cellcard_app/more-screen/tutorial/tutorial.dart';
import 'package:cellcard_app/top_up_page.dart/sechedule_top_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ✅ Proper PascalCase naming
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Your brand colors preserved
    final primaryOrange = Colors.orange[400]!;
    final backgroundColor = Colors.grey[200]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Premium AppBar with user profile
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: primaryOrange,
        elevation: 0,
        title: _buildUserProfile(),
      ),
      // ✅ FIX: Use SingleChildScrollView instead of Expanded
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Management Section
            _buildSectionTitle('Account'),
            const SizedBox(height: 12),
            _buildCard([
              _buildNavItem(
                context,
                icon: 'images/a4.png',
                title: 'Scheduled Top-up',
                destination: const ScheduleTopUp(),
              ),
              _buildDivider(),
              _buildNavItem(
                context,
                icon: 'images/a3.png',
                title: 'Linked Payments & PIN',
                destination: const LinkCardPage(), // ✅ Renamed from link_card
              ),
              _buildDivider(),
              _buildNavItem(
                context,
                icon: 'images/a2.png',
                title: 'Manage Accounts',
                destination: const ManageAccPage(), // ✅ Renamed from manage_acc
              ),
            ]),
            
            const SizedBox(height: 20),
            
            // Support & Settings Section
            _buildSectionTitle('Support & Settings'),
            const SizedBox(height: 12),
            _buildCard([
              _buildNavItem(
                context,
                icon: 'images/a5.png',
                title: 'Tutorials',
                destination: const TutorialPage(), // ✅ Renamed from Tutorial
              ),
              _buildDivider(),
              _buildNavItem(
                context,
                icon: 'images/a6.png',
                title: 'Cellcard Stores',
                destination: const CellcardStorePage(), // ✅ Renamed
              ),
              _buildDivider(),
              _buildNavItem(
                context,
                icon: 'images/a7.png',
                title: 'Support',
                destination: const SupportPage(), // ✅ Renamed
              ),
              _buildDivider(),
              _buildNavItem(
                context,
                icon: 'images/a8.png',
                title: 'Settings',
                destination: const SettingPage(), // ✅ Renamed
              ),
              _buildDivider(),
              _buildNavItem(
                context,
                icon: 'images/a9.png',
                title: 'About',
                destination: const AboutPage(), // ✅ Renamed
              ),
            ]),
            
            const SizedBox(height: 32),
            
            // Premium Logout Button
            _buildLogoutButton(context),
            
            const SizedBox(height: 24),
            
            // Footer
            Center(child: _buildFooter()),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components (Kept your style + improved structure)
  // ─────────────────────────────────────────────────────────────

  Widget _buildUserProfile() {
    return Row(
      children: [
        // Premium avatar with border
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 23,
            child: ClipOval(
              child: Image.asset(
                'images/p1.jpeg',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // User info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '011 787 824',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Text(
                    'CHEK SEREYODAM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.verified,
                    color: Colors.white.withOpacity(0.9),
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 14,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String icon,
    required String title,
    required Widget destination,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => destination),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            // Icon with subtle background
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange[400]?.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                icon,
                width: 20,
                height: 20,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(width: 14),
            // Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            // Arrow indicator
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 54,
      endIndent: 16,
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _showLogoutConfirmation(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red[400],
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.red[200]!),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, size: 18),
              SizedBox(width: 8),
              Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text(
          'Copyright © 2026 Cellcard',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
         SizedBox(height: 4),
        Text(
          'Version 1.0.0 Clone App by Chek Sereyodam',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Interactions
  // ─────────────────────────────────────────────────────────────

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.logout, color: Colors.orange),
            SizedBox(width: 8),
            Text('Log Out'),
          ],
        ),
        content: const Text(
          'Are you sure you want to log out of your account?',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Add your logout logic here
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to previous screen
              // Or: Navigate to login screen and remove all previous routes
              // Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}