import 'package:cellcard_app/Entertainment_Lifestyle_Services/vas.dart';
import 'package:cellcard_app/Telecom_Plan_Services/Cellcard_Serey.dart';
import 'package:cellcard_app/Telecom_Plan_Services/Social_Pack.dart';
import 'package:cellcard_app/discover/add-on.dart';
import 'package:cellcard_app/discover/roaming.dart';
import 'package:cellcard_app/my-plan_page.dart/See_other_plans.dart';
import 'package:cellcard_app/my-plan_page.dart/quick_pay.dart';
import 'package:cellcard_app/story_screen.dart';
import 'package:flutter/material.dart';

// ✅ Proper naming + state management ready
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Your brand colors preserved
    final primaryOrange = Colors.orange[400]!;
    final accentPink = Colors.pink[600]!;
    final backgroundColor = Colors.grey[200]!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        // ✅ Premium AppBar with gradient + elevation
        appBar: AppBar(
          backgroundColor: primaryOrange,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Discover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            unselectedLabelColor: Colors.white70,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Products'),
              Tab(text: 'Stories'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // ✅ Premium Products Tab
            ProductsTab(
              primaryOrange: primaryOrange,
              accentPink: accentPink,
            ),
            // ✅ Stories Tab (kept your existing widget)
            const Story(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Premium Products Tab (Extracted for clarity)
// ─────────────────────────────────────────────────────────────

class ProductsTab extends StatelessWidget {
  final Color primaryOrange;
  final Color accentPink;

  const ProductsTab({
    super.key,
    required this.primaryOrange,
    required this.accentPink,
  });

  // ✅ Data-driven promo banners
  static const _promoBanners = [
    _PromoBanner(
      image: 'images/p3.jpg',
      target: CellcardSerey(),
      title: 'Cellcard Serey+',
      subtitle: 'Premium entertainment bundle',
    ),
  ];

  // ✅ Category navigation items
  static const _categories = [
    _Category(icon: 'images/s2.png', label: 'Add-ons', target: AddOn()),
    _Category(icon: 'images/s3.png', label: 'International', target: Roaming()),
    _Category(icon: 'images/s4.png', label: 'VAS', target: VAS()),
    _Category(icon: 'images/s5.png', label: 'Plans', target: See_other_plans()),
  ];

  // ✅ Popular packs data
  static const _popularPacks = [
    _Pack(
      image: 'images/z48.jpg',
      title: 'Social Pack S',
      price: '\$0.05',
      target: SocialPackPage(),
    ),
    _Pack(
      image: 'images/p3-.jpg',
      title: 'Cellcard Serey+',
      price: '\$1.50',
      target: CellcardSerey(),
    ),
  ];

  // ✅ International services data
  static const _internationalServices = [
    _Service(image: 'images/s7.png', title: 'Thailand Pack', price: '\$2.00'),
    _Service(image: 'images/s7.png', title: 'ASEAN Pack', price: '\$6.00'),
    _Service(image: 'images/s7.png', title: 'EU Pack', price: '\$10.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        // ✅ Premium Promo Banner Carousel
        _buildPromoSection(),
        const SizedBox(height: 20),

        // ✅ Category Navigation (Premium Cards)
        _buildSectionHeader('Browse by Category'),
        _buildCategoryGrid(context),
        const SizedBox(height: 24),

        // ✅ Popular Packs (Horizontal Scroll)
        _buildSectionHeader('Most Popular'),
        _buildPopularPacks(),
        const SizedBox(height: 24),

        // ✅ Quick Pay CTA (Premium Gradient Card)
        _buildQuickPayCard(context),
        const SizedBox(height: 24),

        // ✅ International Services List
        _buildSectionHeader('International Services'),
        _buildInternationalList(),
        const SizedBox(height: 32),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildPromoSection() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: _promoBanners.length,
        itemBuilder: (context, index) {
          final promo = _promoBanners[index];
          return GestureDetector(
            onTap: () => _navigate(context, promo.target),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Hero image with gradient overlay
                    Image.asset(
                      promo.image,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                    // Content overlay
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            promo.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            promo.subtitle,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // "Explore" badge
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: primaryOrange.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Explore',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: primaryOrange,
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
          const Spacer(),
          // "View All" link for extensibility
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: primaryOrange,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'View All',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _categories.map((cat) {
            return _PremiumCategoryCard(
              icon: cat.icon,
              label: cat.label,
              onTap: () => _navigate(context, cat.target),
              accentColor: primaryOrange,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPopularPacks() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _popularPacks.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final pack = _popularPacks[index];
          return GestureDetector(
            onTap: () => _navigate(context, pack.target),
            child: _PremiumPackCard(
              image: pack.image,
              title: pack.title,
              price: pack.price,
              accentColor: accentPink,
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickPayCard(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigate(context, const quick_pay()),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(239, 108, 0, 1),
              const Color.fromARGB(255, 245, 185, 94),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Animated icon container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Pay Templates',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap to manage your favorite payment shortcuts',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // CTA arrow
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInternationalList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        children: _internationalServices.map((service) {
          final index = _internationalServices.indexOf(service);
          return Column(
            children: [
              _PremiumServiceItem(
                image: service.image,
                title: service.title,
                price: service.price,
                accentColor: primaryOrange,
              ),
              if (index < _internationalServices.length - 1)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                  indent: 72,
                  endIndent: 16,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Navigation Helper
  // ─────────────────────────────────────────────────────────────

  void _navigate(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Premium Component Widgets (Reusable & Scalable)
// ─────────────────────────────────────────────────────────────

class _PremiumCategoryCard extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final Color accentColor;

  const _PremiumCategoryCard({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon container with hover/press effect
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(
              icon,
              width: 28,
              height: 28,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _PremiumPackCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Color accentColor;

  const _PremiumPackCard({
    required this.image,
    required this.title,
    required this.price,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(14),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          // Content padding
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumServiceItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Color accentColor;

  const _PremiumServiceItem({
    required this.image,
    required this.title,
    required this.price,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // Premium avatar with border
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accentColor.withOpacity(0.3), width: 1.5),
            ),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey.shade100,
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Title + Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ),
          // Premium Subscribe Button
          SizedBox(
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Subscribe',
                style: TextStyle(
                  fontSize: 12,
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

// ─────────────────────────────────────────────────────────────
// Internal Data Models (Private, Clean, Scalable)
// ─────────────────────────────────────────────────────────────

class _PromoBanner {
  final String image;
  final Widget target;
  final String title;
  final String subtitle;

  const _PromoBanner({
    required this.image,
    required this.target,
    required this.title,
    required this.subtitle,
  });
}

class _Category {
  final String icon;
  final String label;
  final Widget target;

  const _Category({
    required this.icon,
    required this.label,
    required this.target,
  });
}

class _Pack {
  final String image;
  final String title;
  final String price;
  final Widget target;

  const _Pack({
    required this.image,
    required this.title,
    required this.price,
    required this.target,
  });
}

class _Service {
  final String image;
  final String title;
  final String price;

  const _Service({
    required this.image,
    required this.title,
    required this.price,
  });
}
