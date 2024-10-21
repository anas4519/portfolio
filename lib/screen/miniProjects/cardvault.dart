import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class Cardvault extends StatefulWidget {
  const Cardvault({super.key});

  @override
  State<Cardvault> createState() => _CardvaultState();
}

class _CardvaultState extends State<Cardvault> {
  double opacity = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xfff5f4e7),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/icons/cv_launcher_icon.png'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: InkWell(
                    onTap: () async {
                      const url = 'https://github.com/anas4519/CardVault';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      "GitHub Link",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Text(
                  "CardVault is a cutting-edge business card management solution, designed for professionals who want to streamline the way they store, organize, and access their business contacts. The app, developed with Flutter, offers a smooth and consistent experience across both Android and iOS devices, making it easy to scan and digitize business cards with just a few taps.\n\n"
                  "CardVault’s backend is powered by Node.js, ensuring fast and scalable performance for handling user authentication, real-time data processing, and seamless image uploads. With MongoDB as the database, your business card data is stored securely and efficiently, giving you the flexibility to categorize and retrieve contacts by name, industry, or other custom fields. Images are securely uploaded to Cloudinary, providing reliable cloud storage for all your business cards.\n\n"
                  "The app's intuitive search and filter functions, combined with the ability to export your contacts as PDFs, make managing business cards more efficient than ever. Customizable themes, including light and dark modes, enhance the user experience to suit your preferences.\n\n"
                  "CardVault will be available on the Google Play Store soon, offering an all-in-one solution for busy professionals looking to digitize and manage their networking efforts with the help of modern technology.",
                  style:
                      GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w500),
                ).animate().fadeIn(duration: const Duration(milliseconds: 500))
                // Text(
                //   introduction,
                //   style: GoogleFonts.openSans(
                //       fontSize: 15, fontWeight: FontWeight.w500),
                // ).animate().fadeIn(duration: const Duration(milliseconds: 500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
