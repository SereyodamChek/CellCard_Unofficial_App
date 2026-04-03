import 'package:cellcard_app/Telecom_Plan_Services/CustomCard-3.dart';
import 'package:flutter/material.dart';

// ✅ Follows Dart naming conventions + descriptive name
class SocialPackPage extends StatelessWidget {
  const SocialPackPage({super.key});

  // ✅ Data model for social packs (eliminates repetition)
  static const _packs = [
    _SocialPack(
      title: 'Social Pack S',
      price: '\$0.05',
      data: '250MB',
      validity: '1 Day',
      description:
          'Apps include: Facebook, Messenger, WhatsApp, Telegram, LinkedIn, and Discord.',
    ),
    _SocialPack(
      title: 'Social Pack M',
      price: '\$0.10',
      data: '500MB',
      validity: '1 Day',
      description:
          'Apps include: Facebook, Messenger, WhatsApp, Telegram, LinkedIn, Discord, Instagram, and WeChat.',
    ),
    _SocialPack(
      title: 'Social Pack L', // ✅ Fixed duplicate "M" title
      price: '\$0.20',
      data: '1GB', // ✅ Fixed "1 G" typo
      validity: '1 Day',
      description:
          'Apps include: Facebook, Messenger, WhatsApp, Telegram, LinkedIn, Discord, Instagram, WeChat, TikTok, and YouTube.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // ✅ Keep your exact color style
    final accentColor = Colors.pink[800]!;
    final backgroundColor = Colors.grey[200]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Safe back button with proper padding & status bar handling
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_circle_left,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Hero Image (kept your asset & dimensions)
            _buildHeroImage(),
            
            // ✅ Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: _buildDescription(),
            ),
            
            // ✅ Pack Cards (generated from data list)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: _buildPackList(accentColor),
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // UI Sections (preserved your assets, improved structure)
  // ─────────────────────────────────────────────────────────────

  Widget _buildHeroImage() {
    return Stack(
      children: [
        // Your original hero image - exactly as provided
        Image.asset(
          'images/z24.png',
          width: double.infinity,
          height: 140,
          fit: BoxFit.cover,
        ),
        // Subtle gradient for depth (optional but recommended)
        Container(
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    // ✅ Fixed typos: "Linkedln" → "LinkedIn", "Tik Tok" → "TikTok", improved phrasing
    return Text(
      'Upsize your social life with a Social Pack Add-On! Enjoy dedicated data for all your favorite social media apps.',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
        height: 1.4,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  List<Widget> _buildPackList(Color accent) {
    return _packs.map((pack) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: CustomCard_3(
          key: ValueKey(pack.title),
          // ✅ Your exact image assets
          avatarImagePath: 'images/z20.png',
          autoRenewImagePath: 'images/s8.png',
          
          title: pack.title,
          price: pack.price,
          data: pack.data,
          validity: pack.validity,
          description: pack.description,
          autoRenewText: 'Auto-renew every day',
          
          // ✅ Pass your accent color to match your style
          accentColor: accent,
          
          // ✅ Optional callbacks (replace with your navigation/logic)
          onSendGift: () => debugPrint('Gift tapped: ${pack.title}'),
          onSubscribe: () => debugPrint('Subscribe tapped: ${pack.title}'),
        ),
      );
    }).toList();
  }
}

// ─────────────────────────────────────────────────────────────
// Internal Data Model (private, clean, scalable)
// ─────────────────────────────────────────────────────────────

class _SocialPack {
  final String title;
  final String price;
  final String data;
  final String validity;
  final String description;

  const _SocialPack({
    required this.title,
    required this.price,
    required this.data,
    required this.validity,
    required this.description,
  });
}
