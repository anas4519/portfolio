import 'package:awesome_portfolio/screen/miniProjects/project_display/project_builder.dart';
import 'package:flutter/material.dart';

class VerseVibe extends StatefulWidget {
  const VerseVibe({super.key});

  @override
  State<VerseVibe> createState() => _VerseVibeState();
}

class _VerseVibeState extends State<VerseVibe> {
  final List<String> screenshots = [
    'screenshots/vv/ss1.png',
    'screenshots/vv/ss2.png',
    'screenshots/vv/ss3.png',
    'screenshots/vv/ss4.png',
  ];

  final String bgImage = 'assets/icons/VerseVibe.png';

  final String name = 'VerseVibe';

  final String tagLine = 'A modern AI-powered blogging platform';

  final String psLink =
      'https://play.google.com/store/apps/details?id=com.versevibe.versevibe';

  final String ghLink = 'https://github.com/anas4519/VerseVibe';

  final String details = '''
VerseVibe is a sophisticated and modern blogging platform, designed to offer users a clean, intuitive interface and a seamless writing experience. Built with a focus on both functionality and aesthetics, VerseVibe allows users to create, manage, and share their blog posts effortlessly. The application also integrates cutting-edge AI features that enhance the blogging experience, making it much more than just a standard blogging platform.

At the heart of VerseVibe’s backend, Node.js is implemented for efficient, fast, and secure user authentication using JWT tokens. This setup has significantly improved the authentication speed by 50%, ensuring a smooth login and registration process. In addition to the robust authentication system, VerseVibe incorporates a powerful REST API, allowing users to interact with the platform efficiently. Image uploads are seamlessly handled using Multer, making it easy for bloggers to add visuals to their posts, further enhancing the content creation process.

For database management, VerseVibe relies on MongoDB, providing scalable and efficient storage for user data, blog posts, and other content. The application is optimized for fast performance, achieving a 30% reduction in data retrieval times, ensuring that users can access their content quickly and without delays, even as the platform scales.

One of the standout features of VerseVibe is its integration of AI capabilities using the Gemini API. This API powers advanced functionalities like the AI Assistant, which assists bloggers with content suggestions, grammar checks, and topic ideas, making the writing process more intuitive and productive. Additionally, VerseVibe includes AI-generated blog summaries, which provide concise overviews of lengthy posts, making content more digestible for readers. The platform also incorporates Text-to-Speech (TTS) technology, allowing users to listen to blog content, improving accessibility and offering a new way to engage with the material.

VerseVibe is not just a blogging app but a comprehensive tool that leverages modern technology to enhance the user experience, combining a sleek interface with powerful AI-driven features for an efficient and enjoyable blogging experience. VerseVibe will be available on the Google Play Store soon.
''';

  final List<Map<String, dynamic>> features = [
    {
      'icon': Icons.edit,
      'title': 'Seamless Blogging',
      'desc': 'Create and share posts easily'
    },
    {
      'icon': Icons.security,
      'title': 'Secure Authentication',
      'desc': 'Fast, secure JWT login'
    },
    {
      'icon': Icons.api,
      'title': 'REST API',
      'desc': 'Smooth backend integration'
    },
    {
      'icon': Icons.image,
      'title': 'Image Uploads',
      'desc': 'Add images to posts'
    },
    {
      'icon': Icons.lightbulb,
      'title': 'AI Assistant',
      'desc': 'Smart content suggestions'
    },
    {
      'icon': Icons.summarize,
      'title': 'AI Summaries',
      'desc': 'Auto-generated summaries'
    },
    {
      'icon': Icons.record_voice_over,
      'title': 'Text-to-Speech',
      'desc': 'Listen to blog content'
    },
    {
      'icon': Icons.speed,
      'title': 'Optimized Performance',
      'desc': 'Fast and scalable'
    },
  ];

  final List<Map<String, dynamic>> techStack = [
    {'name': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'Node.js', 'icon': Icons.dns, 'color': Colors.green},
    {'name': 'MongoDB', 'icon': Icons.storage, 'color': Colors.green},
    {'name': 'Multer', 'icon': Icons.upload_file, 'color': Colors.deepPurple},
    {'name': 'Gemini API', 'icon': Icons.smart_toy, 'color': Colors.orange},
    {'name': 'JWT', 'icon': Icons.verified_user, 'color': Colors.teal},
    {'name': 'REST API', 'icon': Icons.api, 'color': Colors.indigo},
    {
      'name': 'Text-to-Speech',
      'icon': Icons.record_voice_over,
      'color': Colors.redAccent
    },
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
    );
  }
}
