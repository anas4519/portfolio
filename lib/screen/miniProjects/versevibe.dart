import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class VerseVibe extends StatefulWidget {
  const VerseVibe({super.key});

  @override
  State<VerseVibe> createState() => _CardvaultState();
}

class _CardvaultState extends State<VerseVibe> {
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
                    backgroundImage: AssetImage('assets/icons/versevibe.png'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: InkWell(
                    onTap: () async {
                      const url = 'https://github.com/anas4519/VerseVibe';
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
                  "VerseVibe is a sophisticated and modern blogging platform, designed to offer users a clean, intuitive interface and a seamless writing experience. Built with a focus on both functionality and aesthetics, VerseVibe allows users to create, manage, and share their blog posts effortlessly. The application also integrates cutting-edge AI features that enhance the blogging experience, making it much more than just a standard blogging platform.\n\n"
                  "At the heart of VerseVibe’s backend, Node.js is implemented for efficient, fast, and secure user authentication using JWT tokens. This setup has significantly improved the authentication speed by 50%, ensuring a smooth login and registration process. In addition to the robust authentication system, VerseVibe incorporates a powerful REST API, allowing users to interact with the platform efficiently. Image uploads are seamlessly handled using Multer, making it easy for bloggers to add visuals to their posts, further enhancing the content creation process.\n\n"
                  "For database management, VerseVibe relies on MongoDB, providing scalable and efficient storage for user data, blog posts, and other content. The application is optimized for fast performance, achieving a 30% reduction in data retrieval times, ensuring that users can access their content quickly and without delays, even as the platform scales.\n\n"
                  "One of the standout features of VerseVibe is its integration of AI capabilities using the Gemini API. This API powers advanced functionalities like the AI Assistant, which assists bloggers with content suggestions, grammar checks, and topic ideas, making the writing process more intuitive and productive. Additionally, VerseVibe includes AI-generated blog summaries, which provide concise overviews of lengthy posts, making content more digestible for readers. The platform also incorporates Text-to-Speech (TTS) technology, allowing users to listen to blog content, improving accessibility and offering a new way to engage with the material.\n\n"
                  "VerseVibe is not just a blogging app but a comprehensive tool that leverages modern technology to enhance the user experience, combining a sleek interface with powerful AI-driven features for an efficient and enjoyable blogging experience. VerseVibe will be available on the Google Play Store soon.",
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w500),
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
