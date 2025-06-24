import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectBuilder extends StatefulWidget {
  final List<String> screenshots;
  final String bgImage;
  final String name;
  final String tagLine;
  final String psLink;
  final String ghLink;
  final String details;
  final List<Map<String, dynamic>> techStack;
  final List<Map<String, dynamic>> features;

  const ProjectBuilder({
    super.key,
    required this.screenshots,
    required this.bgImage,
    required this.name,
    required this.tagLine,
    required this.psLink,
    required this.ghLink,
    required this.details,
    required this.techStack,
    required this.features,
  });

  @override
  State<ProjectBuilder> createState() => _ProjectBuilderState();
}

class _ProjectBuilderState extends State<ProjectBuilder> {
  int selectedScreenshot = 0;

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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.5),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage(widget.bgImage),
                        ),
                      ),
                    )
                        .animate()
                        .scale(duration: const Duration(milliseconds: 600))
                        .fadeIn(),

                    const SizedBox(height: 20),

                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Colors.purple.shade300,
                          Colors.blue.shade300,
                        ],
                      ).createShader(bounds),
                      child: Text(
                        widget.name,
                        style: GoogleFonts.poppins(
                          fontSize: 32,
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

                    Center(
                      child: Text(
                        widget.tagLine,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate()
                          .fadeIn(delay: const Duration(milliseconds: 300)),
                    ),

                    const SizedBox(height: 25),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildActionButton(
                          icon: Icons.play_arrow_rounded,
                          label: "Play Store",
                          color: Colors.green,
                          onTap: () async {
                            final url = widget.psLink;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        const SizedBox(width: 15),
                        _buildActionButton(
                          icon: Icons.code_rounded,
                          label: "GitHub",
                          color: Colors.orange,
                          onTap: () async {
                            final url = widget.ghLink;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 400)),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Tech Stack Section
              _buildTechStackSection(),

              const SizedBox(height: 30),

              // Description Section
              Container(
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
                          "About ${widget.name}",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      widget.details,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade300,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: const Duration(milliseconds: 600)),

              const SizedBox(height: 30),

              // Features Section
              _buildFeaturesSection(),

              const SizedBox(height: 30),

              // Screenshots Section
              _buildScreenshotsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.2),
            color.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: color.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
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
    );
  }

  Widget _buildTechStackSection() {
    final techStack = widget.techStack;

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
                "Tech Stack",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: techStack.map((tech) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: (tech['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: (tech['color'] as Color).withOpacity(0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      tech['icon'] as IconData,
                      size: 20,
                      color: tech['color'] as Color,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tech['name'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ).animate().fadeIn(
        duration: const Duration(milliseconds: 600),
        delay: const Duration(milliseconds: 200));
  }

  Widget _buildFeaturesSection() {
    final features = widget.features;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust columns based on width
        int crossAxisCount = 2;
        double width = constraints.maxWidth;
        if (width > 900) {
          crossAxisCount = 4;
        } else if (width > 600) {
          crossAxisCount = 3;
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple.shade900.withOpacity(0.2),
                Colors.blue.shade900.withOpacity(0.2),
              ],
            ),
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
                    "Key Features",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: width < 400
                      ? 1.1
                      : width < 600
                          ? 1.5
                          : 1.8,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          feature['icon'] as IconData,
                          color: Colors.purple.shade300,
                          size: 24,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          feature['title'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          feature['desc'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.grey.shade400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ).animate().scale(
                        begin: const Offset(0.8, 0.8),
                        duration: const Duration(milliseconds: 400),
                        delay: Duration(milliseconds: 400 + (index * 100)),
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScreenshotsSection() {
    final screenshots = widget.screenshots;

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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                "Screenshots",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Main Screenshot Display
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                screenshots[selectedScreenshot],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          color: Colors.grey.shade600,
                          size: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Screenshot not available",
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 600)),

          const SizedBox(height: 20),

          // Screenshot Thumbnails
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: screenshots.length,
              itemBuilder: (context, index) {
                final isSelected = selectedScreenshot == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedScreenshot = index;
                    });
                  },
                  child: Container(
                    width: 60,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Colors.purple.shade400
                            : Colors.white.withOpacity(0.2),
                        width: 2,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.4),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        screenshots[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade800,
                            child: Icon(
                              Icons.image,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                          );
                        },
                      ),
                    ),
                  ).animate().scale(
                        begin: const Offset(0.8, 0.8),
                        duration: const Duration(milliseconds: 400),
                        delay: Duration(milliseconds: 800 + (index * 100)),
                      ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Screenshot Navigation Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              screenshots.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedScreenshot == index
                      ? Colors.purple.shade400
                      : Colors.grey.shade700,
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 600),
        );
  }
}
