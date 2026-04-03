import 'package:cellcard_app/discover/discover_screen.dart';
import 'package:cellcard_app/homescreen.dart';
import 'package:cellcard_app/more-screen/more_screen.dart';
import 'package:cellcard_app/usage_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class _CC {
  static const orange      = Color(0xFFE8500A);
  static const orangeLight = Color(0xFFFF6B2B);
  static const bg          = Color(0xFFF7F7F9);
  static const surface     = Colors.white;
  static const textPrimary = Color(0xFF1A1A2E);
  static const textMuted   = Color(0xFF8A8A99);
}

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> with TickerProviderStateMixin {
  int _currentIndex = 0;

  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _scaleAnims;

  static const _tabs = [
    _TabItem(label: 'Home',     icon: Iconsax.home_2),
    _TabItem(label: 'Discover', icon: Iconsax.layer),
    _TabItem(label: 'Usage',    icon: Iconsax.chart_2),
    _TabItem(label: 'More',     icon: Iconsax.more),
  ];

  final List<Widget> _screens = const [
    Homescreen(),
    DiscoverPage(),
    usage(),
    MorePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      _tabs.length,
      (_) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 220),
      ),
    );
    _scaleAnims = _controllers.map((c) =>
      Tween<double>(begin: 1.0, end: 1.15).animate(
        CurvedAnimation(parent: c, curve: Curves.easeOutBack),
      ),
    ).toList();
    _controllers[0].forward();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;
    _controllers[_currentIndex].reverse();
    _controllers[index].forward();
    setState(() => _currentIndex = index);
    _showSnackbar(index);
  }

  void _showSnackbar(int index) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        padding: EdgeInsets.zero,
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: const Duration(milliseconds: 1800),
        content: _SnackbarContent(
          icon: _tabs[index].icon,
          label: _tabs[index].label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _CC.bg,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  Widget _buildNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: _CC.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_tabs.length, _buildNavItem),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _scaleAnims[index],
        builder: (_, __) => Transform.scale(
          scale: _scaleAnims[index].value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(
              horizontal: isActive ? 20 : 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              gradient: isActive
                  ? const LinearGradient(
                      colors: [Color.fromARGB(255, 255, 165, 30), _CC.orangeLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _tabs[index].icon,
                  size: 20,
                  color: isActive ? Colors.white : _CC.textMuted,
                ),
                if (isActive) ...[
                  const SizedBox(width: 7),
                  Text(
                    _tabs[index].label,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Tab Item Model ───────────────────────────────────────────
class _TabItem {
  final String label;
  final IconData icon;
  const _TabItem({required this.label, required this.icon});
}

// ─── Animated Snackbar ────────────────────────────────────────
class _SnackbarContent extends StatefulWidget {
  final IconData icon;
  final String label;
  const _SnackbarContent({required this.icon, required this.label});

  @override
  State<_SnackbarContent> createState() => _SnackbarContentState();
}

class _SnackbarContentState extends State<_SnackbarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    )..forward();
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => Opacity(
        opacity: _anim.value,
        child: Transform.translate(
          offset: Offset(0, 14 * (1 - _anim.value)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            decoration: BoxDecoration(
              color: _CC.textPrimary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [_CC.orange, _CC.orangeLight],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(widget.icon, size: 16, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Text(
                  'Navigating to ${widget.label}',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: _CC.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
