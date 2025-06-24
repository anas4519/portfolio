import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenshotsSection extends StatefulWidget {
  final List<String> screenshots;
  final int selectedScreenshot;
  const ScreenshotsSection({
    super.key,
    required this.screenshots,
    required this.selectedScreenshot,
  });

  @override
  State<ScreenshotsSection> createState() => _ScreenshotsSectionState();
}

class _ScreenshotsSectionState extends State<ScreenshotsSection> {
  @override
  Widget build(BuildContext context) {
    int ss = widget.selectedScreenshot;
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
                widget.screenshots[ss],
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
              itemCount: widget.screenshots.length,
              itemBuilder: (context, index) {
                final isSelected = ss == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      ss = index;
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
                        widget.screenshots[index],
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
              widget.screenshots.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ss == index
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
