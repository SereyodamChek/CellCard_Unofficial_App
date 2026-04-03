import 'package:cellcard_app/my-plan_page.dart/CustomCard-2.dart';
import 'package:flutter/material.dart';

// ✅ Renamed from 'data' to proper PascalCase + descriptive name
class DataTopUpPage extends StatelessWidget {
  const DataTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Keep your color palette
    final accentColor = Colors.pink[800]!;
    final backgroundColor = Colors.grey[200]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      // ✅ Add proper app bar for accessibility & navigation consistency
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_circle_left,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Hero Image Section (kept your image style)
            _buildHeroImage(),
            
            // ✅ Page Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Description
                  _buildHeaderSection(),
                  
                  const SizedBox(height: 16),
                  
                  // Your CustomCard_2 (with missing 'text' param added)
                  const CustomCard_2(
                    avatarImagePath: 'images/z21.png',
                    title: 'Data+',
                    price: '\$0.25',
                    data: '1GB',
                    validity: '1 Days',
                    text: 'Flexible top-up for any device. Works with tablets, routers & phones.',
                    autoRenewText: 'Auto-renew every day',
                    autoRenewImagePath: 'images/s8.png',
                  ),
                  
                  // ✅ Optional: Add helpful info section
                  _buildInfoSection(accentColor),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Sections (kept your image approach + improved structure)
  // ─────────────────────────────────────────────────────────────

  Widget _buildHeroImage() {
    return Stack(
      children: [
        // Your original image - kept styling intact
        Image.asset(
          'images/q6.png',
          width: double.infinity,
          height: 140, // Slightly taller for better presence
          fit: BoxFit.cover,
        ),
        // Gradient overlay for text readability (optional enhancement)
        Container(
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'Add Extra Data',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Add data on top of any plan whenever you need to. Also great for your tablets and routers!',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            height: 1.5, // Better line height for readability
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(Color accent) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: accent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Data top-ups activate instantly and work alongside your current plan.',
              style: TextStyle(
                fontSize: 12,
                color: accent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
