import 'package:awesome_portfolio/screen/miniProjects/project_display/project_builder.dart';
import 'package:flutter/material.dart';

class WizerAI extends StatefulWidget {
  const WizerAI({super.key});

  @override
  State<WizerAI> createState() => _WizerAIState();
}

class _WizerAIState extends State<WizerAI> {
  final List<String> screenshots = [
    'assets/screenshots/wai/page1.png',
    'assets/screenshots/wai/page2.png',
    'assets/screenshots/wai/page3.png',
    'assets/screenshots/wai/page4.png',
    'assets/screenshots/wai/page5.png',
    'assets/screenshots/wai/page6.png',
    'assets/screenshots/wai/page7.png',
  ];

  final String bgImage = 'assets/icons/wizerai.png';

  final String name = 'WizerAI';

  final String tagLine = 'AI-powered career guidance for students';

  final String psLink =
      'https://play.google.com/store/apps/details?id=com.wizer.career_counsellor';

  final String ghLink = 'https://github.com/anas4519/WizerAI';

  final String details = '''
WizerAI is an AI-powered career guidance platform for school and college students, now live on the Play Store.

Integrated Google Auth via Supabase, which also handles secure user data storage using PostgreSQL. Leveraged Gemini API for personalized AI chatbots and compatibility analysis, and YouTube Media API to provide curated video resources for career and degree exploration. Implemented local caching using Hive for offline support and better performance across devices.

Discover your future with Wizer, the ultimate AI-powered career guidance app designed specifically for school and college students. With Wizer, you can explore a vast range of career opportunities and gain personalized insights to help you confidently plan your academic and professional journey. Our app offers a unique, interactive experience that brings career exploration to life, guiding you through every step of discovering and pursuing the path that best fits your interests and talents.

Wizer features intelligent AI chatbots, interactive compatibility checks, AI-generated MCQs and reasoning assessments, detailed career pathways, and a continuously updated database of career information and trends. Empower yourself with the knowledge, tools, and support you need to make confident, well-informed decisions about your future.
''';

  final List<Map<String, dynamic>> features = [
    {
      'icon': Icons.chat,
      'title': 'AI Chatbots',
      'desc': 'Personalized career guidance 24/7'
    },
    {
      'icon': Icons.check_circle,
      'title': 'Compatibility Checks',
      'desc': 'Find careers that match your strengths'
    },
    {
      'icon': Icons.quiz,
      'title': 'AI-Generated Assessments',
      'desc': 'MCQs and reasoning for self-discovery'
    },
    {
      'icon': Icons.video_library,
      'title': 'Curated Video Resources',
      'desc': 'Explore careers with YouTube integration'
    },
    {
      'icon': Icons.security,
      'title': 'Secure Auth & Storage',
      'desc': 'Google Auth & Supabase PostgreSQL'
    },
    {
      'icon': Icons.offline_bolt,
      'title': 'Offline Support',
      'desc': 'Hive-based local caching'
    },
    {
      'icon': Icons.timeline,
      'title': 'Career Pathways',
      'desc': 'Step-by-step guidance for your goals'
    },
    {
      'icon': Icons.update,
      'title': 'Continuous Updates',
      'desc': 'Latest career info and trends'
    },
  ];

  final List<Map<String, dynamic>> techStack = [
    {'name': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'Supabase', 'icon': Icons.cloud, 'color': Colors.green},
    {'name': 'PostgreSQL', 'icon': Icons.storage, 'color': Colors.indigo},
    {'name': 'Hive', 'icon': Icons.offline_bolt, 'color': Colors.amber},
    {'name': 'Gemini API', 'icon': Icons.smart_toy, 'color': Colors.orange},
    {'name': 'YouTube API', 'icon': Icons.video_library, 'color': Colors.red},
    {'name': 'Google Auth', 'icon': Icons.verified_user, 'color': Colors.teal},
  ];

  final List<String> points = [
    'AI-powered career guidance for students',
    'Integrated Google Auth via Supabase for secure authentication',
    'User data stored securely using PostgreSQL',
    'Personalized AI chatbots powered by Gemini API',
    'Compatibility analysis to match careers with strengths',
    'Curated video resources using YouTube Media API',
    'Local caching with Hive for offline support',
    'Interactive compatibility checks and AI-generated assessments',
    'Detailed career pathways and up-to-date career information',
    'Continuously updated database of career trends',
  ];
  @override
  Widget build(BuildContext context) {
    return ProjectBuilder(
        screenshots: screenshots,
        bgImage: bgImage,
        name: name,
        tagLine: tagLine,
        psLink: psLink,
        ghLink: ghLink,
        details: details,
        techStack: techStack,
        features: features,
        points: points);
  }
}

// WizerAI | Flutter, Supabase, Hive, Gemini Google Play Store Link | GitHub Link
// • WizerAI is an AI-powered career guidance platform for school and college students, now live on the Play Store.
// • Integrated Google Auth via Supabase, which also handles secure user data storage using PostgreSQL.
// • Leveraged Gemini API for personalized AI chatbots and compatibility analysis, and YouTube Media API
// to provide curated video resources for career and degree exploration.
// • Implemented local caching using Hive for offline support and better performance across devices.

// Discover your future with Wizer, the ultimate AI-powered career guidance app designed specifically for school and college students. With Wizer, you can explore a vast range of career opportunities and gain personalized insights to help you confidently plan your academic and professional journey. Our app offers a unique, interactive experience that brings career exploration to life, guiding you through every step of discovering and pursuing the path that best fits your interests and talents.

// Upon launching Wizer, you’re welcomed by a sleek, user-friendly interface that makes navigation effortless and enjoyable. The app presents a rich collection of career details, including comprehensive profiles that outline the skills needed, educational requirements, job roles, and potential growth prospects across various industries. Each career profile is designed to provide you with a clear picture of what to expect and how to prepare, so you can make informed decisions about your future.

// Engage with our intelligent AI chatbots that are available 24/7 to answer your questions and provide expert advice tailored to your unique aspirations. Whether you’re curious about the day-to-day responsibilities of a specific role or need guidance on the next steps in your career journey, our chatbots deliver immediate, personalized support that helps you navigate the complex world of career planning.

// Wizer also features interactive compatibility checks that evaluate your interests, strengths, and personality traits to suggest careers that align with who you are. This innovative tool helps you identify fields where you’re most likely to thrive, ensuring that your future is built on a foundation that plays to your natural abilities.

// In addition to these features, Wizer offers dynamic, AI-generated multiple-choice questions (MCQs) and reasoning assessments that challenge your critical thinking and problem-solving skills. These engaging assessments are designed not only to test your current knowledge but also to highlight areas for improvement, giving you the confidence and clarity needed to succeed academically and professionally.

// Our app goes beyond simple career guidance by providing detailed career pathways that break down the steps necessary to achieve your goals. From choosing the right courses and building relevant skills to understanding emerging industry trends, Wizer equips you with actionable insights and practical advice that can make a real difference in your career planning.

// Wizer is continuously updated with fresh content, ensuring that you always have access to the latest career information and trends. Our commitment to providing accurate, up-to-date guidance means you can trust Wizer as your go-to resource for all things career-related. We believe that every student deserves the opportunity to explore their potential and unlock a future filled with success and satisfaction.

// Join a vibrant community of students who are already using Wizer to turn their career dreams into reality. Empower yourself with the knowledge, tools, and support you need to make confident, well-informed decisions about your future. With Wizer, you’re not just planning a career—you’re building a lifelong journey of growth, achievement, and personal fulfillment.

// Download Wizer today and start charting your path to success with the guidance of cutting-edge AI, expert insights, and a wealth of resources designed just for you. Let Wizer be the mentor that transforms your aspirations into accomplishments, guiding you every step of the way toward a brighter tomorrow.
