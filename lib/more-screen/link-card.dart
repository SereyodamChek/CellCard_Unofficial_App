import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkCardPage extends StatelessWidget {
  const LinkCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Safe, professional color system
    final theme = Theme.of(context);
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    final primaryOrangeDark = Colors.orange[700] ?? const Color(0xFFF57C00);
    final backgroundColor = Colors.grey[200] ?? const Color(0xFFEEEEEE);
    final surfaceColor = Colors.white;
    final textColor = Colors.black87;
    final mutedText = Colors.grey[600] ?? const Color(0xFF757575);
    final accentBlue = Colors.blue[700] ?? const Color(0xFF1976D2);

    // ✅ Haptic feedback for premium interactions
    final haptic = HapticFeedback.lightImpact;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Professional AppBar with system overlay style
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
                haptic;
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
          'Link Payment Method',
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        actions: [
          // Security indicator
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock_outline_rounded, size: 16, color: Colors.white.withOpacity(0.9)),
                const SizedBox(width: 4),
                Text(
                  'Secure',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // ✅ Premium scrollable content with safe area
      body: SafeArea(
        top: false,
        child: DefaultTextStyle(
          style: GoogleFonts.plusJakartaSans(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // ✅ Premium Hero Card
              _buildPremiumHero(primaryOrange, primaryOrangeDark),
              const SizedBox(height: 28),
              
              // ✅ Section Header with subtle accent
              _buildSectionHeader('Select Payment Method'),
              const SizedBox(height: 16),
              
              // ✅ Premium Payment Options
              _buildPremiumPaymentOption(
                context,
                icon: Icons.account_balance_rounded,
                iconGradient: [Colors.green[400]!, Colors.green[600]!],
                title: 'Link ABA Account',
                subtitle: 'Instant verification via ABA Mobile Bank',
                badge: 'Recommended',
                badgeColor: Colors.green[600]!,
                accentColor: Colors.green[700]!,
                onTap: () => _handlePaymentSelection(context, 'ABA', haptic),
              ),
              const SizedBox(height: 12),
              
              _buildPremiumPaymentOption(
                context,
                icon: Icons.credit_card_rounded,
                iconGradient: [Colors.blue[300]!, Colors.blue[600]!],
                title: 'Link Credit/Debit Card',
                subtitle: 'VISA • Mastercard • JCB • UnionPay',
                badge: null,
                badgeColor: null,
                accentColor: accentBlue,
                onTap: () => _handlePaymentSelection(context, 'Card', haptic),
              ),
              
              const SizedBox(height: 28),
              
              // ✅ Professional Security Notice
              _buildSecurityNotice(primaryOrange),
              const SizedBox(height: 24),
              
              // ✅ Professional Terms with tappable links
              _buildProfessionalTerms(accentBlue),
              const SizedBox(height: 40),
              
              // ✅ Professional Footer
              _buildProfessionalFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components - Professional Grade
  // ─────────────────────────────────────────────────────────────

  Widget _buildPremiumHero(Color primary, Color primaryDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primary, primaryDark],
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
          // Premium animated icon container
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 600),
            tween: Tween(begin: 0.8, end: 1.0),
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'images/p8.png',
                width: 44,
                height: 44,
                color: Colors.white,
                filterQuality: FilterQuality.high,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.payment_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Professional typography hierarchy
          const Text(
            'Link a Card or Bank Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
              height: 1.25,
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'For a Faster & Easier Top-up Experience',
            style: TextStyle(
              color: Colors.white.withOpacity(0.92),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange[400]!, Colors.orange[600]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumPaymentOption(
    BuildContext context, {
    required IconData icon,
    required List<Color> iconGradient,
    required String title,
    required String subtitle,
    String? badge,
    Color? badgeColor,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: accentColor.withOpacity(0.1),
        highlightColor: accentColor.withOpacity(0.05),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Premium gradient icon container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'images/z5.jpg',
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Content with professional typography
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            letterSpacing: -0.2,
                          ),
                        ),
                        if (badge != null && badgeColor != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: badgeColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: badgeColor.withOpacity(0.25),
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              badge,
                              style: TextStyle(
                                color: badgeColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        height: 1.35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Professional arrow indicator
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityNotice(Color primary) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primary.withOpacity(0.08),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primary.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.verified_user_rounded,
              size: 22,
              color: primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verification Process',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primary,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'A small temporary charge may be applied to verify your payment method. This amount will be automatically refunded within 3-5 business days. Your card details are encrypted and never stored on our servers.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    height: 1.45,
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

  Widget _buildProfessionalTerms(Color accent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
          children: [
            const TextSpan(text: 'By linking your payment method, you agree to our '),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () {
                  // TODO: Navigate to Terms & Conditions
                  HapticFeedback.selectionClick();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: accent,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const TextSpan(text: ' and '),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () {
                  // TODO: Navigate to Privacy Policy
                  HapticFeedback.selectionClick();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: accent,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionalFooter() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security_rounded, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                '256-bit SSL Encryption • PCI DSS Compliant',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Copyright © 2024 Cellcard',
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          'App clone Version by Sorn Lypheng',
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Professional Interactions
  // ─────────────────────────────────────────────────────────────

  void _handlePaymentSelection(BuildContext context, String method, VoidCallback haptic) {
    // Premium haptic feedback
    haptic();
    
    // Professional bottom sheet instead of dialog
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProfessionalLinkSheet(method: method),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Professional Bottom Sheet Component
// ─────────────────────────────────────────────────────────────

class _ProfessionalLinkSheet extends StatelessWidget {
  final String method;

  const _ProfessionalLinkSheet({required this.method});

  @override
  Widget build(BuildContext context) {
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryOrange.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    method == 'ABA' ? Icons.account_balance : Icons.credit_card,
                    size: 20,
                    color: primaryOrange,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Link $method',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1, thickness: 1),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method == 'ABA'
                      ? 'You\'ll be securely redirected to ABA Mobile to authorize this connection. No credentials are stored by Cellcard.'
                      : 'Enter your card details in our secure, PCI-compliant form. Your information is encrypted end-to-end.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Professional step indicator
                _buildStepIndicator(),
                
                const SizedBox(height: 24),
                
                // Security badges
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSecurityBadge('🔒 Encrypted'),
                    const SizedBox(width: 12),
                    _buildSecurityBadge('✓ Verified'),
                    const SizedBox(width: 12),
                    _buildSecurityBadge('🛡️ Protected'),
                  ],
                ),
              ],
            ),
          ),
          
          // Actions
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Row(
              children: [
                Expanded(
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
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Navigate to actual linking flow
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.check_circle_rounded, color: Colors.white),
                              const SizedBox(width: 8),
                              Text('Connecting to $method securely...'),
                            ],
                          ),
                          backgroundColor: Colors.green[600],
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(16),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryOrange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: primaryOrange.withOpacity(0.4),
                    ),
                    child: const Text(
                      'Continue Securely',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Column(
      children: [
        // Step dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStepDot(1, isActive: true),
            _buildStepConnector(),
            _buildStepDot(2),
            _buildStepConnector(),
            _buildStepDot(3),
          ],
        ),
        const SizedBox(height: 10),
        // Step labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('Verify', style: _activeStepStyle),
            Text('Authorize', style: _inactiveStepStyle),
            Text('Complete', style: _inactiveStepStyle),
          ],
        ),
      ],
    );
  }

  Widget _buildStepDot(int number, {bool isActive = false}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange[400] : Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: (Colors.orange[400] ?? Colors.orange).withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[600],
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStepConnector() {
    return Container(
      width: 24,
      height: 2,
      color: Colors.grey[300],
    );
  }

  Widget _buildSecurityBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static const _activeStepStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Colors.orange,
  );
  
  static const _inactiveStepStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}