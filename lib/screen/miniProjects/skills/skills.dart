import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Icon(
                      Icons.code_rounded,
                      size: 50,
                      color: Colors.white.withOpacity(0.9),
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
                        "Technical Skills",
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
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Skills Section
              _buildSkillSection(
                title: "Skills & Technologies",
                icon: Icons.layers_rounded,
                items: skills,
                animationDelay: 0,
              ),

              const SizedBox(height: 30),

              // Languages Section
              _buildSkillSection(
                title: "Languages",
                icon: Icons.language_rounded,
                items: languages,
                animationDelay: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillSection({
    required String title,
    required IconData icon,
    required List<dynamic> items,
    required int animationDelay,
  }) {
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Colors.white.withOpacity(0.8),
                  size: 24,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          )
              .animate()
              .slideX(begin: -0.2, duration: const Duration(milliseconds: 500))
              .fadeIn(delay: Duration(milliseconds: animationDelay)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              items.length,
              (index) => _buildSkillChip(items[index], index, animationDelay),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: animationDelay),
        );
  }

  Widget _buildSkillChip(dynamic skill, int index, int sectionDelay) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            skill.colorS.withOpacity(0.2),
            skill.colorS.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: skill.colorS.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  skill.skillName,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .scale(
          begin: const Offset(0.8, 0.8),
          duration: const Duration(milliseconds: 400),
          delay: Duration(milliseconds: sectionDelay + (index * 50)),
        )
        .fadeIn();
  }
}
