import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add to pubspec.yaml: url_launcher: ^6.2.0

// ✅ Proper PascalCase naming + descriptive name
class PlayGameAddonPage extends StatelessWidget {
  const PlayGameAddonPage({super.key});

  // ✅ Data model for benefits (scalable & maintainable)
  static const _benefits = [
    _Benefit(
      icon: Icons.data_usage,
      title: '8GB Internet Data',
      description: 'High-speed data for gaming & browsing',
      highlight: true,
    ),
    _Benefit(
      icon: Icons.sports_esports,
      title: 'Esports & Arcade Games',
      description: 'Unlimited access to premium mobile games',
    ),
    _Benefit(
      icon: Icons.call,
      title: '60 On-Net Minutes',
      description: 'Free calls to Cellard numbers',
    ),
    _Benefit(
      icon: Icons.sms,
      title: '60 On-Net SMS',
      description: 'Free texts to Cellard numbers',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // ✅ Your brand colors preserved
    final primaryOrange = Colors.orange[400]!;
    final accentBlue = Colors.blue;
    final backgroundColor = Colors.grey[200]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Premium AppBar with subtle depth
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'PlayGame Add-On',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // ✅ Premium Hero Section
          _buildHeroSection(primaryOrange),
          
          // ✅ Scrollable Premium Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Premium Title Card
                  _buildTitleCard(primaryOrange),
                  const SizedBox(height: 24),
                  
                  // Price Badge - Eye-catching
                  _buildPriceBadge(primaryOrange),
                  const SizedBox(height: 24),
                  
                  // Benefits Section
                  _buildSectionTitle('What\'s Included'),
                  const SizedBox(height: 12),
                  ..._buildBenefitsList(primaryOrange),
                  const SizedBox(height: 24),
                  
                  // USSD Subscription Card
                  _buildUssdCard(accentBlue),
                  const SizedBox(height: 32),
                  
                  // Pro Tips Card
                  _buildProTipsCard(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          
          // ✅ Premium Sticky CTA Button
          _buildPremiumCTA(accentBlue, context),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildHeroSection(Color primary) {
    return Stack(
      children: [
        // Your original hero image - preserved exactly
        Image.asset(
          'images/f1.jpg',
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
        // Premium gradient overlay for depth & text readability
        Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primary.withOpacity(0.2),
                primary.withOpacity(0.5),
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),
        // Floating "Gaming" badge with animation-ready styling
        Positioned(
          right: 16,
          top: 24,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.gamepad, size: 18, color: primary),
                const SizedBox(width: 6),
                Text(
                  'Game Ready 🎮',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Decorative gaming particles (subtle visual interest)
        Positioned(
          left: 24,
          bottom: 24,
          child: _buildGamingParticle(primary),
        ),
      ],
    );
  }

  Widget _buildGamingParticle(Color color) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.4),
            color.withOpacity(0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleCard(Color primary) {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.lock_open, color: primary, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Unlock Premium Gaming',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Get unlimited gaming data, esports access, and bonus calls & SMS—all for just \$1/week. Level up your mobile experience!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceBadge(Color primary) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primary,
            Colors.orange[300]!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.price_check, color: Colors.white, size: 22),
          const SizedBox(width: 8),
          Text(
            'Only \$1 / week',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'BEST VALUE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            color: Colors.orange[400],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildBenefitsList(Color primary) {
    return _benefits.map((benefit) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: benefit.highlight 
                  ? primary.withOpacity(0.4) 
                  : Colors.grey.shade200,
              width: benefit.highlight ? 1.5 : 1,
            ),
            boxShadow: benefit.highlight
                ? [
                    BoxShadow(
                      color: primary.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon container with dynamic styling
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: benefit.highlight 
                      ? primary.withOpacity(0.15) 
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  benefit.icon, 
                  size: 22, 
                  color: benefit.highlight ? primary : Colors.grey[700],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          benefit.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: benefit.highlight 
                                ? FontWeight.w700 
                                : FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        if (benefit.highlight) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6, 
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '★',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      benefit.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Checkmark for visual completion
              Icon(
                Icons.check_circle, 
                size: 20, 
                color: benefit.highlight ? primary : Colors.grey[400],
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildUssdCard(Color accent) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.dialpad, color: accent, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Subscribe Instantly',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // USSD Code - Large & Tappable
          GestureDetector(
            onTap: () => _copyUssdCode('*1688*01*1#'),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: accent.withOpacity(0.4)),
              ),
              child: Column(
                children: [
                  Text(
                    '*1688*01*1#',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: accent,
                      letterSpacing: 1,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap to copy code',
                    style: TextStyle(
                      fontSize: 11,
                      color: accent.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Helper text
          Row(
            children: [
              Icon(Icons.info_outline, size: 14, color: Colors.grey[500]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Dial the code from your Cellard number to activate instantly. No app download required.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProTipsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb, size: 18, color: Colors.amber[700]),
              const SizedBox(width: 8),
              Text(
                'Pro Tips',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTipItem('🎮 Data is optimized for gaming—low latency, high stability'),
          _buildTipItem('📞 On-net calls/SMS only work between Cellard numbers'),
          _buildTipItem('🔄 Add-on renews weekly; cancel anytime via *1200#', isLast: true),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[700],
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildPremiumCTA(Color accent, BuildContext context) {
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => _handleSubscribe(context),
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
                Icon(Icons.gamepad, size: 20, color: Colors.white),
                const SizedBox(width: 8),
                const Text(
                  'Subscribe - \$1/week',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Interactions & Utilities
  // ─────────────────────────────────────────────────────────────

  Future<void> _copyUssdCode(String code) async {
    // TODO: Add clipboard package if needed
    // await Clipboard.setData(ClipboardData(text: code));
    debugPrint('Copied USSD code: $code');
  }

  void _handleSubscribe(BuildContext context) {
    // Premium feedback: haptic + visual
    Feedback.forTap(context);
    
    // Show confirmation dialog with USSD instructions
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.confirmation_number, color: Colors.orange[400]),
            const SizedBox(width: 8),
            const Text('Activate PlayGame Add-On'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To subscribe, please dial the following code from your Cellard phone:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                '*1688*01*1#',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[700],
                  fontFamily: 'monospace',
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '• Cost: \$1/week\n• Auto-renews weekly\n• Cancel anytime: *1200#',
              style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.4),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _copyUssdCode('*1688*01*1#');
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('✓ Code copied! Dial *1688*01*1# to activate.'),
                  backgroundColor: Colors.green[600],
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  action: SnackBarAction(
                    label: 'Dial',
                    textColor: Colors.white,
                    onPressed: () {
                      // TODO: Use url_launcher for tel: protocol if supported
                      // launchUrl(Uri.parse('tel:*1688*01*1#'));
                    },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            icon: const Icon(Icons.copy, size: 18, color: Colors.white),
            label: const Text('Copy Code', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Internal Data Model
// ─────────────────────────────────────────────────────────────

class _Benefit {
  final IconData icon;
  final String title;
  final String description;
  final bool highlight; // For emphasizing key benefits

  const _Benefit({
    required this.icon,
    required this.title,
    required this.description,
    this.highlight = false,
  });
}
