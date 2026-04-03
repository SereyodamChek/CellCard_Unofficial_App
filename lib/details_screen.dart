// ignore_for_file: unused_field

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class _CC {
  static const orange      = Color(0xFFE8500A);
  static const orangeLight = Color(0xFFFF6B2B);
  static const pink        = Color(0xFFC0187A);
  static const blue        = Color(0xFF3B82F6);
  static const green       = Color(0xFF10B981);
  static const red         = Color(0xFFEF4444);
  static const amber       = Color(0xFFF59E0B);
  static const bg          = Color(0xFFF7F7F9);
  static const surface     = Colors.white;
  static const textPrimary = Color(0xFF1A1A2E);
  static const textMuted   = Color(0xFF8A8A99);
  static const border      = Color(0xFFEEEEF3);
}

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _CC.bg,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPlanBadge(),
                  const SizedBox(height: 20),
                  const ActiveStatusWidget(),
                  const SizedBox(height: 20),
                  _buildTopUpButton(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Account Status Guide'),
                  const SizedBox(height: 12),
                  _buildStatusCard(
                    title: 'Active',
                    titleColor: _CC.green,
                    accentColor: _CC.green,
                    icon: Iconsax.tick_circle,
                    items: [
                      const _StatusItem(true,  'Incoming & outgoing calls, SMS, and data usage are all available.'),
                      const _StatusItem(true,  'Main balance can be used for subscriptions, cross-net and overseas calls/SMS.'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildStatusCard(
                    title: 'Inactive',
                    titleColor: _CC.textMuted,
                    accentColor: _CC.textMuted,
                    icon: Iconsax.pause_circle,
                    items: [
                      const _StatusItem(true,  'Incoming calls and SMS are available.'),
                      const _StatusItem(true,  'Emergency calls to 117, 118, and 119 are free of charge.'),
                      const _StatusItem(false, 'Subscriptions, data usage, and outgoing calls/SMS are blocked.'),
                      const _StatusItem(false, 'Main balance usage is blocked.'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildStatusCard(
                    title: 'Suspended',
                    titleColor: _CC.red,
                    accentColor: _CC.red,
                    icon: Iconsax.close_circle,
                    items: [
                      const _StatusItem(true,  'Emergency calls to 117, 118, and 119 are still free of charge.'),
                      const _StatusItem(false, 'Incoming & outgoing calls, SMS, and data usage are blocked.'),
                      const _StatusItem(false, 'Subscriptions, data, and main balance usage are all blocked.'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoBanner(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Header ─────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                  ),
                  Expanded(
                    child: Text(
                      'Account Details',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Plan Badge ──────────────────────────────────────────────
  Widget _buildPlanBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _CC.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [_CC.pink, Color(0xFF8B0D5C)]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Iconsax.star, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current Plan', style: GoogleFonts.plusJakartaSans(fontSize: 11, color: _CC.textMuted, fontWeight: FontWeight.w500)),
              Text('Cellcard Serey+', style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w700, color: _CC.textPrimary)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: _CC.green.withOpacity(0.10),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: _CC.green)),
                const SizedBox(width: 5),
                Text('Active', style: GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.w700, color: _CC.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Top Up Button ────────────────────────────────────────────
  Widget _buildTopUpButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [_CC.blue, Color(0xFF6366F1)]),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: _CC.blue.withOpacity(0.35), blurRadius: 14, offset: const Offset(0, 5))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Iconsax.mobile, color: Colors.white, size: 20),
                const SizedBox(width: 10),
                Text('Top Up Now', style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
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
        Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w700, color: _CC.textPrimary)),
      ],
    );
  }

  // ─── Status Card ─────────────────────────────────────────────
  Widget _buildStatusCard({
    required String title,
    required Color titleColor,
    required Color accentColor,
    required IconData icon,
    required List<_StatusItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _CC.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: accentColor, width: 4)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 3))],
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 18),
              const SizedBox(width: 8),
              Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor)),
            ],
          ),
          const SizedBox(height: 10),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 18, height: 18,
                  margin: const EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    color: (item.isCheck ? _CC.green : _CC.red).withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.isCheck ? Icons.check_rounded : Icons.close_rounded,
                    size: 12,
                    color: item.isCheck ? _CC.green : _CC.red,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.text,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12, color: _CC.textMuted, height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  // ─── Info Banner ─────────────────────────────────────────────
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: _CC.amber.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _CC.amber.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Iconsax.info_circle, size: 16, color: _CC.amber),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'After suspension, your number is retained for 90 days for reactivation. If no request is made, it will be recycled and made available for resale.',
              style: GoogleFonts.plusJakartaSans(fontSize: 11, color: _CC.amber, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Status Item Model ────────────────────────────────────────
class _StatusItem {
  final bool isCheck;
  final String text;
  const _StatusItem(this.isCheck, this.text);
}

// ─── Active Status Widget ─────────────────────────────────────
class ActiveStatusWidget extends StatefulWidget {
  const ActiveStatusWidget({super.key});
  @override
  State<ActiveStatusWidget> createState() => _ActiveStatusWidgetState();
}

class _ActiveStatusWidgetState extends State<ActiveStatusWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _sweepAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _sweepAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _CC.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _sweepAnim,
            builder: (_, __) => CustomPaint(
              size: const Size(220, 130),
              painter: _GaugePainter(progress: _sweepAnim.value),
            ),
          ),
          const SizedBox(height: 16),
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: _CC.green.withOpacity(0.10),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: _CC.green.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8, height: 8,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: _CC.green),
                ),
                const SizedBox(width: 8),
                Text('Active', style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700, color: _CC.green)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Valid until: 11 Jan 2025',
            style: GoogleFonts.plusJakartaSans(fontSize: 13, color: _CC.textMuted),
          ),
          const SizedBox(height: 16),
          // Info row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: _CC.green.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Iconsax.tick_circle, color: _CC.green, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Your account is active. All services are available.',
                    style: GoogleFonts.plusJakartaSans(fontSize: 12, color: _CC.green, height: 1.4),
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

// ─── Gauge Painter ────────────────────────────────────────────
class _GaugePainter extends CustomPainter {
  final double progress;
  const _GaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height - 10;
    const radius = 95.0;
    const strokeW = 14.0;
    const startAngle = math.pi;
    const sweepTotal = math.pi;

    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeW
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFFEEEEF3);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      startAngle, sweepTotal, false, bgPaint,
    );

    // Segment: green (active) — left third
    _drawSegment(canvas, cx, cy, radius, strokeW,
      startAngle, sweepTotal * 0.33 * progress,
      const Color(0xFF10B981), const Color(0xFF34D399),
    );

    // Segment: amber (inactive) — middle third
    _drawSegment(canvas, cx, cy, radius, strokeW,
      startAngle + sweepTotal * 0.35, sweepTotal * 0.30 * progress,
      const Color(0xFFF59E0B), const Color(0xFFFBBF24),
    );

    // Segment: red (suspended) — right third
    _drawSegment(canvas, cx, cy, radius, strokeW,
      startAngle + sweepTotal * 0.68, sweepTotal * 0.32 * progress,
      const Color(0xFFEF4444), const Color(0xFFF87171),
    );

    // Center dot
    final dotPaint = Paint()..color = const Color(0xFF10B981);
    canvas.drawCircle(Offset(cx, cy), 6, dotPaint);
    final dotInner = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(cx, cy), 3, dotInner);

    // Labels
    _drawLabel(canvas, cx, cy, radius + 22, startAngle + sweepTotal * 0.12, 'Active',   const Color(0xFF10B981), 10);
    _drawLabel(canvas, cx, cy, radius + 22, startAngle + sweepTotal * 0.50, 'Inactive', const Color(0xFFF59E0B), 10);
    _drawLabel(canvas, cx, cy, radius + 24, startAngle + sweepTotal * 0.83, 'Suspended',const Color(0xFFEF4444), 9);
  }

  void _drawSegment(Canvas canvas, double cx, double cy, double radius,
      double strokeW, double start, double sweep, Color c1, Color c2) {
    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: radius);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeW
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        colors: [c1, c2],
        startAngle: start,
        endAngle: start + sweep,
      ).createShader(rect);
    canvas.drawArc(rect, start, sweep, false, paint);
  }

  void _drawLabel(Canvas canvas, double cx, double cy, double r,
      double angle, String text, Color color, double fontSize) {
    final x = cx + r * math.cos(angle);
    final y = cy + r * math.sin(angle);
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
  }

  @override
  bool shouldRepaint(_GaugePainter old) => old.progress != progress;
}
