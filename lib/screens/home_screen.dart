import 'package:flutter/material.dart';
import 'package:assignment/widgets/glass_container.dart';
import 'package:assignment/screens/detail_screen.dart';
import 'package:assignment/screens/settings_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00061E),
      body: Stack(
        children: [
          // Top left squiggle/dots
          Positioned(
            top: -100,
            left: -50,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/bluedot.png', width: 300),
            ),
          ),
          // Bottom right squiggle/dots
          Positioned(
            bottom: -100,
            right: -50,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/bluedot.png', width: 300),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Apps',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsScreen()),
                        ),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/pp.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for Apps',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Currently testing'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildAppItem(
                          context,
                          'Safara',
                          'Version 1.0.0 (20)',
                          'assets/safara.png',
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(),
                                ),
                              ),
                        ),
                        _buildAppItem(
                          context,
                          'New Community Bible',
                          'Version 1.0.0 (20)',
                          'assets/bible.png',
                        ),
                        _buildAppItem(
                          context,
                          'Clinician App',
                          'Version 1.0.0 (20)',
                          'assets/smtry.svg',
                          isSvg: true,
                          bgColor: Colors.white,
                          iconColor: Colors.blue,
                        ),
                        _buildAppItem(
                          context,
                          'Symmetry Get Well',
                          'Version 1.0.0 (20)',
                          'assets/smtry.svg',
                          isSvg: true,
                          bgColor: Colors.white,
                          iconColor: Colors.blue,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Previously Tested'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              '(1)',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
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

  Widget _buildAppItem(
    BuildContext context,
    String name,
    String version,
    String asset, {
    bool isSvg = false,
    Color? bgColor,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GlassContainer(
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          onTap: onTap,
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bgColor ?? Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  isSvg
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(asset, color: iconColor),
                      )
                      : Image.asset(asset, fit: BoxFit.cover),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            version,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        ),
      ),
    );
  }
}
