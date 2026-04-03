import 'package:flutter/material.dart';

class CustomCard_4 extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String price;
  final String data;
  final String validity;
  final String image;
  final String autoRenewText;
  final String autoRenewImagePath;
  final VoidCallback? onDetails;
  final VoidCallback? onSubscribe;
  final Color? primaryColor;
  final Color? accentColor;
  final double? imageAspectRatio; // Customizable image ratio (default: 16:9)

  const CustomCard_4({
    super.key,
    required this.avatarImagePath,
    required this.title,
    required this.price,
    required this.data,
    required this.validity,
    required this.image,
    required this.autoRenewText,
    required this.autoRenewImagePath,
    this.onDetails,
    this.onSubscribe,
    this.primaryColor,
    this.accentColor,
    this.imageAspectRatio = 16 / 9,
  });

  @override
  Widget build(BuildContext context) {
    final primary = primaryColor ?? Colors.blue;
    final accent = accentColor ?? const Color(0xFFC2185B);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header: Avatar + Title + Price
              _buildHeader(accent),
              
              const SizedBox(height: 12),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              const SizedBox(height: 12),
              
              // Info Rows: Data & Validity
              _buildInfoRow('Data', data),
              const SizedBox(height: 6),
              _buildInfoRow('Valid for', validity),
              
              const SizedBox(height: 16),
              
              // Featured Image Section
              _buildFeaturedImage(),
              
              const SizedBox(height: 16),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              const SizedBox(height: 12),
              
              // Auto-renew Badge
              _buildAutoRenewBadge(accent),
              
              const SizedBox(height: 16),
              
              // Action Buttons
              _buildActionButtons(primary),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Building Blocks
  // ─────────────────────────────────────────────────────────────

  Widget _buildHeader(Color accent) {
    return Row(
      children: [
        // Avatar with accent border
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: accent.withOpacity(0.3), width: 1.5),
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade100,
            child: ClipOval(
              child: Image.asset(
                avatarImagePath,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.inventory_2_rounded,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Title
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
        // Price Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: accent.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            price,
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedImage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: imageAspectRatio!,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey.shade200,
              child: Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 32,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAutoRenewBadge(Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: accent.withOpacity(0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              autoRenewImagePath,
              width: 14,
              height: 14,
              color: accent,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              autoRenewText,
              style: TextStyle(
                color: accent,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(Color primary) {
    return Row(
      children: [
        // Details - Outlined Button
        Expanded(
          flex: 2,
          child: _OutlinedButton(
            text: 'Details',
            color: primary,
            onPressed: onDetails,
          ),
        ),
        const SizedBox(width: 12),
        
        // Subscribe - Filled Button (Primary Action)
        Expanded(
          flex: 3,
          child: _FilledButton(
            text: 'Subscribe',
            color: primary,
            onPressed: onSubscribe,
            isPrimary: true,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Reusable Button Components
// ─────────────────────────────────────────────────────────────

class _OutlinedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  const _OutlinedButton({
    required this.text,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _FilledButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const _FilledButton({
    required this.text,
    required this.color,
    this.onPressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? color : Colors.transparent,
          foregroundColor: isPrimary ? Colors.white : color,
          elevation: isPrimary ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shadowColor: color.withOpacity(0.3),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
