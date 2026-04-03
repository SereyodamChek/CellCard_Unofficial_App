// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _CC {
  static const orange      = Color(0xFFE8500A);
  static const orangeLight = Color(0xFFFF6B2B);
  static const bg          = Color(0xFFF7F7F9);
  static const surface     = Colors.white;
  static const textPrimary = Color(0xFF1A1A2E);
  static const textMuted   = Color(0xFF8A8A99);
  static const border      = Color(0xFFEEEEF3);
}

class CategoryList extends StatefulWidget {
  final List<String> categories;
  final int initialIndex;
  final ValueChanged<int>? onSelected;

  const CategoryList({
    super.key,
    required this.categories,
    this.initialIndex = 0,
    this.onSelected,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final isActive = _selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 8,
            ),
            child: CategoryButton(
              text: widget.categories[index],
              isActive: isActive,
              onTap: () {
                setState(() => _selectedIndex = index);
                widget.onSelected?.call(index);
              },
            ),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback? onTap;

  const CategoryButton({
    super.key,
    required this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
          gradient: isActive
              ? const LinearGradient(
                  colors: [_CC.orange, _CC.orangeLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isActive ? null : _CC.surface,
          borderRadius: BorderRadius.circular(50),
          border: isActive
              ? null
              : Border.all(color: _CC.border, width: 1),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: _CC.orange.withOpacity(0.28),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 240),
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive ? Colors.white : _CC.textMuted,
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
