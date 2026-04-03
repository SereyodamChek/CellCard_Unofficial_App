import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // ✅ App state management
  String _appearance = 'Light';
  String _selectedIconPack = 'Default Logo';
  String _language = 'English';

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

    // ✅ Icon pack data organized for scalability
    final iconPacks = _IconPackData.all;

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
          'Settings',
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        actions: [
          // Reset to defaults action
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _showResetConfirmation(context, haptic),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.refresh_rounded,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              
              // ✅ Section: General Settings
              _buildSectionHeader('General', primaryOrange),
              const SizedBox(height: 12),
              _buildSettingsCard([
                _buildSettingItem(
                  context,
                  icon: 'images/p1.jpeg',
                  fallbackIcon: Icons.language_rounded,
                  title: 'Change Language',
                  subtitle: _language,
                  onTap: () => _showLanguageSelector(context, haptic),
                  primaryColor: primaryOrange,
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: 'images/z36.png',
                  fallbackIcon: Icons.lock_rounded,
                  title: 'Change Password/Login', // ✅ Fixed typo
                  subtitle: 'Update your security credentials',
                  onTap: () => _showPasswordChange(context, haptic),
                  primaryColor: primaryOrange,
                ),
              ]),
              
              const SizedBox(height: 24),
              
              // ✅ Section: Appearance
              _buildSectionHeader('Appearance', primaryOrange),
              const SizedBox(height: 12),
              _buildAppearanceCard(primaryOrange, accentBlue, haptic),
              
              const SizedBox(height: 24),
              
              // ✅ Section: Icon Pack (Premium Horizontal Selector)
              _buildSectionHeader('Icon Pack', primaryOrange),
              const SizedBox(height: 12),
              _buildIconPackSelector(iconPacks, primaryOrange, haptic),
              
              const SizedBox(height: 32),
              
              // ✅ Section: Advanced Settings
              _buildSectionHeader('Advanced', primaryOrange),
              const SizedBox(height: 12),
              _buildSettingsCard([
                _buildSettingItem(
                  context,
                  icon: 'images/z38.png',
                  fallbackIcon: Icons.notifications_rounded,
                  title: 'Notifications',
                  subtitle: 'Manage alerts & reminders',
                  onTap: () => _showNotificationSettings(context),
                  primaryColor: primaryOrange,
                  hasToggle: true,
                  toggleValue: true,
                  onToggle: (value) {
                    haptic();
                    // TODO: Save notification preference
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: 'images/p1.jpeg',
                  fallbackIcon: Icons.privacy_tip_rounded,
                  title: 'Privacy & Security',
                  subtitle: 'Control your data sharing',
                  onTap: () => _showPrivacySettings(context),
                  primaryColor: primaryOrange,
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: 'images/z36.png',
                  fallbackIcon: Icons.help_outline_rounded,
                  title: 'Help & Support',
                  subtitle: 'Get assistance or report issues',
                  onTap: () => Navigator.pushNamed(context, '/support'),
                  primaryColor: primaryOrange,
                ),
              ]),
              
              const SizedBox(height: 40),
              
              // ✅ App Version Footer
              _buildAppVersionFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Premium UI Components
  // ─────────────────────────────────────────────────────────────

  Widget _buildSectionHeader(String title, Color accent) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accent, Colors.orange[600]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
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
      child: Column(children: children),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required String icon,
    required IconData fallbackIcon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color primaryColor,
    bool hasToggle = false,
    bool toggleValue = false,
    Function(bool)? onToggle,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: hasToggle ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: primaryColor.withOpacity(0.1),
        highlightColor: primaryColor.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              // Icon container with your image assets
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (_, __, ___) => Icon(
                    fallbackIcon,
                    size: 20,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Toggle or Arrow
              if (hasToggle)
                Switch(
                  value: toggleValue,
                  onChanged: onToggle,
                  activeColor: primaryColor,
                  activeTrackColor: primaryColor.withOpacity(0.5),
                  inactiveThumbColor: Colors.grey[400],
                  inactiveTrackColor: Colors.grey[300],
                )
              else
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 13,
                    color: Colors.grey[500],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 52,
      endIndent: 16,
    );
  }

  Widget _buildAppearanceCard(Color primary, Color accent, VoidCallback haptic) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        children: [
          // Appearance options in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAppearanceOption(
                label: 'Light',
                isSelected: _appearance == 'Light',
                previewColor: Colors.white,
                borderColor: Colors.grey[300]!,
                onTap: () {
                  haptic();
                  setState(() => _appearance = 'Light');
                },
              ),
              _buildAppearanceOption(
                label: 'Dark',
                isSelected: _appearance == 'Dark',
                previewColor: Colors.grey[900] ?? const Color(0xFF212121),
                borderColor: Colors.grey[700]!,
                onTap: () {
                  haptic();
                  setState(() => _appearance = 'Dark');
                },
              ),
              _buildAppearanceOption(
                label: 'Auto',
                isSelected: _appearance == 'Auto',
                previewColor: Colors.grey[400] ?? const Color(0xFFBDBDBD),
                borderColor: primary,
                isGradient: true,
                onTap: () {
                  haptic();
                  setState(() => _appearance = 'Auto');
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            'Choose your preferred theme. Auto mode follows your system settings.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: Colors.grey[600],
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAppearanceOption({
    required String label,
    required bool isSelected,
    required Color previewColor,
    required Color borderColor,
    VoidCallback? onTap,
    bool isGradient = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Preview box
            Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                color: isGradient 
                    ? null 
                    : previewColor,
                gradient: isGradient
                    ? LinearGradient(
                        colors: [Colors.grey[300]!, Colors.grey[700]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? borderColor : Colors.grey[300]!,
                  width: isSelected ? 2.5 : 1.5,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: borderColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: borderColor,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 10),
            // Label with selection indicator
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: borderColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                Text(
                  label,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? borderColor : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconPackSelector(
    List<_IconPack> packs,
    Color primary,
    VoidCallback haptic,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
        children: [
          // Horizontal scrollable icon packs
          SizedBox(
            height: 110,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: packs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final pack = packs[index];
                final isSelected = _selectedIconPack == pack.name;
                
                return _IconPackCard(
                  pack: pack,
                  isSelected: isSelected,
                  onTap: () {
                    haptic();
                    setState(() => _selectedIconPack = pack.name);
                  },
                  primaryColor: primary,
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Selected pack indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Selected: $_selectedIconPack',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppVersionFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline_rounded, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                'App Version 2.4.1',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '© 2024 Cellcard • Clone by Sorn Lypheng',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Interactions & Dialogs
  // ─────────────────────────────────────────────────────────────

  void _showLanguageSelector(BuildContext context, VoidCallback haptic) {
    haptic();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _LanguageSelectorSheet(
        currentLanguage: _language,
        onSelect: (lang) {
          setState(() => _language = lang);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showPasswordChange(BuildContext context, VoidCallback haptic) {
    haptic();
    // TODO: Navigate to password change screen or show form
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password change flow opening...'),
        backgroundColor: Colors.orange[400],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showNotificationSettings(BuildContext context) {
    // TODO: Navigate to notification settings
  }

  void _showPrivacySettings(BuildContext context) {
    // TODO: Navigate to privacy settings
  }

  void _showResetConfirmation(BuildContext context, VoidCallback haptic) {
    haptic();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.refresh_rounded, color: Colors.orange[400]),
            const SizedBox(width: 8),
            Text(
              'Reset Settings',
              style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: Text(
          'Reset all settings to their default values? This action cannot be undone.',
          style: GoogleFonts.plusJakartaSans(color: Colors.grey[700], fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.plusJakartaSans(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Reset all settings
              setState(() {
                _appearance = 'Light';
                _selectedIconPack = 'Default Logo';
                _language = 'English';
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle_rounded, color: Colors.white),
                      const SizedBox(width: 8),
                      Text('Settings reset to defaults'),
                    ],
                  ),
                  backgroundColor: Colors.green[600],
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Reset',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Premium Icon Pack Card Component
// ─────────────────────────────────────────────────────────────

class _IconPackCard extends StatelessWidget {
  final _IconPack pack;
  final bool isSelected;
  final VoidCallback onTap;
  final Color primaryColor;

  const _IconPackCard({
    required this.pack,
    required this.isSelected,
    required this.onTap,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon preview with selection border
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? primaryColor : Colors.grey[300]!,
                  width: isSelected ? 2.5 : 1.5,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Your image asset
                    Image.asset(
                      pack.previewImage,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[200],
                        child: Icon(
                          pack.fallbackIcon,
                          size: 24,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    // Selection checkmark overlay
                    if (isSelected)
                      Container(
                        color: primaryColor.withOpacity(0.15),
                        child: const Center(
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: Colors.white,
                            size: 24,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Pack name with selection indicator
            Column(
              children: [
                Text(
                  pack.name,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? primaryColor : Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (pack.isNew) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'New',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.red[700],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Language Selector Bottom Sheet
// ─────────────────────────────────────────────────────────────

class _LanguageSelectorSheet extends StatelessWidget {
  final String currentLanguage;
  final Function(String) onSelect;

  const _LanguageSelectorSheet({
    required this.currentLanguage,
    required this.onSelect,
  });

  static const _languages = [
    'English',
    'Khmer',
    'Chinese',
    'Thai',
    'Vietnamese',
  ];

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
          
          // Header
          Text(
            'Select Language',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // Language list
          Expanded(
            child: ListView.separated(
              itemCount: _languages.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final lang = _languages[index];
                final isSelected = lang == currentLanguage;
                
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onSelect(lang),
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        children: [
                          // Selection indicator
                          isSelected
                              ? Icon(
                                  Icons.check_circle_rounded,
                                  color: primaryOrange,
                                  size: 20,
                                )
                              : Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey[400]!),
                                  ),
                                ),
                          const SizedBox(width: 14),
                          // Language name
                          Text(
                            lang,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: isSelected 
                                  ? FontWeight.w600 
                                  : FontWeight.w400,
                              color: isSelected 
                                  ? primaryOrange 
                                  : Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          // Native name hint
                          Text(
                            _getNativeName(lang),
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: OutlinedButton(
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
                'Cancel',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getNativeName(String language) {
    const names = {
      'English': 'English',
      'Khmer': 'ខ្មែរ',
      'Chinese': '中文',
      'Thai': 'ไทย',
      'Vietnamese': 'Tiếng Việt',
    };
    return names[language] ?? language;
  }
}

// ─────────────────────────────────────────────────────────────
// Icon Pack Data Model (Organized, Scalable, Type-Safe)
// ─────────────────────────────────────────────────────────────

class _IconPackData {
  // ✅ All icon packs in one place - easy to add/update
  static const List<_IconPack> all = [
    _IconPack(
      name: 'Default Logo',
      previewImage: 'images/p1.jpeg', // ✅ Your image asset
      fallbackIcon: Icons.app_registration_rounded,
      isNew: false,
    ),
    _IconPack(
      name: 'Chinese New Year',
      previewImage: 'images/q5.jpg', // ✅ Your image asset
      fallbackIcon: Icons.celebration_rounded,
      isNew: false,
    ),
    _IconPack(
      name: 'Khmer New Year',
      previewImage: 'images/p1.jpeg', // ✅ Your image asset
      fallbackIcon: Icons.celebration_rounded,
      isNew: false,
    ),
    _IconPack(
      name: 'Pchum Ben',
      previewImage: 'images/p1.jpeg', // ✅ Your image asset
      fallbackIcon: Icons.temple_buddhist_rounded,
      isNew: false,
    ),
    _IconPack(
      name: 'Water Festival',
      previewImage: 'images/p1.jpeg', // ✅ Your image asset
      fallbackIcon: Icons.water_rounded,
      isNew: false,
    ),
    _IconPack(
      name: 'Christmas',
      previewImage: 'images/z38.png', // ✅ Your image asset
      fallbackIcon: Icons.celebration_rounded,
      isNew: true, // ✅ "New" badge support
    ),
  ];
}

class _IconPack {
  final String name;
  final String previewImage; // ✅ Your image asset path
  final IconData fallbackIcon;
  final bool isNew;

  const _IconPack({
    required this.name,
    required this.previewImage,
    required this.fallbackIcon,
    required this.isNew,
  });
}