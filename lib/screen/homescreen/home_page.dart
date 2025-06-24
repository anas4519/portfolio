import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/providers/theme_provider.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widgets/frosted_container.dart';
import 'phone_screen_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = false;
    if (size.width < 800) {
      phone = true;
    }

    return Scaffold(
      body: Stack(
        children: [
          Selector<CurrentState, Gradient>(
            selector: (context, provider) => provider.bgGradient,
            builder: (context, _, __) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  image: DecorationImage(
                    image: AssetImage('images/batman7.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
              );
            },
          ),
          SingleChildScrollView(
            child: phone
                ? Column(
                    children: [
                      SizedBox(height: 25 * theme.heightRatio),
                      // Centered phone screen for mobile
                      _buildCenteredPhoneScreen(size, currentState, theme),
                      SizedBox(height: 25 * theme.heightRatio),
                      // Device selection buttons
                      _buildDeviceSelectionButtons(currentState),
                      SizedBox(height: 30 * theme.heightRatio),
                    ],
                  )
                : _buildDesktopLayout(size, currentState, theme),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
      Size size, CurrentState currentState, ThemeProvider theme) {
    return SizedBox(
      height: size.height,
      child: Row(
        children: [
          // Left side - Phone screen (centered)
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height - 200,
                    child: Consumer<CurrentState>(
                      builder: (context, _, __) {
                        return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF1a1a1a), // Dark gray
                                  Color(0xFF0f0f0f), // Darker gray
                                  Color(0xFF060606), // Near black
                                ],
                                stops: [0.0, 0.6, 1.0],
                              ),
                            ),
                            child: ScreenWrapper(
                                childG: currentState.currentScreen),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 25 * theme.heightRatio),
                  // Device selection buttons below phone
                  _buildDeviceSelectionButtons(currentState),
                ],
              ),
            ),
          ),

          // Right side - Containers starting from top
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: 50 * theme.heightRatio,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: theme.heightRatio * 20,
                children: [
                  // Name container
                  FrostedWidget(
                    childW: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 75 * theme.heightRatio,
                            horizontal: 50 * theme.widthRatio),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Anas Nadeem',
                              style: GoogleFonts.exo(
                                fontSize: 48,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxFontSize: 42,
                              minFontSize: 24,
                              maxLines: 1,
                            ).animate().fadeIn(
                                  delay: .8.seconds,
                                  duration: .7.seconds,
                                ),
                            SizedBox(height: 24 * theme.heightRatio),
                            FrostedWidget(
                              height: theme.heightRatio * 30,
                              width: theme.widthRatio * 250,
                              childW: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: AutoSizeText(
                                    'Flutter Developer + Backend developer',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxFontSize: 18,
                                    minFontSize: 14,
                                    maxLines: 1,
                                  ).animate().fadeIn(
                                        delay: 1.seconds,
                                        duration: .7.seconds,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15 * theme.heightRatio),
                            AutoSizeText(
                              '''I’m a Flutter developer and tech enthusiast pursuing B.Tech in IT. I’ve built full-stack apps like WizerAI, CardVault, and VerseVibe using Flutter, Node.js, Supabase, and Gemini API. I’ve interned at CRTD Technologies and love building sleek, high-performance apps. I’m also active on LeetCode and Codeforces (Pupil, max 1233), always sharpening my problem-solving skills.''',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                              maxFontSize: 16,
                              minFontSize: 12,
                            ).animate().fadeIn(
                                  delay: 1.2.seconds,
                                  duration: .7.seconds,
                                ),
                          ],
                        ),
                      ),
                    ),
                    height: 350 * theme.heightRatio,
                    width: 550 * theme.widthRatio,
                  ),

                  // Row with Connect and Theme containers

                  // Connect with me container
                  FrostedWidget(
                    onPressed: () {
                      currentState.launchInBrowser(linkedIn);
                    },
                    childW: Container(
                      padding: EdgeInsets.all(20 * theme.heightRatio),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Connect with me",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            maxFontSize: 18,
                            minFontSize: 14,
                          ),
                          SizedBox(height: 15 * theme.heightRatio),
                          // Social icons grid
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              // GitHub
                              GestureDetector(
                                onTap: () {
                                  currentState.launchInBrowser(github);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/logos/gh.svg',
                                      height: 5,
                                      width: 5,
                                      color: Colors.white,
                                    )),
                              ),
                              // LinkedIn
                              GestureDetector(
                                onTap: () {
                                  currentState.launchInBrowser(linkedIn);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/logos/li.svg',
                                      height: 5,
                                      width: 5,
                                      color: Colors.white,
                                    )),
                              ),
                              // Twitter
                              GestureDetector(
                                onTap: () {
                                  currentState.launchInBrowser(twitter);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/logos/twitter.svg',
                                      height: 5,
                                      width: 5,
                                      color: Colors.white,
                                    )),
                              ),
                              // Email
                              GestureDetector(
                                onTap: () {
                                  currentState.launchInBrowser(emailLink);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/logos/email.svg',
                                      height: 5,
                                      width: 5,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ).animate().fadeIn(
                            delay: 1.seconds,
                            duration: .7.seconds,
                          ),
                    ),
                    height: 120 * theme.heightRatio,
                    width: 320 * theme.widthRatio,
                  ),

                  SizedBox(
                    height: theme.heightRatio * 10,
                  ),
                  // Stats containers row
                  Row(
                    spacing: theme.widthRatio * 10,
                    children: [
                      FrostedWidget(
                        childW: Container(
                          padding: EdgeInsets.all(20 * theme.heightRatio),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(height: 6 * theme.heightRatio),
                              AutoSizeText(
                                '5+',
                                style: GoogleFonts.exo(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxFontSize: 36,
                                minFontSize: 24,
                              ),
                              SizedBox(height: 2 * theme.heightRatio),
                              AutoSizeText(
                                'Apps\nbuilt',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxFontSize: 16,
                                minFontSize: 12,
                              ),
                            ],
                          ).animate().fadeIn(
                                delay: 1.4.seconds,
                                duration: .7.seconds,
                              ),
                        ),
                        height: 150 * theme.heightRatio,
                        width: 150 * theme.widthRatio,
                      ),
                      FrostedWidget(
                        childW: Container(
                          padding: EdgeInsets.all(20 * theme.heightRatio),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.dashboard,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(height: 6 * theme.heightRatio),
                              AutoSizeText(
                                '10+',
                                style: GoogleFonts.exo(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxFontSize: 36,
                                minFontSize: 24,
                              ),
                              SizedBox(height: 2 * theme.heightRatio),
                              AutoSizeText(
                                'Overall\nProjects',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxFontSize: 16,
                                minFontSize: 12,
                              ),
                            ],
                          ).animate().fadeIn(
                                delay: 1.8.seconds,
                                duration: .7.seconds,
                              ),
                        ),
                        height: 150 * theme.heightRatio,
                        width: 150 * theme.widthRatio,
                      ),
                      FrostedWidget(
                        childW: Container(
                          padding: EdgeInsets.all(20 * theme.heightRatio),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.calculate_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(height: 6 * theme.heightRatio),
                              AutoSizeText(
                                '1000+',
                                style: GoogleFonts.exo(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxFontSize: 36,
                                minFontSize: 24,
                              ),
                              SizedBox(height: 2 * theme.heightRatio),
                              AutoSizeText(
                                'Problems\nSolved',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxFontSize: 16,
                                minFontSize: 12,
                              ),
                            ],
                          ).animate().fadeIn(
                                delay: 1.8.seconds,
                                duration: .7.seconds,
                              ),
                        ),
                        height: 150 * theme.heightRatio,
                        width: 150 * theme.widthRatio,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenteredPhoneScreen(
      Size size, CurrentState currentState, ThemeProvider theme) {
    return Center(
      child: SizedBox(
        height: size.height - 200,
        child: Consumer<CurrentState>(
          builder: (context, _, __) {
            return DeviceFrame(
              device: currentState.currentDevice,
              screen: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1a1a1a), // Dark gray
                      Color(0xFF0f0f0f), // Darker gray
                      Color(0xFF060606), // Near black
                    ],
                    stops: [0.0, 0.6, 1.0],
                  ),
                ),
                child: ScreenWrapper(childG: currentState.currentScreen),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDeviceSelectionButtons(CurrentState currentState) {
    return Selector<CurrentState, DeviceInfo>(
      selector: (context, p1) => p1.currentDevice,
      builder: (context, _, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(devices.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButton(
                  shadowColor: Colors.grey[800],
                  pressed: currentState.currentDevice == devices[index].device
                      ? Pressed.pressed
                      : Pressed.notPressed,
                  animate: true,
                  borderRadius: 100,
                  isThreeD: true,
                  backgroundColor: Colors.black,
                  width: 45,
                  height: 45,
                  onPressed: () {
                    currentState.changeSelectedDevice(devices[index].device);
                  },
                  child: Center(
                    child: Icon(
                      devices[index].icon,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              );
            })
          ],
        );
      },
    );
  }
}
