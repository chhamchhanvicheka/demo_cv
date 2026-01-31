import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = GoogleFonts.interTextTheme(
      isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chham Chhanvicheka - Professional CV',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      // Light Theme
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E293B), // Slate 800
          primary: const Color(0xFF0F172A), // Slate 900
          secondary: const Color(0xFFD97706), // Amber 600
          surface: Colors.white,
        ),
        textTheme: textTheme,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A),
          brightness: Brightness.dark,
          primary: const Color(0xFF38BDF8), // Sky 400
          secondary: const Color(0xFFFBBF24), // Amber 400
          surface: const Color(0xFF1E293B), // Slate 800
        ),
        textTheme: textTheme,
        scaffoldBackgroundColor: const Color(0xFF020617),
      ),

      home: CVHome(isDark: isDark, onToggleTheme: toggleTheme),
    );
  }
}

class CVHome extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const CVHome({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // === HEADER SECTION ===
            _buildHeader(context, isDesktop),

            // === CONTENT CONTAINER ===
            Container(
              constraints: const BoxConstraints(maxWidth: 900),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CONTACT 
                  _buildSectionTitle(
                      context, "Contact Information", FontAwesomeIcons.addressCard),
                  const SizedBox(height: 16),
                  _buildContactInfoItem(context, FontAwesomeIcons.envelope,
                      "Email", "ka703501@gmail.com", "mailto:ka703501@gmail.com"),
                  const SizedBox(height: 12),
                  _buildContactInfoItem(context, FontAwesomeIcons.phone,
                      "Phone", "+855 963 880 440", "tel:+855963880440"),
                  const SizedBox(height: 12),
                  _buildContactInfoItem(context, FontAwesomeIcons.locationDot,
                      "Address", "Phnom Penh", null),
                  const SizedBox(height: 12),
                  _buildContactInfoItem(context, FontAwesomeIcons.telegram,
                      "Telegram", "@Vichekaaaaaaa", "https://t.me/Vichekaaaaaaa"),

                  const SizedBox(height: 40),

                  // ABOUT SECTION
                  _buildSectionTitle(
                      context, "About Me", FontAwesomeIcons.user),
                  const SizedBox(height: 16),
                  Text(
                    "My name is CHHAM CHHANVICHEKA. I am a fourth-year student of Telecommunication and Network Engineering at the Institute of Technology of Cambodia."
                    "I have to learned at ITC for about four years, and I have gained knowlodge about network protocols, wireless communication, and hardware & software enginneering. " 
                    "I have also completed an internship at the IT office of UCB Building, where I assisted in maintaining IT systems and supporting daily operations."
                    "At present, I am looking for opportunities to apply my skills and knowledge in real-world projects, particularly in network engineering and software development."
                    "In addition to my technical skills, I am a proactive learner and a team player, always eager to take on new challenges and contribute to the success of any organization I am part of."
                    "I am excited about the prospect of furthering my career in the field of telecommunication and network engineering, and I am committed to continuous learning and professional growth.",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // SKILLS SECTION
                  _buildSectionTitle(
                      context, "Technical Skills", FontAwesomeIcons.code),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 13,
                    runSpacing: 13,
                    children: [
                      _buildSkillChip(context, "Flutter / Dart", true),
                      _buildSkillChip(context, "C / C++", true),
                      _buildSkillChip(context, "Python", true),
                      _buildSkillChip(context, "Java (OOP)", true),
                      _buildSkillChip(context, "Networking", true),
                      _buildSkillChip(context, "MATLAB", true),
                      _buildSkillChip(context, "Microcontroller Based System", true),
                      _buildSkillChip(context, "Introduction Computer & Network", true),
                      _buildSkillChip(context, "Good knowledge of Microsoft Office", true),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // EXPERIENCE SECTION
                  _buildSectionTitle(
                      context, "Experience", FontAwesomeIcons.briefcase),
                  const SizedBox(height: 24),
                  _buildExperienceItem(
                    context,
                    year: "Aug 2025 - Oct 2025",
                    role: "IT Intern",
                    company: "IT Office, UCB Building",
                    description:
                        "Assisted in maintaining network infrastructure, troubleshooting hardware issues, and supporting daily IT operations for the building management system.",
                  ),

                  const SizedBox(height: 40),

                  // EDUCATION SECTION
                  _buildSectionTitle(
                      context, "Education", FontAwesomeIcons.graduationCap),
                  const SizedBox(height: 24),
                  _buildExperienceItem(
                    context,
                    year: "2020 - Present",
                    role: "Telecommunication and Network Engineering",
                    company: "Institute of Technology of Cambodia (ITC)",
                    description:
                        "Focusing on Network Protocols, Wireless Communication, and Software Engineering.",
                  ),
                  const SizedBox(height: 24),
                  _buildExperienceItem(
                    context,
                    year: "2020 - 2022",
                    role: "High School ",
                    company: "Sovannaphum High School",
                    description:
                        "Completed high school education.",
                  ),

                  const SizedBox(height: 40),

                  // ADDITIONAL INFO
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle(context, "Languages",
                                FontAwesomeIcons.language),
                            const SizedBox(height: 16),
                            _buildInfoRow(
                                context, "Khmer", "Native Proficiency"),
                            _buildInfoRow(context, "English", "Intermediate"),
                            _buildInfoRow(context, "French", "Basic Knowledge"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle(
                                context, "Hobbies", FontAwesomeIcons.heart),
                            const SizedBox(height: 16),
                            _buildInfoRow(
                                context, "Tech", "Coding & Open Source"),
                            _buildInfoRow(context, "Sports", "Football"),
                            _buildInfoRow(
                                context, "Leisure", "Reading & Travel"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),
                  Center(
                    child: Text(
                      "© 2026 Chham Chhanvicheka",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onToggleTheme,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        elevation: 4,
        child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDesktop) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.primary, // Fallback
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isDark ? const Color(0xFF0F172A) : const Color(0xFF1E293B),
            isDark ? const Color(0xFF1E293B) : const Color(0xFF334155),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.only(
          top: isDesktop ? 80 : 60, bottom: 60, left: 24, right: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Avatar with Glow
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.secondary.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: Image.asset(
                    'assets/vicheka.png',
                    filterQuality: FilterQuality.high,
                  ).image,
                ),
              ),
              const SizedBox(height: 24),

              // Name & Title
              Text(
                "Chham Chhanvicheka",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 36 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Fourth Year Telecommunication and Network Engineering ",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoItem(
      BuildContext context, IconData icon, String label, String value, String? url) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return InkWell(
      onTap: url != null
          ? () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            }
          : null,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: FaIcon(
                icon,
                color: colorScheme.secondary,
                size: 18,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            if (url != null)
              Icon(
                Icons.open_in_new,
                color: colorScheme.onSurface.withOpacity(0.4),
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, color: colorScheme.secondary, size: 24),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String label, bool isPrimary) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isPrimary ? colorScheme.primary : colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isPrimary
              ? Colors.transparent
              : colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.white : colorScheme.onSurface,
          fontWeight: isPrimary ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String year,
    required String role,
    required String company,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Simple Timeline Line
        Container(
          margin: const EdgeInsets.only(top: 4, right: 16),
          child: Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 80, // Approximate height
                color: colorScheme.outline.withOpacity(0.2),
              ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                year,
                style: TextStyle(
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                role,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                company,
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
