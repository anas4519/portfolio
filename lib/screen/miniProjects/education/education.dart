import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';
import '../../../models/experience_model.dart';

class Education extends StatelessWidget {
  const Education({super.key});

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
                        Icons.school_rounded,
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
                        "Education",
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
                      "Academic Journey & Achievements",
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

              // Education Timeline
              ...List.generate(education.length, (index) {
                return _buildEducationCard(
                  context,
                  education[index],
                  index,
                  isLast: index == education.length - 1,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationCard(
      BuildContext context, JobExperience education, int index,
      {required bool isLast}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      education.color.withOpacity(0.8),
                      education.color.withOpacity(0.5),
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: education.color.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    isLast ? Icons.school_outlined : Icons.account_balance,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ).animate().scale(
                    duration: const Duration(milliseconds: 500),
                    delay: Duration(milliseconds: index * 200),
                  ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        education.color.withOpacity(0.5),
                        education.color.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 20),

          // Education content
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.03),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: education.color.withOpacity(0.3),
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
                              education.title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 10,
                          //     vertical: 4,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     color: education.color.withOpacity(0.2),
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: Text(
                          //     'sjkdbsjhkbfjhkdbv',
                          //     style: GoogleFonts.poppins(
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w500,
                          //       color: Colors.white.withOpacity(0.9),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        education.company,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: education.color,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              size: 14,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${education.startDate} - ${education.endDate}',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              education.location,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
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
                          if (education.bulletPoints.isNotEmpty) ...[
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 18,
                                  color: education.color.withOpacity(0.8),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Highlights & Achievements",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            ...education.bulletPoints.map((bulletPoint) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Icon(
                                        Icons.check_circle_rounded,
                                        size: 16,
                                        color: education.color.withOpacity(0.8),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
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
                          // GPA or Grade Section (if applicable)
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
        ],
      ),
    );
  }
}
