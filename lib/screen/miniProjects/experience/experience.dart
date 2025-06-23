import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';
import '../../../models/experience_model.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

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
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.work_history_rounded,
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
                        "Work Experience",
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
                      "My Professional Journey",
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

              // Timeline
              ...List.generate(jobExperiences.length, (index) {
                return _buildExperienceCard(
                  context,
                  jobExperiences[index],
                  index,
                  isLast: index == jobExperiences.length - 1,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(
      BuildContext context, JobExperience experience, int index,
      {required bool isLast}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: experience.color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              expansionTileTheme: ExpansionTileThemeData(
                iconColor: Colors.white.withOpacity(0.7),
                collapsedIconColor: Colors.white.withOpacity(0.7),
              ),
            ),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.all(20),
              childrenPadding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          experience.title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: experience.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: experience.color.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      experience.company,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 14,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${experience.startDate} - ${experience.endDate}',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      experience.location,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Key Responsibilities:",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...experience.bulletPoints.map((bulletPoint) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                margin: const EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  color: experience.color.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: experience.color.withOpacity(0.4),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  bulletPoint,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
            .animate()
            .slideX(
              begin: 0.2,
              duration: const Duration(milliseconds: 600),
              delay: Duration(milliseconds: index * 200),
            )
            .fadeIn(),
      ),
    );
  }
}
