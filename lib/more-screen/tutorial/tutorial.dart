import 'package:cellcard_app/more-screen/card1-.dart';
import 'package:cellcard_app/more-screen/tutorial/but3.dart';
import 'package:cellcard_app/more-screen/tutorial/buy1.dart';
import 'package:cellcard_app/more-screen/tutorial/buy2.dart';
import 'package:cellcard_app/more-screen/tutorial/buy4.dart';
import 'package:cellcard_app/more-screen/tutorial/top_up1.dart';
import 'package:cellcard_app/more-screen/tutorial/top_up2.dart';
import 'package:cellcard_app/more-screen/tutorial/top_up3.dart';
import 'package:cellcard_app/more-screen/tutorial/top_up4.dart';
import 'package:cellcard_app/more-screen/tutorial/top_up5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ✅ Proper naming + state management
class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Your brand colors preserved with safe fallbacks
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    final primaryOrangeDark = Colors.orange[700] ?? const Color(0xFFF57C00);
    final backgroundColor = Colors.grey[200] ?? const Color(0xFFEEEEEE);
    final surfaceColor = Colors.white;
    final textColor = Colors.black87;
    final mutedText = Colors.grey[600] ?? const Color(0xFF757575);

    // ✅ Haptic feedback for premium interactions
    final haptic = () => HapticFeedback.lightImpact();

    // ✅ Tutorial data organized by category (scalable & maintainable)
    final tutorials = _TutorialData.all;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Professional AppBar with gradient + search
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
          'Tutorials',
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        actions: [
          // Search icon
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _showSearchDialog(context, tutorials),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white.withOpacity(0.95),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // ✅ Premium TabBar with pill-style indicators
          _buildPremiumTabBar(primaryOrange, primaryOrangeDark),
          
          // ✅ Scrollable Tutorial Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Top-up Tutorials
                _buildTutorialGrid(
                  context,
                  tutorials.topUp,
                  primaryOrange,
                  haptic,
                  _searchQuery,
                ),
                // Tab 2: Buy Plan & Services
                _buildTutorialGrid(
                  context,
                  tutorials.buyPlans,
                  primaryOrange,
                  haptic,
                  _searchQuery,
                ),
                // Tab 3: Manage Account & Profile
                _buildTutorialGrid(
                  context,
                  tutorials.manageAccount,
                  primaryOrange,
                  haptic,
                  _searchQuery,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildPremiumTabBar(Color primary, Color primaryDark) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        indicator: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: primary,
        labelStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700,
          fontSize: 13,
          letterSpacing: -0.2,
        ),
        unselectedLabelColor: Colors.white.withOpacity(0.85),
        unselectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'Top-up'),
          Tab(text: 'Buy Plans'),
          Tab(text: 'Manage Account'),
        ],
      ),
    );
  }

  Widget _buildTutorialGrid(
    BuildContext context,
    List<_TutorialItem> items,
    Color primary,
    VoidCallback haptic,
    String searchQuery,
  ) {
    // Filter items based on search query
    final filtered = searchQuery.isEmpty
        ? items
        : items.where((item) => 
            item.title.toLowerCase().contains(searchQuery.toLowerCase())
          ).toList();

    if (filtered.isEmpty) {
      return _buildEmptyState(primary, searchQuery);
    }

    return RefreshIndicator(
      onRefresh: () async {
        // TODO: Refresh tutorial data from API
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) setState(() {});
      },
      color: primary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.85, // Taller cards for better content display
          ),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final tutorial = filtered[index];
            return _PremiumTutorialCard(
              tutorial: tutorial,
              onTap: () {
                haptic();
                _navigateToTutorial(context, tutorial);
              },
              primaryColor: primary,
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(Color primary, String query) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 40,
                color: primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No tutorials found',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              query.isEmpty 
                  ? 'Check back later for new tutorials'
                  : 'Try different keywords',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            if (query.isNotEmpty) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() => _searchQuery = '');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Clear Search'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Navigation & Interactions
  // ─────────────────────────────────────────────────────────────

  void _navigateToTutorial(BuildContext context, _TutorialItem tutorial) {
    // Map tutorial IDs to destination widgets
    final destinations = {
      // Top-up tutorials
      'top_up1': const top_up1(),
      'top_up2': const top_up2(),
      'top_up3': const top_up3(),
      'top_up4': const top_up4(),
      'top_up5': const top_up5(),
      // Buy plans tutorials
      'buy1': const buy3(),
      'buy2': const buy2(),
      'buy3': const buy(),
      // Manage account tutorials
      'manage1': const buy4(),
    };

    final destination = destinations[tutorial.id];
    if (destination != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => destination),
      );
    } else {
      // Fallback: show info dialog if destination not configured
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            tutorial.title,
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700),
          ),
          content: Text(
            'Tutorial content will be displayed here.',
            style: GoogleFonts.plusJakartaSans(color: Colors.grey[600]),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: GoogleFonts.plusJakartaSans(color: Colors.orange[400])),
            ),
          ],
        ),
      );
    }
  }

  void _showSearchDialog(BuildContext context, _TutorialData allTutorials) {
    final controller = TextEditingController(text: _searchQuery);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _SearchBottomSheet(
        controller: controller,
        onSearch: (query) {
          setState(() => _searchQuery = query);
          Navigator.pop(context);
        },
        allTutorials: allTutorials,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Premium Tutorial Card Component
// ─────────────────────────────────────────────────────────────

class _PremiumTutorialCard extends StatelessWidget {
  final _TutorialItem tutorial;
  final VoidCallback onTap;
  final Color primaryColor;

  const _PremiumTutorialCard({
    required this.tutorial,
    required this.onTap,
    required this.primaryColor,
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
              // Image section with gradient overlay
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Tutorial image with error handling
                      Image.asset(
                        tutorial.imagePath,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[200],
                          child: Icon(
                            tutorial.icon,
                            size: 40,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      // Subtle gradient overlay for text readability
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.4),
                            ],
                          ),
                        ),
                      ),
                      // Play button badge
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 18,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Content section
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with proper truncation
                      Text(
                        tutorial.title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      // Duration/Progress indicator
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 12,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tutorial.duration,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 10,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          // Completion indicator
                          if (tutorial.isCompleted)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    size: 10,
                                    color: Colors.green[700],
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    'Done',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
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
  }
}

// ─────────────────────────────────────────────────────────────
// Search Bottom Sheet Component
// ─────────────────────────────────────────────────────────────

class _SearchBottomSheet extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final _TutorialData allTutorials;

  const _SearchBottomSheet({
    required this.controller,
    required this.onSearch,
    required this.allTutorials,
  });

  @override
  State<_SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<_SearchBottomSheet> {
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
          
          // Search field
          TextField(
            controller: widget.controller,
            autofocus: true,
            style: GoogleFonts.plusJakartaSans(fontSize: 15),
            decoration: InputDecoration(
              hintText: 'Search tutorials...',
              hintStyle: GoogleFonts.plusJakartaSans(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.grey[400],
                size: 20,
              ),
              suffixIcon: widget.controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear_rounded, color: Colors.grey[400]),
                      onPressed: () {
                        widget.controller.clear();
                        setState(() {});
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            onChanged: (value) => setState(() {}),
          ),
          
          const SizedBox(height: 16),
          
          // Quick suggestions
          if (widget.controller.text.isEmpty) ...[
            Text(
              'Popular searches',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSearchChip('Top-up', primaryOrange),
                _buildSearchChip('Link card', primaryOrange),
                _buildSearchChip('Profile', primaryOrange),
                _buildSearchChip('Schedule', primaryOrange),
              ],
            ),
            const SizedBox(height: 16),
          ],
          
          // Action buttons
          Row(
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
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSearch(widget.controller.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryOrange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Search',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchChip(String label, Color primary) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.controller.text = label;
          widget.onSearch(label);
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primary.withOpacity(0.3)),
          ),
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: primary,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Tutorial Data Model (Organized, Scalable, Type-Safe)
// ─────────────────────────────────────────────────────────────

class _TutorialData {
  final List<_TutorialItem> topUp;
  final List<_TutorialItem> buyPlans;
  final List<_TutorialItem> manageAccount;

  const _TutorialData({
    required this.topUp,
    required this.buyPlans,
    required this.manageAccount,
  });

  // ✅ All tutorials in one place for easy management
  static const _TutorialData all = _TutorialData(
    topUp: [
      _TutorialItem(
        id: 'top_up1',
        title: 'Top Up For Own Number',
        imagePath: 'images/z43.png',
        icon: Icons.phone_android_rounded,
        duration: '2:30',
        isCompleted: false,
      ),
      _TutorialItem(
        id: 'top_up2',
        title: 'Top Up For Another Number',
        imagePath: 'images/z43.png',
        icon: Icons.people_outline_rounded,
        duration: '2:45',
        isCompleted: false,
      ),
      _TutorialItem(
        id: 'top_up3',
        title: 'Set Schedule Top Up',
        imagePath: 'images/z44.png',
        icon: Icons.schedule_rounded,
        duration: '3:15',
        isCompleted: false,
      ),
      _TutorialItem(
        id: 'top_up4',
        title: 'Link Credit/Debit Card',
        imagePath: 'images/z45.jpg',
        icon: Icons.credit_card_rounded,
        duration: '4:00',
        isCompleted: false,
      ),
      _TutorialItem(
        id: 'top_up5',
        title: 'Link Bank Account',
        imagePath: 'images/z45.jpg',
        icon: Icons.account_balance_rounded,
        duration: '3:45',
        isCompleted: false,
      ),
    ],
    buyPlans: [
      _TutorialItem(
        id: 'buy1',
        title: 'Subscribe Add-on Plan',
        imagePath: 'images/z46.jpg',
        icon: Icons.add_circle_outline_rounded,
        duration: '3:20',
        isCompleted: false,
      ),
      _TutorialItem(
        id: 'buy2',
        title: 'Send Gift to Another',
        imagePath: 'images/z46.jpg',
        icon: Icons.card_giftcard_rounded,
        duration: '2:50',
        isCompleted: false,
      ),
      _TutorialItem(
        id: 'buy3',
        title: 'Subscribe Value Added Services',
        imagePath: 'images/z46.jpg',
        icon: Icons.star_outline_rounded,
        duration: '3:30',
        isCompleted: false,
      ),
    ],
    manageAccount: [
      _TutorialItem(
        id: 'manage1',
        title: 'Update Profile',
        imagePath: 'images/f2.png',
        icon: Icons.person_outline_rounded,
        duration: '2:15',
        isCompleted: false,
      ),
    ],
  );
}

class _TutorialItem {
  final String id;
  final String title;
  final String imagePath;
  final IconData icon; // Fallback icon if image fails
  final String duration;
  final bool isCompleted;

  const _TutorialItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.icon,
    required this.duration,
    this.isCompleted = false,
  });
}