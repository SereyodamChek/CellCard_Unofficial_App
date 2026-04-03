import 'package:flutter/material.dart';

class CellcardSerey extends StatelessWidget {
  const CellcardSerey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero with Image Banner ──────────────────────────
            Stack(
              children: [
                Image.asset(
                  'images/p3.jpg',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                ),
                // Back button
                Positioned(
                  top: 40, left: 12, // Pushed down slightly for Safe Area
                  child: Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.25),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ── Description ───────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE8E8E8), width: 0.5),
                ),
                child: const Text(
                  'Big data plans designed for full freedom — discover and enjoy your kind of fun with rollover benefits.',
                  style: TextStyle(fontSize: 12.5, color: Color(0xFF777777), height: 1.6),
                ),
              ),
            ),

            // ── Section label ─────────────────────────────────────
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
              child: Text(
                'AVAILABLE PLANS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFAAAAAA),
                  letterSpacing: 1.0,
                ),
              ),
            ),

            // ── Plan cards ────────────────────────────────────────
            _PlanCard(
              title: 'Cellcard Serey+',
              price: '\$1.50',
              data: '15GB',
              calls: '100',
              sms: '100',
              validity: '7 days',
              autoRenewDays: '7 days',
            ),
            _PlanCard(
              title: 'Cellcard Serey+',
              price: '\$4.00',
              data: '25GB',
              calls: '2500',
              sms: '2500',
              validity: '28 days',
              autoRenewDays: '28 days',
              isPopular: true,
            ),
            _PlanCard(
              title: 'Cellcard Serey+',
              price: '\$6.00',
              data: '60GB',
              calls: '150',
              sms: '150',
              validity: '30 days',
              autoRenewDays: '30 days',
            ),
            _PlanCard(
              title: 'Cellcard Serey+',
              price: '\$10.00',
              data: '100GB',
              calls: '200',
              sms: '200',
              validity: '30 days',
              autoRenewDays: '30 days',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Plan Card Widget ───────────────────────────────────────────────────────────

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String data;
  final String calls;
  final String sms;
  final String validity;
  final String autoRenewDays;
  final bool isPopular;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.data,
    required this.calls,
    required this.sms,
    required this.validity,
    required this.autoRenewDays,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF6B00);
    const orangeLight = Color(0xFFFF9A3C);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? orange : const Color(0xFFEBEBEB),
          width: isPopular ? 1.5 : 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Row(
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
                const SizedBox(width: 10),
                // Title + validity
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          if (isPopular) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'POPULAR',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Valid for $validity',
                        style: const TextStyle(fontSize: 11, color: Color(0xFFAAAAAA)),
                      ),
                    ],
                  ),
                ),
                // Price badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [orange, orangeLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 24, thickness: 0.5, color: Color(0xFFF0F0F0)),
          ),

          // Stats row
          IntrinsicHeight(
            child: Row(
              children: [
                _StatItem(value: data, label: 'Data'),
                const VerticalDivider(width: 0.5, thickness: 0.5, color: Color(0xFFF0F0F0)),
                _StatItem(value: calls, label: 'Mins'),
                const VerticalDivider(width: 0.5, thickness: 0.5, color: Color(0xFFF0F0F0)),
                _StatItem(value: sms, label: 'SMS'),
              ],
            ),
          ),

          // Perk chips
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
            child: Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                _PerkChip(label: 'Auto-renew $autoRenewDays'),
                const _PerkChip(label: 'Rollover 1 year'),
              ],
            ),
          ),

          // Subscribe button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: SizedBox(
              width: double.infinity,
              child: isPopular
                  ? DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [orange, orangeLight],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    )
                  : OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        side: const BorderSide(color: orange, width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: orange),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stat item ─────────────────────────────────────────────────────────────────

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFFAAAAAA),
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Perk chip ─────────────────────────────────────────────────────────────────

class _PerkChip extends StatelessWidget {
  final String label;
  const _PerkChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5EE),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline_rounded, size: 12, color: Color(0xFFFF6B00)),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFF6B00),
            ),
          ),
        ],
      ),
    );
  }
}
