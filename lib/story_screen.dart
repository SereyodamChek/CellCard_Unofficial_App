import 'package:cellcard_app/list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class _CC {
  static const orange      = Color(0xFFE8500A);
  static const orangeLight = Color(0xFFFF6B2B);
  static const pink        = Color(0xFFC0187A);
  static const blue        = Color(0xFF3B82F6);
  static const bg          = Color(0xFFF7F7F9);
  static const surface     = Colors.white;
  static const textPrimary = Color(0xFF1A1A2E);
  static const textMuted   = Color(0xFF8A8A99);
  static const border      = Color(0xFFEEEEF3);
}

// ─── Data ────────────────────────────────────────────────────
final List<Map<String, String>> pic = [
  {
    'image': 'images/d1.jpg',
    'tag': 'Security',
    'title': 'Data of nearly all AT&T customers downloaded to a third-party platform in security breach',
  },
  {
    'image': 'images/d2.jpg',
    'tag': 'Business',
    'title': 'Meet Mellody, The Vegan Honey Company Aiming To Keep Busy Bees From Burning Out',
  },
  {
    'image': 'images/d3.jpg',
    'tag': 'Gaming',
    'title': 'Theme Park And Rollercoaster Simulator Planet Coaster Is Getting A Sequel',
  },
];

final List<Map<String, String>> _news = [
  {
    'image': 'images/z1.jpg',
    'title': 'Regulator issues warning to unlicensed City Gem condo project',
    'tag': 'Trending',
    'time': '04:46 PM',
  },
  {
    'image': 'images/z2.jpg',
    'title': 'Hun Manet highlights crucial role of sports in national development',
    'tag': 'Trending',
    'time': '04:46 PM',
  },
  {
    'image': 'images/z3.jpg',
    'title': 'Korean Doctors providing free medical exams in Kampong Thom July 26–28',
    'tag': 'Trending',
    'time': '04:46 PM',
  },
  {
    'image': 'images/z4.jpg',
    'title': 'Weekend of powercuts for Phnom Penh',
    'tag': 'Trending',
    'time': '04:46 PM',
  },
];

// ─── Main Widget ─────────────────────────────────────────────
class Story extends StatefulWidget {
  const Story({super.key});
  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  int _activeStory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _CC.bg,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(child: _buildStoryCarousel()),
          SliverToBoxAdapter(child: _buildDotIndicator()),
          SliverToBoxAdapter(child: _buildCategorySection()),
          SliverToBoxAdapter(child: _buildChannelSection()),
          SliverToBoxAdapter(child: _buildLatestNewsHeader()),
          _buildNewsList(),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  // ─── AppBar ───────────────────────────────────────────────
  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 0,
      backgroundColor: _CC.surface,
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: Colors.black.withOpacity(0.08),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20, fontWeight: FontWeight.w800,
                    color: _CC.textPrimary,
                  ),
                ),
                Text(
                  'Stay up to date',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11, color: _CC.textMuted,
                  ),
                ),
              ],
            ),
            const Spacer(),
            _appBarBtn(Iconsax.search_normal_1),
            const SizedBox(width: 8),
            _appBarBtn(Iconsax.notification),
          ],
        ),
      ),
    );
  }

  Widget _appBarBtn(IconData icon) {
    return Container(
      width: 36, height: 36,
      decoration: BoxDecoration(
        color: _CC.bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _CC.border),
      ),
      child: Icon(icon, size: 18, color: _CC.textMuted),
    );
  }

  // ─── Story Carousel ───────────────────────────────────────
  Widget _buildStoryCarousel() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 260,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.88),
          itemCount: pic.length,
          onPageChanged: (i) => setState(() => _activeStory = i),
          itemBuilder: (context, index) {
            final item = pic[index];
            return AnimatedScale(
              scale: _activeStory == index ? 1.0 : 0.95,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.14),
                      blurRadius: 18, offset: const Offset(0, 6),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    // Gradient overlay
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0xDD000000)],
                          stops: [0.4, 1.0],
                        ),
                      ),
                    ),
                    // Tag + title
                    Positioned(
                      left: 16, right: 16, bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [_CC.orange, _CC.orangeLight]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item['tag']!,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['title']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14, fontWeight: FontWeight.w600,
                              color: Colors.white, height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Read more button
                    Positioned(
                      top: 12, right: 12,
                      child: Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white30),
                        ),
                        child: const Icon(Iconsax.arrow_right_3, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pic.length, (i) {
          final active = i == _activeStory;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: active ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: active ? _CC.orange : _CC.border,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }

  // ─── Category Section ─────────────────────────────────────
  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Text(
            'Browse Topics',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w700, color: _CC.textPrimary,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CategoryList(
            categories: [
              'Social',
              'Tech & Business',
              'Health & Beauty',
              'Entertainment',
              'Gaming',
            ],
          ),
        ),
      ],
    );
  }

  // ─── Channel Section ──────────────────────────────────────
  Widget _buildChannelSection() {
    final urls = [
      'images/p1.jpeg', 'images/q1.png', 'images/q2.png', 'images/q3.png',
      'images/p1.jpeg', 'images/q1.png', 'images/q2.png', 'images/q3.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Row(
            children: [
              Text(
                'Channels',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16, fontWeight: FontWeight.w700, color: _CC.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                'See all',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13, fontWeight: FontWeight.w600, color: _CC.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 72,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: urls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: _CC.orange, width: 2),
                        boxShadow: [
                          BoxShadow(color: _CC.orange.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2)),
                        ],
                      ),
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: Image.asset(
                          urls[index],
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ─── Latest News Header ───────────────────────────────────
  Widget _buildLatestNewsHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Container(
            width: 4, height: 18,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_CC.orange, _CC.pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Latest News',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w700, color: _CC.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            'See all',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w600, color: _CC.blue,
            ),
          ),
        ],
      ),
    );
  }

  // ─── News List ────────────────────────────────────────────
  Widget _buildNewsList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = _news[index];
            final isLast = index == _news.length - 1;
            return _NewsCard(item: item, isLast: isLast);
          },
          childCount: _news.length,
        ),
      ),
    );
  }
}

// ─── News Card ────────────────────────────────────────────────
class _NewsCard extends StatelessWidget {
  final Map<String, String> item;
  final bool isLast;
  const _NewsCard({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _CC.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 72, height: 72,
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag + time row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _CC.orange.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item['tag']!,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 9, fontWeight: FontWeight.w700, color: _CC.orange,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Iconsax.clock, size: 11, color: _CC.textMuted),
                    const SizedBox(width: 3),
                    Text(
                      item['time']!,
                      style: GoogleFonts.plusJakartaSans(fontSize: 10, color: _CC.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13, fontWeight: FontWeight.w600,
                    color: _CC.textPrimary, height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Iconsax.bookmark, size: 14, color: _CC.textMuted),
                    const SizedBox(width: 12),
                    const Icon(Iconsax.share, size: 14, color: _CC.textMuted),
                    const Spacer(),
                    Text(
                      'Read more',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11, fontWeight: FontWeight.w600, color: _CC.blue,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(Iconsax.arrow_right_3, size: 12, color: _CC.blue),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Logo List (kept for compatibility) ──────────────────────
class logolist extends StatelessWidget {
  final List<String> ImageUrls;
  const logolist({super.key, required this.ImageUrls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ImageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CategoryButton(imageUrl: ImageUrls[index]),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imageUrl;
  const CategoryButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _CC.orange, width: 2),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipOval(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
      ),
    );
  }
}
