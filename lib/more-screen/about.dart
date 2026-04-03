import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Add to pubspec.yaml

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Your brand colors preserved with safe fallbacks
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    final primaryOrangeDark = Colors.orange[700] ?? const Color(0xFFF57C00);
    final backgroundColor = Colors.grey[200] ?? const Color(0xFFEEEEEE);
    final surfaceColor = Colors.white;
    final accentBlue = Colors.blue[700] ?? const Color(0xFF1976D2);
    final textColor = Colors.black87;
    final mutedText = Colors.grey[600] ?? const Color(0xFF757575);

    // ✅ Haptic feedback for premium interactions
    final haptic = () => HapticFeedback.lightImpact();

    // ✅ About sections organized for scalability
    final aboutSections = _AboutData.all;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Professional AppBar with gradient + actions
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                haptic();
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'About',
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        actions: [
          // Share app action
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _shareApp(context, haptic),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.share_rounded,
                    color: Colors.white.withOpacity(0.95),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // ✅ Premium scrollable content with safe area
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // ✅ Premium App Branding Card
              _buildAppBrandingCard(primaryOrange, primaryOrangeDark),
              const SizedBox(height: 24),
              
              // ✅ About Sections List
              _buildSectionHeader('Information', primaryOrange),
              const SizedBox(height: 12),
              _buildAboutCard(aboutSections, primaryOrange, accentBlue, haptic, context),
              
              const SizedBox(height: 24),
              
              // ✅ App Stats Card
              _buildAppStatsCard(primaryOrange),
              
              const SizedBox(height: 24),
              
              // ✅ Social Links Card
              _buildSocialLinksCard(accentBlue, haptic),
              
              const SizedBox(height: 32),
              
              // ✅ Professional Footer
              _buildProfessionalFooter(primaryOrange),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildAppBrandingCard(Color primary, Color primaryDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // App Icon with premium styling
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 600),
            tween: Tween(begin: 0.9, end: 1.0),
            builder: (context, scale, child) {
              return Transform.scale(scale: scale, child: child);
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'images/p1.jpeg', // ✅ Your image asset
                width: 56,
                height: 56,
                filterQuality: FilterQuality.high,
                errorBuilder: (_, __, ___) => Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.cell_tower_rounded, 
                    size: 32, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // App Name & Tagline
          Text(
            'Cellcard App',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Connecting Cambodia, Empowering You',
            style: TextStyle(
              color: Colors.white.withOpacity(0.92),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Version badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.4)),
            ),
            child: Text(
              'Version 2.4.1',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color accent) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accent, Colors.orange[600]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutCard(
    List<_AboutSection> sections,
    Color primary,
    Color accent,
    VoidCallback haptic,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: sections.asMap().entries.map((entry) {
          final index = entry.key;
          final section = entry.value;
          
          return Column(
            children: [
              _buildAboutItem(
                context,
                icon: section.iconPath,
                fallbackIcon: section.fallbackIcon,
                title: section.title,
                subtitle: section.subtitle,
                onTap: () => _handleAboutSection(context, section, haptic),
                primaryColor: primary,
              ),
              if (index < sections.length - 1) _buildDivider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAboutItem(
    BuildContext context, {
    required String icon,
    required IconData fallbackIcon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: primaryColor.withOpacity(0.1),
        highlightColor: primaryColor.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              // Icon container with your image assets
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (_, __, ___) => Icon(
                    fallbackIcon,
                    size: 20,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Arrow indicator
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 52,
      endIndent: 16,
    );
  }

  Widget _buildAppStatsCard(Color primary) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('5M+', 'Downloads', Icons.download_rounded, primary),
              _buildStatItem('4.8★', 'Rating', Icons.star_rounded, primary),
              _buildStatItem('24/7', 'Support', Icons.support_agent_rounded, primary),
            ],
          ),
          const SizedBox(height: 12),
          // Progress indicator for app adoption
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'User Growth',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '+23% this month',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 0.73,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(primary),
                  minHeight: 6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinksCard(Color accent, VoidCallback haptic) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.share_rounded, size: 18, color: accent),
              const SizedBox(width: 8),
              Text(
                'Connect With Us',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialButton(
                icon: Icons.facebook_rounded,
                label: 'Facebook',
                color: const Color(0xFF1877F2),
                onTap: () => _launchURL('https://facebook.com/cellcard', haptic),
              ),
              _buildSocialButton(
                icon: Icons.telegram_rounded,
                label: 'Telegram',
                color: const Color(0xFF0088CC),
                onTap: () => _launchURL('https://t.me/cellcard', haptic),
              ),
              _buildSocialButton(
                icon: Icons.language_rounded,
                label: 'Website',
                color: accent,
                onTap: () => _launchURL('https://cellcard.com.kh', haptic),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 22, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionalFooter(Color primary) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // Legal links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Show privacy policy
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Privacy Policy',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: Colors.grey[600],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                '  •  ',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  color: Colors.grey[400],
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Show terms of service
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Terms of Service',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: Colors.grey[600],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Copyright
          Text(
            '© 2024 Cellcard • Clone by Sorn Lypheng',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // Made with love badge
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_rounded, size: 12, color: Colors.red[400]),
              const SizedBox(width: 4),
              Text(
                'Made in Cambodia',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Navigation & Interactions
  // ─────────────────────────────────────────────────────────────

  void _handleAboutSection(
    BuildContext context,
    _AboutSection section,
    VoidCallback haptic,
  ) {
    haptic();
    
    switch (section.id) {
      case 'company':
        _showCompanyProfile(context);
        break;
      case 'terms':
        _showTermsAndConditions(context);
        break;
      case 'privacy':
        _showPrivacyPolicy(context);
        break;
      case 'licenses':
        _showOpenSourceLicenses(context);
        break;
    }
  }

  void _showCompanyProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CompanyProfileSheet(),
    );
  }

  void _showTermsAndConditions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TermsSheet(title: 'Terms & Conditions'),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TermsSheet(title: 'Privacy Policy'),
    );
  }

  void _showOpenSourceLicenses(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Open Source Licenses',
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView(
            children: [
              _buildLicenseItem('Google Fonts', 'Apache License 2.0'),
              _buildLicenseItem('Iconsax', 'MIT License'),
              _buildLicenseItem('Flutter', 'BSD 3-Clause License'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: GoogleFonts.plusJakartaSans(color: Colors.orange[400]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLicenseItem(String name, String license) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Text(
            license,
            style: GoogleFonts.plusJakartaSans(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url, VoidCallback haptic) async {
    haptic();
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _shareApp(BuildContext context, VoidCallback haptic) {
    haptic();
    // TODO: Use share_plus package for actual sharing
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.share_rounded, color: Colors.white),
            const SizedBox(width: 8),
            Text('Share Cellcard App with friends!'),
          ],
        ),
        backgroundColor: Colors.orange[400],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Company Profile Bottom Sheet
// ─────────────────────────────────────────────────────────────

class _CompanyProfileSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 48,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          
          // Header with logo
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryOrange.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'images/p1.jpeg',
                  width: 32,
                  height: 32,
                  errorBuilder: (_, __, ___) => 
                    Icon(Icons.cell_tower_rounded, size: 32, color: primaryOrange),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cellcard',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Cameroon Telecom Cambodia',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const Divider(height: 24, thickness: 1),
          
          // Company info
          Expanded(
            child: ListView(
              children: [
                _buildInfoRow('Founded', '2007'),
                _buildInfoRow('Headquarters', 'Phnom Penh, Cambodia'),
                _buildInfoRow('Employees', '500+'),
                _buildInfoRow('Coverage', 'Nationwide 4G/LTE'),
                const SizedBox(height: 16),
                Text(
                  'Cellcard is Cambodia\'s leading mobile operator, committed to connecting people and empowering communities through innovative telecommunications services.',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          
          // Close button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey[700],
                side: BorderSide(color: Colors.grey[300]!),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Close',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Terms & Conditions / Privacy Policy Bottom Sheet
// ─────────────────────────────────────────────────────────────

class _TermsSheet extends StatelessWidget {
  final String title;

  const _TermsSheet({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 48,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          
          // Header
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // Content (placeholder - replace with actual terms)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title == 'Terms & Conditions' 
                        ? _termsContent 
                        : _privacyContent,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Accept button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[400],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'I Agree',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const _termsContent = '''
1. Acceptance of Terms
By accessing or using the Cellcard App, you agree to be bound by these Terms and Conditions.

2. Service Description
Cellcard provides mobile telecommunications services including voice, SMS, data, and value-added services.

3. User Responsibilities
You agree to use the service lawfully and not engage in any activity that may harm the network or other users.

4. Billing & Payments
All charges are billed in USD or KHR. Payment is due upon receipt of invoice.

5. Limitation of Liability
Cellcard is not liable for indirect, incidental, or consequential damages arising from service use.

6. Modifications
We reserve the right to modify these terms at any time. Continued use constitutes acceptance.

7. Contact
For questions, contact support@cellcard.com.kh or call 1686.
''';

  static const _privacyContent = '''
1. Information We Collect
We collect personal information necessary to provide services, including phone number, usage data, and device information.

2. How We Use Your Information
Your data is used to: provide services, improve user experience, send important notifications, and comply with legal obligations.

3. Data Sharing
We do not sell your personal information. Data may be shared with trusted partners only as necessary to provide services.

4. Data Security
We implement industry-standard security measures to protect your information from unauthorized access.

5. Your Rights
You have the right to access, correct, or delete your personal information. Contact privacy@cellcard.com.kh to exercise these rights.

6. Cookies & Tracking
We use cookies and similar technologies to improve service functionality and analyze usage patterns.

7. Updates
This policy may be updated periodically. We will notify you of material changes via the app or email.
''';
}

// ─────────────────────────────────────────────────────────────
// About Data Model (Organized, Scalable, Type-Safe)
// ─────────────────────────────────────────────────────────────

class _AboutData {
  // ✅ All about sections in one place - easy to add/update
  static const List<_AboutSection> all = [
    _AboutSection(
      id: 'company',
      title: 'Company Profile',
      subtitle: 'Learn about Cellcard',
      iconPath: 'images/p1.jpeg', // ✅ Your image asset
      fallbackIcon: Icons.business_rounded,
    ),
    _AboutSection(
      id: 'terms',
      title: 'Terms & Conditions', // ✅ Fixed typo from original
      subtitle: 'Read our service terms',
      iconPath: 'images/z36.png', // ✅ Your image asset
      fallbackIcon: Icons.description_rounded,
    ),
    _AboutSection(
      id: 'privacy',
      title: 'Privacy Policy',
      subtitle: 'How we protect your data',
      iconPath: 'images/p1.jpeg',
      fallbackIcon: Icons.privacy_tip_rounded,
    ),
    _AboutSection(
      id: 'licenses',
      title: 'Open Source Licenses',
      subtitle: 'View third-party licenses',
      iconPath: 'images/z36.png',
      fallbackIcon: Icons.code_rounded,
    ),
  ];
}

class _AboutSection {
  final String id;
  final String title;
  final String subtitle;
  final String iconPath; // ✅ Your image asset path
  final IconData fallbackIcon;

  const _AboutSection({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.fallbackIcon,
  });
}