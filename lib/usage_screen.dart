// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class _CC {
  static const orange      = Color(0xFFE8500A);
  static const orangeLight = Color(0xFFFF6B2B);
  static const pink        = Color(0xFFC0187A);
  static const blue        = Color(0xFF3B82F6);
  static const green       = Color(0xFF10B981);
  static const bg          = Color(0xFFF7F7F9);
  static const surface     = Colors.white;
  static const textPrimary = Color(0xFF1A1A2E);
  static const textMuted   = Color(0xFF8A8A99);
  static const border      = Color(0xFFEEEEF3);
}

// ─── Transaction Model ────────────────────────────────────────
class _Transaction {
  final String title;
  final String subtitle;
  final String amount;
  final bool isDebit;
  final String image;
  final String dateGroup;

  const _Transaction({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isDebit,
    required this.image,
    required this.dateGroup,
  });
}

const _transactions = [
  _Transaction(
    title: 'Auto-renewed Cellcard Serey+',
    subtitle: '11 Mar 2026 · 3:15 PM',
    amount: '-\$1.50',
    isDebit: true,
    image: 'images/s8.png',
    dateGroup: '11 Mar 2026',
  ),
  _Transaction(
    title: 'Topped Up',
    subtitle: '11 Mar 2026 · 3:15 PM',
    amount: '+\$1.50',
    isDebit: false,
    image: 'images/s9.png',
    dateGroup: '11 Mar 2026',
  ),
  _Transaction(
    title: 'Data Bundle Purchase',
    subtitle: '10 Mar 2026 · 10:02 AM',
    amount: '-\$0.99',
    isDebit: true,
    image: 'images/s8.png',
    dateGroup: '10 Mar 2026',
  ),
  _Transaction(
    title: 'Topped Up',
    subtitle: '10 Mar 2026 · 9:45 AM',
    amount: '+\$2.00',
    isDebit: false,
    image: 'images/s9.png',
    dateGroup: '10 Mar 2026',
  ),
];

class usage extends StatefulWidget {
  const usage({super.key});

  @override
  State<usage> createState() => _usageState();
}

class _usageState extends State<usage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedFilter = 0;
  final _filters = ['All', 'Debit', 'Credit'];

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

  List<_Transaction> get _filtered {
    if (_selectedFilter == 1) return _transactions.where((t) => t.isDebit).toList();
    if (_selectedFilter == 2) return _transactions.where((t) => !t.isDebit).toList();
    return _transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _CC.bg,
      body: Column(
        children: [
          _buildHeader(),
          _buildSummaryCards(),
          _buildFilterRow(),
          const SizedBox(height: 4),
          _buildInfoBanner(),
          Expanded(child: _buildTransactionList()),
        ],
      ),
    );
  }

  // ─── Header ─────────────────────────────────────────────────
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
            Positioned(
              top: -20, right: -20,
              child: Container(
                width: 110, height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.07),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Usage',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 22, fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      _headerBtn(Iconsax.calendar_1, () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Container(
                            height: 250,
                            color: Colors.white,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text('Select Date Range', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 20),
                                ListTile(
                                  leading: const Icon(Iconsax.calendar_1),
                                  title: Text('Last 7 days', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500)),
                                  onTap: () => Navigator.pop(context, 'Last 7 days'),
                                ),
                                ListTile(
                                  leading: const Icon(Iconsax.calendar_1),
                                  title: Text('Last 30 days', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500)),
                                  onTap: () => Navigator.pop(context, 'Last 30 days'),
                                ),
                                ListTile(
                                  leading: const Icon(Iconsax.calendar_1),  
                                  title: Text('Last 90 days', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500)),
                                  onTap: () => Navigator.pop(context, 'Last 90 days'),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      const SizedBox(width: 8),
                      _headerBtn(Iconsax.filter,
                       () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Container(
                            height: 250,
                            color: Colors.white,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text('Filter Transactions', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 20),
                                ListTile(
                                  leading: const Icon(Iconsax.arrow_up_1, color: _CC.pink),
                                  title: Text('Debit Only', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500)),
                                  onTap: () => setState(() => _selectedFilter = 1),
                                ),
                                ListTile(
                                  leading: const Icon(Iconsax.arrow_down_1, color: _CC.green),
                                  title: Text('Credit Only', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500)),
                                  onTap: () => setState(() => _selectedFilter = 2),
                                ),
                                ListTile(
                                  leading: const Icon(Iconsax.filter),
                                  title: Text('All Transactions', style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500)),
                                  onTap: () => setState(() => _selectedFilter = 0),
                                ),
                              ],
                            ),                          ),
                        );
                       }),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Last 7 days · Main balance',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14, color: Colors.white,
                      fontWeight: FontWeight.w500,
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

  Widget _headerBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36, height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.18),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  // ─── Summary Cards ───────────────────────────────────────────
  Widget _buildSummaryCards() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: [
          _summaryCard('Total Spent', '\$2.49', _CC.pink, Iconsax.arrow_up_1, false),
          const SizedBox(width: 10),
          _summaryCard('Total Topped Up', '\$3.50', _CC.green, Iconsax.arrow_down_1, true),
        ],
      ),
    );
  }

  Widget _summaryCard(String label, String value, Color color, IconData icon, bool isCredit) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        decoration: BoxDecoration(
          color: _CC.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 38, height: 38,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 10, color: _CC.textMuted, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18, fontWeight: FontWeight.w800, color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─── Filter Row ──────────────────────────────────────────────
  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: List.generate(_filters.length, (i) {
          final active = _selectedFilter == i;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: active
                    ? const LinearGradient(colors: [_CC.orange, _CC.orangeLight])
                    : null,
                color: active ? null : _CC.surface,
                borderRadius: BorderRadius.circular(50),
                border: active ? null : Border.all(color: _CC.border),
                boxShadow: active
                    ? [BoxShadow(color: _CC.orange.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 3))]
                    : [],
              ),
              child: Text(
                _filters[i],
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: active ? Colors.white : _CC.textMuted,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ─── Info Banner ─────────────────────────────────────────────
  Widget _buildInfoBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: _CC.orange.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _CC.orange.withOpacity(0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Iconsax.info_circle, size: 16, color: _CC.orange),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Transactions from your main balance in the last 7 days. Some may take up to 60 min to appear.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13, fontWeight: FontWeight.w500,
                  color: _CC.orange, height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Transaction List ────────────────────────────────────────
  Widget _buildTransactionList() {
    final grouped = <String, List<_Transaction>>{};
    for (final t in _filtered) {
      grouped.putIfAbsent(t.dateGroup, () => []).add(t);
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      children: grouped.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dateLabel(entry.key),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: _CC.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 3)),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: entry.value.asMap().entries.map((e) {
                  final isLast = e.key == entry.value.length - 1;
                  return _transactionTile(e.value, isLast);
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }

  Widget _dateLabel(String date) {
    return Row(
      children: [
        Text(
          date,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w700,
            color: _CC.textMuted, letterSpacing: 0.3,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: _CC.border, thickness: 1)),
      ],
    );
  }

  Widget _transactionTile(_Transaction t, bool isLast) {
    final color = t.isDebit ? _CC.pink : _CC.green;
    final bgColor = t.isDebit ? _CC.pink.withOpacity(0.10) : _CC.green.withOpacity(0.10);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              // Icon container
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Padding(
                    padding: const EdgeInsets.all(9),
                    child: Image.asset(
                      t.image,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Title + time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13, fontWeight: FontWeight.w900,
                        color: _CC.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      t.subtitle,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13, color: _CC.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              // Amount
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    t.amount,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14, fontWeight: FontWeight.w700, color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      t.isDebit ? 'Debit' : 'Credit',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13, fontWeight: FontWeight.w700, color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(height: 1, thickness: 1, indent: 70, endIndent: 14, color: _CC.border),
      ],
    );
  }
}
