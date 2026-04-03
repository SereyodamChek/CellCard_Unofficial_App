import 'package:flutter/material.dart';

class CustomCard_3 extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String price;
  final String data;
  final String validity;
  final String description;
  final String autoRenewText;
  final String autoRenewImagePath;
  final VoidCallback? onSendGift;
  final VoidCallback? onSubscribe;
  final Color? primaryColor;
  final Color? accentColor;

  const CustomCard_3({
    super.key,
    required this.avatarImagePath,
    required this.title,
    required this.price,
    required this.data,
    required this.validity,
    required this.description,
    required this.autoRenewText,
    required this.autoRenewImagePath,
    this.onSendGift,
    this.onSubscribe,
    this.primaryColor,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final primary = primaryColor ?? Colors.blue;
    final accent = accentColor ?? const Color(0xFFC2185B); // pink-800

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
            children: [
              // Header: Avatar + Title + Price
              _buildHeader(accent),
              
              const SizedBox(height: 12),
              
              // Divider
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              
              const SizedBox(height: 12),
              
              // Info Grid: Data & Validity
              _buildInfoRow('Data', data),
              const SizedBox(height: 8),
              _buildInfoRow('Valid for', validity),
              
              const SizedBox(height: 12),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              const SizedBox(height: 12),
              
              // Description Text
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
              
              const SizedBox(height: 12),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              const SizedBox(height: 12),
              
              // Auto-renew Badge
              _buildAutoRenewBadge(accent),
              
              const SizedBox(height: 16),
              
              // Action Buttons
              _buildActionButtons(primary, accent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Color accent) {
    return Row(
      children: [
        // Avatar with subtle border
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
                errorBuilder: (_, __, ___) => Icon(Icons.inventory_2_rounded, 
                  size: 20, color: Colors.grey.shade400),
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: accent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            price,
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.w600,
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

  Widget _buildAutoRenewBadge(Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
          Text(
            autoRenewText,
            style: TextStyle(
              color: accent,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(Color primary, Color accent) {
    return Row(
      children: [
        // Send Gift - Outlined Button
        Expanded(
          flex: 2,
          child: _OutlinedButton(
            text: 'Send Gift',
            color: primary,
            onPressed: onSendGift,
          ),
        ),
        const SizedBox(width: 12),
        
        // Subscribe - Filled Button
        Expanded(
          flex: 3,
          child: _FilledButton(
            text: 'Subscribe',
            color: primary,
            onPressed: onSubscribe,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Reusable Button Components (Extracted for clarity & reuse)
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
        ),
      ),
    );
  }
}

class _FilledButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  const _FilledButton({
    required this.text,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
