import 'package:cellcard_app/Telecom_Plan_Services/CustomCard-4.dart';
import 'package:flutter/material.dart';

// ✅ Better class name + organized structure
class InternationalPacksPage extends StatelessWidget {
  const InternationalPacksPage({super.key});

  // ✅ Data model for roaming packs (scalable & maintainable)
  static const _packs = [
    // Thailand Packs
    _RoamingPack(
      title: 'Thailand Pack',
      price: '\$2.00',
      data: '700 MB',
      validity: '1 Day',
      image: 'images/z25.jpg',
      category: 'Thailand',
    ),
    _RoamingPack(
      title: 'Thailand Pack',
      price: '\$5.00',
      data: '3 GB',
      validity: '3 Days',
      image: 'images/z25.jpg',
      category: 'Thailand',
    ),
    _RoamingPack(
      title: 'Thailand Pack',
      price: '\$10.00',
      data: '7 GB',
      validity: '7 Days',
      image: 'images/z25.jpg',
      category: 'Thailand',
    ),
    // Regional Packs
    _RoamingPack(
      title: 'ASEAN Pack',
      price: '\$6.00',
      data: '1 GB',
      validity: '7 Days',
      image: 'images/z26.jpg',
      category: 'ASEAN',
    ),
    _RoamingPack(
      title: 'EU Pack',
      price: '\$10.00',
      data: '1 GB',
      validity: '7 Days',
      image: 'images/z27.jpg',
      category: 'Europe',
    ),
    _RoamingPack(
      title: 'Middle East Pack',
      price: '\$10.00',
      data: '1 GB',
      validity: '7 Days',
      image: 'images/z28.jpg',
      category: 'Middle East',
    ),
    _RoamingPack(
      title: 'Oceania Pack',
      price: '\$10.00',
      data: '1 GB',
      validity: '7 Days',
      image: 'images/z29.jpg',
      category: 'Oceania',
    ),
    _RoamingPack(
      title: 'America Pack',
      price: '\$15.00',
      data: '2 GB',
      validity: '7 Days',
      image: 'images/z30.jpg',
      category: 'Americas',
    ),
    _RoamingPack(
      title: 'Asia Pack',
      price: '\$15.00',
      data: '2 GB',
      validity: '7 Days',
      image: 'images/z31.jpg',
      category: 'Asia',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // ✅ Keep your color palette
    final accentColor = Colors.pink[800]!;
    final backgroundColor = Colors.grey[200]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Proper AppBar for navigation semantics
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
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // ✅ Hero Section (kept your image style)
          _buildHeroSection(accentColor),
          
          // ✅ Scrollable Pack List
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description Text (improved typography)
                  _buildDescription(),
                  const SizedBox(height: 16),
                  
                  // ✅ Generate cards from data list
                  ..._buildPackList(accentColor),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // UI Sections (kept your assets + improved structure)
  // ─────────────────────────────────────────────────────────────

  Widget _buildHeroSection(Color accent) {
    return Stack(
      children: [
        // Your original hero image - preserved exactly
        Image.asset(
          'images/z32.png',
          width: double.infinity,
          height: 140,
          fit: BoxFit.cover,
        ),
        // Subtle gradient overlay for depth (optional)
        Container(
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.25),
              ],
            ),
          ),
        ),
        // Title overlay on image (optional enhancement)
        Positioned(
          bottom: 12,
          left: 16,
          child: Text(
            'International Roaming',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      'Worry-free roaming internet bundles, starting from \$2.',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
        height: 1.4,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  List<Widget> _buildPackList(Color accent) {
    // Group packs by category for better organization
    final groupedPacks = <String, List<_RoamingPack>>{};
    
    for (final pack in _packs) {
      groupedPacks.putIfAbsent(pack.category, () => []).add(pack);
    }

    final widgets = <Widget>[];
    
    for (final entry in groupedPacks.entries) {
      // Category header
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          child: Text(
            entry.key,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      );
      
      // Cards for this category
      for (final pack in entry.value) {
        widgets.add(
          CustomCard_4(
            key: ValueKey('${pack.title}_${pack.price}'),
            avatarImagePath: 'images/s3.png', // Your avatar asset
            title: pack.title,
            price: pack.price,
            data: pack.data,
            validity: pack.validity,
            image: pack.image, // Your pack image asset
            autoRenewText: 'Non-auto-renew',
            autoRenewImagePath: 'images/s8.png', // Your renew icon
            // Optional callbacks for interactivity
            onDetails: () => _onPackDetails(pack),
            onSubscribe: () => _onSubscribe(pack),
            // Keep your color style
            accentColor: accent,
          ),
        );
        widgets.add(const SizedBox(height: 12));
      }
    }
    
    return widgets;
  }

  // ─────────────────────────────────────────────────────────────
  // Interaction Handlers
  // ─────────────────────────────────────────────────────────────

  void _onPackDetails(_RoamingPack pack) {
    // TODO: Navigate to details page
    debugPrint('Details tapped: ${pack.title} - ${pack.price}');
  }

  void _onSubscribe(_RoamingPack pack) {
    // TODO: Handle subscription flow
    debugPrint('Subscribe tapped: ${pack.title} - ${pack.price}');
  }
}

// ─────────────────────────────────────────────────────────────
// Internal Data Model (private, clean, scalable)
// ─────────────────────────────────────────────────────────────

class _RoamingPack {
  final String title;
  final String price;
  final String data;
  final String validity;
  final String image;
  final String category;

  const _RoamingPack({
    required this.title,
    required this.price,
    required this.data,
    required this.validity,
    required this.image,
    required this.category,
  });
}
