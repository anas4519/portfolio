import 'package:awesome_portfolio/consts/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    // Updated achievements data
    final List<Achievement> achievements = [
      Achievement(
        title: "HackHazards 2025 Runner-up",
        description:
            "Runner-up in the ScreenPipe Track out of 40+ projects at HackHazards 2025.",
        date: "2025",
        icon: Icons.emoji_events_rounded,
        color: Colors.amber,
        category: "Competition",
      ),
      Achievement(
        title: "HackHazards 2025 Top 100",
        description:
            "Ranked among top 100 out of 2,900+ teams and 5700+ solo hackers at HackHazards 2025.",
        date: "2025",
        icon: Icons.emoji_events_rounded,
        color: Colors.indigo,
        category: "Competition",
      ),
      Achievement(
        title: "Codeforces Pupil",
        description: "Pupil on Codeforces, with a maximum rating of 1237.",
        date: "2025",
        icon: Icons.code_rounded,
        color: Colors.green,
        category: "Competitive Programming",
      ),
      Achievement(
        title: "LeetCode Biweekly Contest 145",
        description:
            "Secured 2645 rank in LeetCode Biweekly Contest 145, with a rating of 1656.",
        date: "2025",
        icon: Icons.leaderboard_rounded,
        color: Colors.blue,
        category: "Competitive Programming",
      ),
      Achievement(
        title: "NS-Hacks 2025 Winner",
        description:
            "Winner of NS-Hacks, 2025 : Developed Invoice Genie, an AI-powered invoice management solution.",
        date: "2025",
        icon: Icons.workspace_premium_rounded,
        color: Colors.pink,
        category: "Competition",
      ),
    ];

    // Group achievements by category
    final Map<String, List<Achievement>> groupedAchievements = {};
    for (var achievement in achievements) {
      groupedAchievements.putIfAbsent(achievement.category, () => []);
      groupedAchievements[achievement.category]!.add(achievement);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple.shade900.withOpacity(0.3),
                      Colors.blue.shade900.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.star_rounded,
                        size: 50,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    )
                        .animate()
                        .scale(duration: const Duration(milliseconds: 600))
                        .fadeIn(),
                    const SizedBox(height: 15),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Colors.purple.shade300,
                          Colors.blue.shade300,
                        ],
                      ).createShader(bounds),
                      child: Text(
                        "Achievements",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                        .animate()
                        .slideY(
                            begin: 0.3,
                            duration: const Duration(milliseconds: 500))
                        .fadeIn(),
                    const SizedBox(height: 10),
                    Text(
                      "Milestones & Recognition",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 300)),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              // All Achievements List
              _buildAllAchievementsList(achievements),

              const SizedBox(height: 30),

              // Achievements by Category
              ...groupedAchievements.entries.map((entry) {
                return _buildCategorySection(
                  category: entry.key,
                  achievements: entry.value,
                  index: groupedAchievements.keys.toList().indexOf(entry.key),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllAchievementsList(List<Achievement> achievements) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.shade400,
                      Colors.blue.shade400,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Recent Achievements",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...achievements.asMap().entries.map((entry) {
            final index = entry.key;
            final achievement = entry.value;
            return _buildAchievementItem(achievement, index);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(Achievement achievement, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            achievement.color.withOpacity(0.1),
            achievement.color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: achievement.color.withOpacity(0.3),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final url = index == 0
                ? "https://certificate.givemycertificate.com/c/600d2816-9b9b-4a8f-bfd5-f22d71455038"
                : index == 1
                    ? "https://certificate.givemycertificate.com/c/f573fc66-65a8-4a62-9ef3-a2746dfe7035"
                    : index == 2
                        ? cf
                        : index == 3
                            ? lc
                            : "https://drive.google.com/file/d/1UnFkTEDb-X7fNr0R-M27r_0CaHlVWJ82/view";

            launchUrl(Uri.parse(url));
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: achievement.color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    achievement.icon,
                    color: achievement.color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              achievement.title,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: achievement.color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              achievement.date,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        achievement.description,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .slideX(
          begin: 0.1,
          duration: const Duration(milliseconds: 400),
          delay: Duration(milliseconds: 100 + (index * 50)),
        )
        .fadeIn();
  }

  Widget _buildCategorySection({
    required String category,
    required List<Achievement> achievements,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 10),
          ...achievements.map((achievement) {
            return _buildCompactAchievementItem(achievement);
          }).toList(),
        ],
      ),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: 400 + (index * 100)),
        );
  }

  Widget _buildCompactAchievementItem(Achievement achievement) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(
            achievement.icon,
            color: achievement.color,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              achievement.title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
          Text(
            achievement.date,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

// Achievement Model
class Achievement {
  final String title;
  final String description;
  final String date;
  final IconData icon;
  final Color color;
  final String category;

  Achievement({
    required this.title,
    required this.description,
    required this.date,
    required this.icon,
    required this.color,
    required this.category,
  });
}
