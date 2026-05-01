import 'package:flutter/material.dart';
import 'package:assignment/widgets/glass_container.dart';
import 'package:assignment/screens/settings_screen.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool emailEnabled = true;
  bool pushEnabled = true;
  bool emailNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    // Increased Header height to prevent overflow on smaller screens
    const double headerHeight = 520;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. SCROLLABLE CONTENT (Layered UNDER the fixed header)
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer so content starts below the fixed header
                const SizedBox(height: headerHeight + 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection('What to Test', 'For Testing'),
                      _buildSection(
                        'App Description',
                        'Test App Functionality',
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'App Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInfoRow('Developer', 'Pro Health'),
                      _buildInfoRow('Release Date', '24 November 2025'),
                      _buildInfoRow('Version', '1.0.0 (20)'),
                      _buildInfoRow('Size', '112 MB'),
                      _buildInfoRow('Expires', '22 Feb 2026 at 11:11 AM'),
                      _buildInfoRow('Compatibility', 'Works on this iPhone'),
                      _buildInfoRow('Apple Watch', 'No'),
                      _buildInfoRow('iMessage', 'No'),
                      _buildToggleRow(
                        'Email',
                        emailEnabled,
                        (v) => setState(() => emailEnabled = v),
                      ),
                      _buildInfoRow('Automatic Updates', '24 November 2025'),
                      _buildClickableRow(
                        context,
                        'Previous Builds',
                        '1.0.0 (20)',
                      ),
                      _buildToggleRow(
                        'Push Notifications',
                        pushEnabled,
                        (v) => setState(() => pushEnabled = v),
                      ),
                      _buildToggleRow(
                        'Email Notifications',
                        emailNotificationsEnabled,
                        (v) => setState(() => emailNotificationsEnabled = v),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Stop Testing',
                            style: TextStyle(
                              color: Color(0xFFFF3B30),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. FIXED UPPER SECTION (Hero Area + Sticky Card)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
            child: Container(
              // Background gradient
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF53A35B), Color(0xFF34C759), Colors.black],
                  stops: [0.0, 0.86, 0.86],
                ),
              ),
              child: Stack(
                children: [
                  // Green dots on the left
                  Positioned(
                    top: 100,
                    left: -20,
                    child: Opacity(
                      opacity: 0.9,
                      child: Image.asset('assets/greendot.png', width: 150),
                    ),
                  ),

                  Positioned(
                    top: 180,
                    right: -60,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset('assets/bluedot.png', width: 200),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        _buildNavBar(context),
                        const SizedBox(height: 10),
                        Center(
                          child: Image.asset(
                            'assets/safara_large.png',
                            width: 140, // Slightly reduced logo size
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Safara',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildButton(
                                  'Open',
                                  Colors.white.withOpacity(0.2),
                                  Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildButton(
                                  'Send Feedback',
                                  Colors.white.withOpacity(0.2),
                                  Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 48),
                        // const Spacer(),
                        // THE STICKY CARD
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F0F12),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical:
                                    20.0, // Reduced padding to prevent overflow
                                horizontal: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildInfoCell(
                                    'DEVELOPER',
                                    'Pro Health',
                                    icon: Icons.person,
                                  ),
                                  _buildInfoCell(
                                    'VERSION',
                                    '1.0.0',
                                    subValue: 'Build 20',
                                  ),
                                  _buildInfoCell(
                                    'EXPIRES',
                                    '89',
                                    subValue: 'Days',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleButton(Icons.chevron_left, () => Navigator.pop(context)),
          _buildCircleButton(Icons.ios_share, () => _showShareSheet(context)),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // Ensures the entire area is tappable
      child: Container(
        width: 44, // Increased hit area
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 22, color: Colors.white),
      ),
    );
  }

  Widget _buildButton(String label, Color bgColor, Color textColor) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCell(
    String label,
    String value, {
    IconData? icon,
    String? subValue,
  }) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 4),
        if (icon != null) Icon(icon, size: 24, color: Colors.white),
        if (icon != null) const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: subValue != null ? 24 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (subValue != null)
          Text(
            subValue,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          Text(value, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF34C759),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableRow(BuildContext context, String label, String value) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showShareSheet(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), () {
      Share.share('Hello! This is a test message from Safara App.');
    });
  }
}
