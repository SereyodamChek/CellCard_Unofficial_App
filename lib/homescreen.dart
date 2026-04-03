// ignore_for_file: unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cellcard_app/Entertainment_Lifestyle_Services/Entertainment_Lifestyle_Services.dart';
import 'package:cellcard_app/Entertainment_Lifestyle_Services/Insurance_Financial_Services.dart';
import 'package:cellcard_app/Telecom_Plan_Services/Cellcard_Serey.dart';
import 'package:cellcard_app/Telecom_Plan_Services/Telecom_Plan_Services.dart';
import 'package:cellcard_app/details_screen.dart';
import 'package:cellcard_app/my-plan_page.dart/my-plan.dart';
import 'package:cellcard_app/my-plan_page.dart/quick_pay.dart';
import 'package:cellcard_app/see_all_screen/game1.dart';
import 'package:cellcard_app/see_all_screen/hot_promos_detail.dart';
import 'package:cellcard_app/see_all_screen/hotpromos_detail2.dart';
import 'package:cellcard_app/see_all_screen/see_all_acreen.dart';
import 'package:cellcard_app/top_up_page.dart/for_my_num.dart';
import 'package:cellcard_app/top_up_page.dart/for_others.dart';
import 'package:cellcard_app/top_up_page.dart/sechedule_top_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cellcard_app/discover/discover_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ─── Brand Colors ────────────────────────────────────────────────
class _CC {
  static const orange = Color(0xFFE8500A);
  static const orangeLight = Color(0xFFFF6B2B);
  static const pink = Color(0xFFC0187A);
  static const pinkDark = Color(0xFF8B0D5C);
  static const blue = Color(0xFF3B82F6);
  static const indigo = Color(0xFF6366F1);
  static const bg = Color(0xFFF7F7F9);
  static const surface = Colors.white;
  static const textPrimary = Color(0xFF1A1A2E);
  static const textMuted = Color(0xFF8A8A99);
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Map<String, dynamic>> _promos = [
    {'image': 'images/p3.jpg', 'text': 'Discover New Plans', 'color': const Color(0xFF667EEA)},
    {'image': 'images/p4.jpg', 'text': 'Cellcard Home Wi-Fi', 'color': const Color(0xFFF093FB)},
    {'image': 'images/p5.jpg', 'text': 'Get the Latest Updates', 'color': const Color(0xFF4FACFE)},
    {'image': 'images/f1.jpg', 'text': 'PlayGame Add-on', 'color': const Color(0xFF43E97B)},
  ];

  int _currentPromo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _CC.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildBalanceCard(),
            const SizedBox(height: 14),
            _buildQuickActions(),
            _buildSectionHeader('What\'s Hot 🔥', 'See all', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SeeAll()));
            }),
            _buildPromoCarousel(),
            _buildDotIndicator(),
            _buildSectionHeader('My Plan', 'Manage ›', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const My_plan()));
            }),
            _buildPlanCard(),
            _buildSectionHeader('Subscribe', 'Discover more', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const DiscoverPage()));
            }),
            _buildSubscribeCards(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  // ─── Header ───────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE8500A), Color(0xFFFF6B2B), Color(0xFFFF8C00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Decorative circles
            Positioned(
              top: -20, right: -20,
              child: Container(
                width: 120, height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),
            Positioned(
              bottom: -40, right: 50,
              child: Container(
                width: 90, height: 95,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  // Avatar
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.25),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: ClipOval(
                      child: Image.asset('images/p1.jpeg', fit: BoxFit.cover),
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
                              '011 787 824',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 17, fontWeight: FontWeight.w700,
                                color: Colors.white, letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              width: 19, height: 19,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: const Icon(Iconsax.tick_circle, size: 10, color: _CC.orange),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Icon(Iconsax.arrow_swap_horizontal, color: Colors.white, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                'Switch Account',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12, color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Bell
                  _headerIconBtn(Iconsax.notification, () {}),
                  const SizedBox(width: 8),
                  // Flag
                  Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.18),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipOval(
                        child: Image.asset('images/p2.png', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerIconBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36, height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.18),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }

  // ─── Balance Card ─────────────────────────────────────────────
  Widget _buildBalanceCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Transform.translate(
        offset: const Offset(0, -14),
        child: Container(
          decoration: BoxDecoration(
            color: _CC.surface,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 24, offset: const Offset(0, 8)),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MAIN BALANCE',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13, fontWeight: FontWeight.w900,
                      color: _CC.textMuted, letterSpacing: 0.8,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [_CC.orange, _CC.orangeLight],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '✦ Cellcard Serey+',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                '\$1.50',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 38, fontWeight: FontWeight.w800,
                  color: _CC.pink, letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Valid until: 15 Jan 2024 · 06:57 PM',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12, color: _CC.textMuted,
                      fontWeight: FontWeight.w900, letterSpacing: 0.3,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Detail())),
                    child: Row(
                      children: [
                        Text(
                          'Details',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13, fontWeight: FontWeight.w900, color: _CC.blue,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Iconsax.arrow_right_3, color: _CC.blue, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Quick Actions ────────────────────────────────────────────
  Widget _buildQuickActions() {
    final actions = [
      {'icon': Iconsax.mobile, 'label': 'Top Up', 'onTap': _showTopUpSheet},
      {'icon': Iconsax.card, 'label': 'My Plan', 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (_) => const My_plan()))},
      {'icon': Iconsax.money_send, 'label': 'Quick Pay', 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (_) => const quick_pay()))},
      {'icon': Iconsax.arrow_swap_horizontal, 'label': 'Transfer', 'onTap': () {}},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [_CC.pink, _CC.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: actions.map((a) => _actionItem(
            a['icon'] as IconData,
            a['label'] as String,
            a['onTap'] as VoidCallback,
          )).toList(),
        ),
      ),
    );
  }

  Widget _actionItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52, height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Section Header ───────────────────────────────────────────
  Widget _buildSectionHeader(String title, String action, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17, fontWeight: FontWeight.w700, color: _CC.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              action,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13, fontWeight: FontWeight.w600, color: _CC.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Promo Carousel ───────────────────────────────────────────
  Widget _buildPromoCarousel() {
    return SizedBox(
      height: 230,
      child: CarouselSlider.builder(
        itemCount: _promos.length,
        itemBuilder: (context, index, _) {
          return GestureDetector(
            onTap: () => _onPromoTap(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: _CC.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 14, offset: const Offset(0, 4)),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      _promos[index]['image']!,
                      height: 155, width: double.infinity,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _promos[index]['text']!,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13, fontWeight: FontWeight.w600, color: _CC.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [_CC.blue, _CC.indigo]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Subscribe',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 230,
          viewportFraction: 0.88,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enableInfiniteScroll: true,
          onPageChanged: (index, _) => setState(() => _currentPromo = index),
        ),
      ),
    );
  }

  void _onPromoTap(int index) {
    final destinations = [
      const CellcardSerey(),
      const hotpromos_detail2(),
      const hotpromos_detail(),
      const GameRewardsPage(),
    ];
    if (index < destinations.length) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => destinations[index]));
    }
  }

  Widget _buildDotIndicator() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: AnimatedSmoothIndicator(
          activeIndex: _currentPromo,
          count: _promos.length,
          effect: const CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 20, height: 6, borderRadius: BorderRadius.all(Radius.circular(3)),
              color: _CC.orange,
            ),
            dotDecoration: DotDecoration(
              width: 6, height: 6, borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Color(0xFFDDDDE8),
            ),
          ),
        ),
      ),
    );
  }

  // ─── My Plan Card ─────────────────────────────────────────────
  Widget _buildPlanCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: _CC.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 14, offset: const Offset(0, 4)),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Renewing banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromARGB(255, 245, 162, 67), _CC.orangeLight]),
              ),
              child: Row(
                children: [
                  _PulsingDot(),
                  const SizedBox(width: 8),
                  Text(
                    'Renewing today',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plan row
                  Row(
                    children: [
                // Avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/p7.png',
                    width: 38,
                    height: 38,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cellcard Serey+', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w700, color: _CC.textPrimary)),
                          Text('\$1.50 / month', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: _CC.pink, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Iconsax.arrow_right_3, color: _CC.blue, size: 20),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Usage bars
                  _usageBar('Data', '3.8 GB', '10 GB', 0.38, const LinearGradient(colors: [_CC.orange, Color(0xFFFF8C00)])),
                  const SizedBox(height: 8),
                  _usageBar('Voice', '65 min', '100 min', 0.65, const LinearGradient(colors: [_CC.pink, _CC.orange])),
                  const SizedBox(height: 8),
                  _usageBar('SMS', '10', '50', 0.20, const LinearGradient(colors: [_CC.blue, _CC.indigo])),
                  const SizedBox(height: 14),
                  // Rollover tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [_CC.pink, _CC.pinkDark]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      const Icon(Iconsax.calendar_1, size: 14, color: Colors.white),
                        const SizedBox(width: 6),
                        Text('Rollover reminder', style: GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Footer
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Save unused bundle before renew', style: GoogleFonts.plusJakartaSans(fontSize: 11, color: _CC.textMuted)),
                            Text('10 Mar 2025 · 06:57 PM', style: GoogleFonts.plusJakartaSans(fontSize: 11, color: _CC.textMuted)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [_CC.blue, _CC.indigo]),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Renew Now',
                          style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usageBar(String label, String used, String total, double fraction, Gradient gradient) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 11, color: _CC.textMuted, fontWeight: FontWeight.w500)),
            Text('$used / $total', style: GoogleFonts.plusJakartaSans(fontSize: 11, color: _CC.textPrimary, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 5, width: double.infinity,
          decoration: BoxDecoration(color: const Color(0xFFF0F0F5), borderRadius: BorderRadius.circular(3)),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: fraction,
            child: Container(
              decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Subscribe Cards ──────────────────────────────────────────
  Widget _buildSubscribeCards() {
    final cards = [
      {'icon': Iconsax.mobile, 'label': 'Telecom\nServices', 'bg': const Color(0xFFFEF3E8), 'iconColor': _CC.orange, 'route': const Telecom_Plan_Services()},
      {'icon': Iconsax.video_play, 'label': 'Entertainment', 'bg': const Color(0xFFEEF2FF), 'iconColor': _CC.indigo, 'route': const Entertainment_Lifestyle_Services()},
      {'icon': Iconsax.wallet, 'label': 'Financial\nServices', 'bg': const Color(0xFFFDF2F8), 'iconColor': _CC.pink, 'route': const Insurance_Financial_Services()},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: cards.map((c) {
          return Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => c['route'] as Widget)),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _CC.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 44, height: 44,
                      decoration: BoxDecoration(
                        color: c['bg'] as Color,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(c['icon'] as IconData, color: c['iconColor'] as Color, size: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      c['label'] as String,
                      style: GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.w600, color: _CC.textPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ─── FAB ──────────────────────────────────────────────────────
  Widget _buildFAB() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [_CC.orangeLight, _CC.orange]),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [BoxShadow(color: _CC.orange.withOpacity(0.45), blurRadius: 20, offset: const Offset(0, 6))],
      ),
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        icon: const Icon(Iconsax.message, color: Colors.white, size: 18),
        label: Text('Chat', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }

  // ─── Top-Up Bottom Sheet ──────────────────────────────────────
  void _showTopUpSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: _CC.bg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 36, height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              height: 90,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [_CC.orange, _CC.orangeLight]),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text('Top Up', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12),
            _sheetItem('For my number', Iconsax.mobile, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForMyNumber()))),
            _sheetItem('For another number', Iconsax.call_add, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForOther()))),
            _sheetItem('Schedule a top-up', Iconsax.calendar_add, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScheduleTopUp()))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sheetItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: _CC.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: _CC.orange, size: 20),
            const SizedBox(width: 12),
            Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w600, color: _CC.textPrimary)),
            const Spacer(),
            const Icon(Iconsax.arrow_right_3, color: _CC.blue, size: 18),
          ],
        ),
      ),
    );
  }
}

// ─── Pulsing Dot Widget ───────────────────────────────────────
class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _a;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat(reverse: true);
    _a = Tween<double>(begin: 1.0, end: 0.3).animate(_c);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _a,
      builder: (_, __) => Opacity(
        opacity: _a.value,
        child: Container(
          width: 8, height: 8,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
      ),
    );
  }
}
