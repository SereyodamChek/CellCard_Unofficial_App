import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Add to pubspec.yaml for map links

class CellcardStorePage extends StatefulWidget {
  const CellcardStorePage({super.key});

  @override
  State<CellcardStorePage> createState() => _CellcardStorePageState();
}

class _CellcardStorePageState extends State<CellcardStorePage> {
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

    // ✅ Store data organized for scalability (add more stores easily)
    final stores = _StoreData.all;

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
          'Cellcard Stores',
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
                onTap: () => _showStoreSearch(context, stores),
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
      // ✅ Premium scrollable content with safe area
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // ✅ Quick Filter Chips
            _buildFilterChips(primaryOrange),
            
            // ✅ Store List Header
            _buildListHeader(stores.length),
            
            // ✅ Scrollable Store List
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  // TODO: Refresh store data from API
                  await Future.delayed(const Duration(milliseconds: 500));
                  if (mounted) setState(() {});
                },
                color: primaryOrange,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemCount: stores.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final store = stores[index];
                    return _PremiumStoreCard(
                      store: store,
                      onTap: () => _navigateToStoreDetails(context, store, haptic),
                      onNavigate: () => _launchMaps(store.address, haptic),
                      onCall: () => _launchPhone(store.phone, haptic),
                      primaryColor: primaryOrange,
                      accentColor: accentBlue,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // ✅ Premium Bottom Info Bar
      bottomNavigationBar: _buildInfoBar(primaryOrange),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildFilterChips(Color primary) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Colors.white,
      child: Row(
        children: [
          Icon(Icons.filter_list_rounded, size: 18, color: primary),
          const SizedBox(width: 8),
          Text(
            'Filter by:',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          // Filter chips
          _buildFilterChip('All', primary, isSelected: true),
          const SizedBox(width: 8),
          _buildFilterChip('Open Now', primary),
          const SizedBox(width: 8),
          _buildFilterChip('Services', primary),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, Color primary, {bool isSelected = false}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          // TODO: Implement filter logic
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? primary : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? primary : Colors.grey[300]!,
              width: isSelected ? 0 : 1,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListHeader(int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Text(
            'Available Stores',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '$count',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.orange[800],
              ),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {
              // TODO: Show map view
            },
            icon: const Icon(Icons.map_rounded, size: 16),
            label: Text(
              'Map View',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.orange[400],
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBar(Color primary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Icon(Icons.info_outline_rounded, size: 18, color: primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Store hours may vary. Call ahead to confirm availability.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
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

  void _navigateToStoreDetails(
    BuildContext context,
    _Store store,
    VoidCallback haptic,
  ) {
    haptic();
    // TODO: Navigate to detailed store page
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _StoreDetailSheet(store: store),
    );
  }

  Future<void> _launchMaps(String address, VoidCallback haptic) async {
    haptic();
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchPhone(String phone, VoidCallback haptic) async {
    haptic();
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showStoreSearch(BuildContext context, List<_Store> stores) {
    final controller = TextEditingController();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _StoreSearchSheet(
        controller: controller,
        stores: stores,
        onSelect: (store) {
          Navigator.pop(context);
          _navigateToStoreDetails(context, store, () => HapticFeedback.selectionClick());
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Premium Store Card Component
// ─────────────────────────────────────────────────────────────

class _PremiumStoreCard extends StatelessWidget {
  final _Store store;
  final VoidCallback onTap;
  final VoidCallback onNavigate;
  final VoidCallback onCall;
  final Color primaryColor;
  final Color accentColor;

  const _PremiumStoreCard({
    required this.store,
    required this.onTap,
    required this.onNavigate,
    required this.onCall,
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
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store Icon/Avatar with your image assets
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor.withOpacity(0.4), width: 1.5),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      store.iconPath,
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      errorBuilder: (_, __, ___) => Container(
                        width: 44,
                        height: 44,
                        color: Colors.grey[200],
                        child: Icon(Icons.store_rounded, 
                          size: 24, color: Colors.grey[500]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Store Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              store.name,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                                letterSpacing: -0.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Status badge
                          if (store.isOpen)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Open',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Address
                      Text(
                        store.address,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          height: 1.35,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Action Buttons Row
                      Row(
                        children: [
                          // Distance/Hours
                          Row(
                            children: [
                              Icon(Icons.access_time_rounded, 
                                size: 13, color: Colors.grey[500]),
                              const SizedBox(width: 4),
                              Text(
                                store.hours,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 11,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Navigate Button
                          _buildActionButton(
                            icon: Icons.navigation_rounded,
                            label: 'Navigate',
                            color: accentColor,
                            onTap: onNavigate,
                          ),
                          const SizedBox(width: 8),
                          // Call Button
                          _buildActionButton(
                            icon: Icons.phone_rounded,
                            label: 'Call',
                            color: primaryColor,
                            onTap: onCall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 4),
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: color,
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
// Store Detail Bottom Sheet
// ─────────────────────────────────────────────────────────────

class _StoreDetailSheet extends StatelessWidget {
  final _Store store;

  const _StoreDetailSheet({required this.store});

  @override
  Widget build(BuildContext context) {
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    final accentBlue = Colors.blue[700] ?? const Color(0xFF1976D2);
    
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryOrange.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    store.iconPath,
                    width: 24,
                    height: 24,
                    errorBuilder: (_, __, ___) => 
                      Icon(Icons.store_rounded, size: 24, color: primaryOrange),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.name,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          if (store.isOpen)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Open Now',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[700],
                                ),
                              ),
                            ),
                          const SizedBox(width: 6),
                          Text(
                            store.hours,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              color: Colors.grey[600],
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
          
          const Divider(height: 24, thickness: 1),
          
          // Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(Icons.location_on_rounded, 'Address', store.address),
                const SizedBox(height: 12),
                _buildDetailRow(Icons.phone_rounded, 'Phone', store.phone, 
                  isTappable: true, onTap: () {}),
                const SizedBox(height: 12),
                _buildDetailRow(Icons.access_time_rounded, 'Hours', store.fullHours),
                if (store.services.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _buildDetailRow(Icons.build_rounded, 'Services', 
                    store.services.join(', ')),
                ],
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(
                        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(store.address)}',
                      );
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.navigation_rounded, size: 18),
                    label: Text(
                      'Get Directions',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: accentBlue,
                      side: BorderSide(color: accentBlue.withOpacity(0.5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse('tel:${store.phone}');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    icon: const Icon(Icons.phone_rounded, size: 18),
                    label: Text(
                      'Call Store',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, 
      {bool isTappable = false, VoidCallback? onTap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[500]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 2),
              isTappable
                  ? Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            value,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange[400],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.orange[400],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(
                      value,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        height: 1.35,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Store Search Bottom Sheet
// ─────────────────────────────────────────────────────────────

class _StoreSearchSheet extends StatefulWidget {
  final TextEditingController controller;
  final List<_Store> stores;
  final Function(_Store) onSelect;

  const _StoreSearchSheet({
    required this.controller,
    required this.stores,
    required this.onSelect,
  });

  @override
  State<_StoreSearchSheet> createState() => _StoreSearchSheetState();
}

class _StoreSearchSheetState extends State<_StoreSearchSheet> {
  @override
  Widget build(BuildContext context) {
    final primaryOrange = Colors.orange[400] ?? const Color(0xFFFF9800);
    final query = widget.controller.text.toLowerCase();
    
    final filtered = query.isEmpty
        ? widget.stores
        : widget.stores.where((store) =>
            store.name.toLowerCase().contains(query) ||
            store.address.toLowerCase().contains(query) ||
            store.services.any((s) => s.toLowerCase().contains(query))
          ).toList();

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
              hintText: 'Search stores...',
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
          
          // Results
          if (filtered.isEmpty)
            _buildEmptySearchState(primaryOrange, query)
          else
            Expanded(
              child: ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final store = filtered[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => widget.onSelect(store),
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: primaryOrange.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                store.iconPath,
                                width: 20,
                                height: 20,
                                errorBuilder: (_, __, ___) => 
                                  Icon(Icons.store_rounded, size: 20, color: primaryOrange),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    store.name,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    store.address,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                },
              ),
            ),
          
          // Close button
          if (filtered.isEmpty) ...[
            const SizedBox(height: 16),
            OutlinedButton(
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
          ],
        ],
      ),
    );
  }

  Widget _buildEmptySearchState(Color primary, String query) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 36,
              color: primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No stores found',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            query.isEmpty 
                ? 'Try adjusting your filters'
                : 'Try different keywords',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Store Data Model (Organized, Scalable, Type-Safe)
// ─────────────────────────────────────────────────────────────

class _StoreData {
  // ✅ All stores in one place - easy to add/update
  static const List<_Store> all = [
    _Store(
      id: 'store1',
      name: 'Cellcard Flagship Store',
      address: 'Monivong Blvd, Phnom Penh',
      phone: '1686',
      hours: '8AM - 8PM',
      fullHours: 'Mon-Sun: 8:00 AM - 8:00 PM',
      iconPath: 'images/p1.jpeg', // ✅ Your image asset
      isOpen: true,
      services: ['SIM Registration', 'Device Sales', 'Bill Payment'],
      latitude: 11.5564,
      longitude: 104.9282,
    ),
    _Store(
      id: 'store2',
      name: 'Cellcard Express - Aeon 1',
      address: 'Aeon Mall 1, Samdach Sothearos Blvd',
      phone: '1686',
      hours: '10AM - 10PM',
      fullHours: 'Mon-Sun: 10:00 AM - 10:00 PM',
      iconPath: 'images/z36.png', // ✅ Your image asset
      isOpen: true,
      services: ['Top-up', 'Plan Changes', 'Support'],
      latitude: 11.5448,
      longitude: 104.9388,
    ),
    _Store(
      id: 'store3',
      name: 'Cellcard Service Point - TK',
      address: 'Tuol Kork District, Phnom Penh',
      phone: '1686',
      hours: '9AM - 6PM',
      fullHours: 'Mon-Fri: 9:00 AM - 6:00 PM, Sat: 9AM-4PM',
      iconPath: 'images/z38.png', // ✅ Your image asset
      isOpen: false,
      services: ['Technical Support', 'SIM Replacement'],
      latitude: 11.5734,
      longitude: 104.8998,
    ),
  ];
}

class _Store {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String hours; // Short format: "8AM - 8PM"
  final String fullHours; // Full format for details
  final String iconPath; // ✅ Your image asset path
  final bool isOpen;
  final List<String> services;
  final double latitude;
  final double longitude;

  const _Store({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.hours,
    required this.fullHours,
    required this.iconPath,
    required this.isOpen,
    required this.services,
    required this.latitude,
    required this.longitude,
  });
}