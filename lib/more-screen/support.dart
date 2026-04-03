import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Add to pubspec.yaml

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Your brand colors preserved with safe fallbacks
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    final primaryOrangeDark = Colors.orange[700] ?? const Color(0xFFF57C00);
    final backgroundColor = Colors.grey[200] ?? const Color(0xFFEEEEEE);
    final accentBlue = Colors.blue[700] ?? const Color(0xFF1976D2);
    final textColor = Colors.black87;
    final mutedText = Colors.grey[600] ?? const Color(0xFF757575);

    // ✅ Haptic feedback for premium interactions
    final haptic = () => HapticFeedback.lightImpact();

    // ✅ Support options organized for scalability
    final supportOptions = _SupportData.all;

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
          'Support',
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        actions: [
          // Help/Info icon
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _showSupportInfo(context),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.help_outline_rounded,
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
        child: Column(
          children: [
            // ✅ Support Header with Status
            _buildSupportHeader(primaryOrange),
            
            // ✅ Search Bar for FAQs
            _buildSupportSearch(primaryOrange),
            
            const SizedBox(height: 16),
            
            // ✅ Scrollable Support Options
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick Help Section
                    _buildSectionTitle('How can we help?', primaryOrange),
                    const SizedBox(height: 12),
                    ...supportOptions.map((option) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _PremiumSupportCard(
                        option: option,
                        onTap: () => _handleSupportOption(context, option, haptic),
                        primaryColor: primaryOrange,
                        accentColor: accentBlue,
                      ),
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Emergency Contact Card
                    _buildEmergencyCard(primaryOrange, haptic),
                    
                    const SizedBox(height: 32),
                    
                    // Additional Resources
                    _buildAdditionalResources(accentBlue),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ✅ Premium Sticky Chat CTA
      bottomNavigationBar: _buildPremiumChatCTA(accentBlue, context, haptic),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildSupportHeader(Color primary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary.withOpacity(0.1), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.support_agent_rounded,
              size: 22,
              color: Colors.green[700],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Support Available',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Live status indicator
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '24/7 assistance • Avg. response: < 2 min',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSearch(Color primary) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          style: GoogleFonts.plusJakartaSans(fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search FAQs...',
            hintStyle: GoogleFonts.plusJakartaSans(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.grey[400],
              size: 20,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.mic_rounded, color: primary, size: 20),
              onPressed: () {
                // TODO: Voice search
              },
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          onSubmitted: (query) {
            // TODO: Search FAQs
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color accent) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 8),
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

  Widget _buildEmergencyCard(Color primary, VoidCallback haptic) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red[50]!,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.emergency_rounded,
              size: 22,
              color: Colors.red[700],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency Support',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.red[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Network outage or urgent issue? Call our priority line.',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: Colors.grey[700],
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          // Call button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                haptic();
                _launchPhone('1686', haptic);
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.phone_rounded, size: 14, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      'Call',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalResources(Color accent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('More Resources', accent),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              _buildResourceItem(
                icon: Icons.article_rounded,
                title: 'User Guides',
                subtitle: 'Step-by-step tutorials',
                accent: accent,
              ),
              const Divider(height: 1, indent: 56, endIndent: 16),
              _buildResourceItem(
                icon: Icons.video_library_rounded,
                title: 'Video Tutorials',
                subtitle: 'Watch & learn',
                accent: accent,
              ),
              const Divider(height: 1, indent: 56, endIndent: 16),
              _buildResourceItem(
                icon: Icons.groups_rounded,
                title: 'Community Forum',
                subtitle: 'Connect with other users',
                accent: accent,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResourceItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color accent,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          // TODO: Navigate to resource
        },
        borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: accent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumChatCTA(
    Color accent,
    BuildContext context,
    VoidCallback haptic,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Availability indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Agents online • Ready to help',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Chat button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  haptic();
                  _startChatSession(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  shadowColor: accent.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble_rounded, size: 18, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Chat with Us Now',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Navigation & Interactions
  // ─────────────────────────────────────────────────────────────

  void _handleSupportOption(
    BuildContext context,
    _SupportOption option,
    VoidCallback haptic,
  ) {
    haptic();
    
    switch (option.id) {
      case 'faq':
        _showFAQList(context);
        break;
      case 'call':
        _launchPhone('1686', haptic);
        break;
      case 'feedback':
        _showFeedbackForm(context);
        break;
    }
  }

  Future<void> _launchPhone(String phone, VoidCallback haptic) async {
    haptic();
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showSupportInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.help_outline_rounded, color: Colors.orange[400]),
            const SizedBox(width: 8),
            Text(
              'Support Info',
              style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '• FAQ: Find answers to common questions\n'
              '• Call: 24/7 phone support at 1686\n'
              '• Feedback: Help us improve your experience\n'
              '• Chat: Instant messaging with agents',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Got it',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.orange[400],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFAQList(BuildContext context) {
    // TODO: Navigate to FAQ page or show bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _FAQBottomSheet(),
    );
  }

  void _showFeedbackForm(BuildContext context) {
    // TODO: Show feedback form
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Feedback form opening...'),
        backgroundColor: Colors.orange[400],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _startChatSession(BuildContext context) {
    // TODO: Launch chat interface
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.chat_rounded, color: Colors.white),
            const SizedBox(width: 8),
            Text('Connecting to support agent...'),
          ],
        ),
        backgroundColor: Colors.blue[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Premium Support Card Component
// ─────────────────────────────────────────────────────────────

class _PremiumSupportCard extends StatelessWidget {
  final _SupportOption option;
  final VoidCallback onTap;
  final Color primaryColor;
  final Color accentColor;

  const _PremiumSupportCard({
    required this.option,
    required this.onTap,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: primaryColor.withOpacity(0.1),
        highlightColor: primaryColor.withOpacity(0.05),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container with your image assets
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  option.iconPath,
                  width: 20,
                  height: 20,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (_, __, ___) => Icon(
                    option.fallbackIcon,
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
                    Row(
                      children: [
                        Text(
                          option.title,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            letterSpacing: -0.2,
                          ),
                        ),
                        if (option.isPopular ?? false) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Popular',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange[800],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (option.description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        option.description!,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: Colors.grey[600],
                          height: 1.35,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Status/Availability indicator
              if (option.isAvailable != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: (option.isAvailable! ? Colors.green : Colors.grey)
                        .withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: option.isAvailable! ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        option.isAvailable! ? 'Available' : 'Offline',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: option.isAvailable! 
                              ? Colors.green[700] 
                              : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              // Arrow indicator
              const SizedBox(width: 12),
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
}

// ─────────────────────────────────────────────────────────────
// FAQ Bottom Sheet Component
// ─────────────────────────────────────────────────────────────

class _FAQBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    
    final faqs = [
      _FAQ(
        question: 'How do I top up my account?',
        answer: 'Go to the Home screen, tap "Top Up", select amount, and confirm with your PIN.',
      ),
      _FAQ(
        question: 'What payment methods are accepted?',
        answer: 'We accept ABA Mobile, credit/debit cards (VISA, Mastercard), and bank transfers.',
      ),
      _FAQ(
        question: 'How do I check my balance?',
        answer: 'Dial *123# or check the "My Account" section in the app.',
      ),
    ];

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
            'Frequently Asked Questions',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // FAQ List
          Expanded(
            child: ListView.separated(
              itemCount: faqs.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return _FAQItem(faq: faq, accentColor: primaryOrange);
              },
            ),
          ),
          
          // Close button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey[700],
                side: BorderSide(color: Colors.grey[300]!),
                padding: const EdgeInsets.symmetric(vertical: 12),
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
}

class _FAQItem extends StatefulWidget {
  final _FAQ faq;
  final Color accentColor;

  const _FAQItem({required this.faq, required this.accentColor});

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.faq.question,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            AnimatedRotation(
                              duration: const Duration(milliseconds: 200),
                              turns: _isExpanded ? 0.5 : 0,
                              child: Icon(
                                Icons.expand_more_rounded,
                                color: Colors.grey[500],
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 200),
                          firstChild: const SizedBox.shrink(),
                          secondChild: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              widget.faq.answer,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 13,
                                color: Colors.grey[700],
                                height: 1.4,
                              ),
                            ),
                          ),
                          crossFadeState: _isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isExpanded) const Divider(height: 1),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Support Data Model (Organized, Scalable, Type-Safe)
// ─────────────────────────────────────────────────────────────

class _SupportData {
  static const List<_SupportOption> all = [
    _SupportOption(
      id: 'faq',
      title: 'FAQ',
      description: 'Find answers to common questions',
      iconPath: 'images/z41.png', // ✅ Your image asset
      fallbackIcon: Icons.help_outline_rounded,
      isPopular: true,
      isAvailable: null,
    ),
    _SupportOption(
      id: 'call',
      title: 'Call Us (24/7 Support)',
      description: 'Speak with a support agent anytime',
      iconPath: 'images/z40.png', // ✅ Your image asset
      fallbackIcon: Icons.phone_rounded,
      isPopular: false,
      isAvailable: true,
    ),
    _SupportOption(
      id: 'feedback',
      title: 'Leave Feedback',
      description: 'Help us improve your experience',
      iconPath: 'images/a7.png', // ✅ Your image asset
      fallbackIcon: Icons.feedback_rounded,
      isPopular: false,
      isAvailable: null,
    ),
  ];
}

class _SupportOption {
  final String id;
  final String title;
  final String? description;
  final String iconPath; // ✅ Your image asset path
  final IconData fallbackIcon;
  final bool? isPopular;
  final bool? isAvailable;

  const _SupportOption({
    required this.id,
    required this.title,
    this.description,
    required this.iconPath,
    required this.fallbackIcon,
    this.isPopular,
    this.isAvailable,
  });
}

class _FAQ {
  final String question;
  final String answer;

  const _FAQ({required this.question, required this.answer});
}