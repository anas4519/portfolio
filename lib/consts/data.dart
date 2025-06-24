import 'package:awesome_portfolio/models/app_model.dart';
import 'package:awesome_portfolio/models/color_model.dart';
import 'package:awesome_portfolio/models/device_model.dart';
import 'package:awesome_portfolio/screen/miniProjects/achievements/achievements.dart';
import 'package:awesome_portfolio/screen/miniProjects/project_display/cardvault.dart';
import 'package:awesome_portfolio/screen/miniProjects/education/education.dart';
import 'package:awesome_portfolio/screen/miniProjects/experience/experience.dart';
import 'package:awesome_portfolio/screen/miniProjects/project_display/versevibe.dart';
import 'package:awesome_portfolio/screen/miniProjects/project_display/wizerai.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../screen/miniProjects/about/about.dart';
import '../screen/miniProjects/skills/skills.dart';

const double baseHeight = 790;
const double baseWidth = 1440;

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.android.samsungGalaxyNote20Ultra,
    icon: Icons.android,
  ),
  DeviceModel(
    device: Devices.ios.iPhone13,
    icon: Icons.apple,
  ),
  DeviceModel(
    device: Devices.ios.iPad,
    icon: Icons.tablet,
  ),
];

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.yellowAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorModel(
      svgPath: "assets/images/cloudyBlue.svg",
      color: const Color(0xff00d6ca),
      gradient: const LinearGradient(
        colors: [Color(0xff00ebd5), Color(0xff293474)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange], // Adjust colors as needed
    ),
  ),
];

List<AppModel> apps = [
  AppModel(
      title: "About",
      color: Colors.white,
      icon: Icons.person,
      screen: const AboutMe()),
  AppModel(
      title: "Skills",
      color: Colors.white,
      icon: Icons.ac_unit_rounded,
      screen: const Skills()),
  // AppModel(
  //   title: "Youtube",
  //   assetPath: "assets/icons/youtube.svg",
  //   color: Colors.white,
  //   link: youtubeChannel,
  // ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.png",
    color: Colors.white,
    link: linkedIn,
  ),
  // AppModel(
  //   title: "Twitter/X",
  //   assetPath: "assets/icons/twitter.svg",
  //   color: Colors.white,
  //   link: twitter,
  // ),
  // AppModel(
  //   title: "Topmate",
  //   assetPath: "assets/icons/topMate.png",
  //   color: Colors.white,
  //   link: topMate,
  // ),
  AppModel(
      title: "Experience",
      color: Colors.white,
      icon: FontAwesomeIcons.idBadge,
      screen: const Experience()),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: FontAwesomeIcons.edge,
    screen: const Education(),
  ),
  AppModel(
    title: "Github",
    assetPath: "assets/icons/github.png",
    color: Colors.white,
    link: github,
  ),
  AppModel(
      title: 'Resume',
      color: Colors.white,
      link: resumeLink,
      icon: Icons.file_copy),
  AppModel(
      title: 'Leetcode',
      color: Colors.black,
      link: lc,
      assetPath: "assets/icons/leetcode.png"),
  AppModel(
      title: "CardVault",
      assetPath: "assets/icons/cv_zoomed.png",
      color: Colors.white,
      screen: const Cardvault()),
  AppModel(
      title: "VerseVibe",
      assetPath: "assets/icons/versevibe.png",
      color: const Color.fromARGB(255, 16, 20, 30),
      screen: const VerseVibe()),
  AppModel(
      title: "WizerAI",
      color: const Color.fromARGB(255, 24, 19, 27),
      assetPath: "assets/icons/wizerai.png",
      screen: const WizerAI()),
  AppModel(
      title: "Achievements",
      color: Colors.white,
      icon: Icons.emoji_events,
      screen: const Achievements()),
  AppModel(
      title: "Codeforces",
      color: Colors.white,
      assetPath: "assets/icons/cf.png",
      link: cf)
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "New Delhi, India",
    title: 'B.Tech, Information Technology',
    company: 'Bhagwan Parshuram Institure of Technology',
    startDate: 'November 2022',
    endDate: 'Present',
    bulletPoints: ["Currently in the third year of my college!", "CGPA : 8.4"],
  ),
  JobExperience(
      color: Colors.blue,
      location: "New Delhi, India",
      title: 'XII PCM',
      company: 'Don Bosco School',
      startDate: 'March 2021',
      endDate: 'March 2022',
      bulletPoints: ["85%"]),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Remote",
    title: 'Flutter Developer Intern',
    company: 'CRTD Technologies',
    startDate: 'July 2024',
    endDate: 'August 2024',
    bulletPoints: [
      "Contributed to the development of the Hiremi app using Flutter, reaching 2X users, by targeting both Android and iOS, focusing on creating a user-friendly interface and implementing key functionalities for users.",
      "Built the Front-end of the application from scratch and optimized it for responsiveness and performance.",
      "Utilized Riverpod for state management and integrated various APIs to display data, ensuring real-time updates and seamless interaction, which improved app reliability by 20%.",
      "Used several other packages to enhance the user experience, incorporating features like animations, custom widgets, and efficient data handling.",
      "Managed and integrated code from other interns, implementing best practices for version control and bug-fixes.",
    ],
  ),
  // Add more job experiences here...
  // JobExperience(
  //   color: Colors.redAccent,
  //   location: "Remote",
  //   title: 'Flutter Developer',
  //   company: 'Perpetuum India',
  //   startDate: 'Oct 2022',
  //   endDate: 'Jan 2023',
  //   bulletPoints: [
  //     "Establish voice calling functionality using Agora SDK to enable real-time communication within the app.",
  //     "Implement intricate animations using Rive, enhancing the app's visual appeal and engagement.",
  //     "Collaborate directly with Stanza Living's CTO, gaining insights into industry best practices and cutting-edge technologies.",
  //     "Acquire proficiency in server-driven UI setup, optimizing app flexibility and scalability through dynamic configuration.",
  //   ],
  // ),
  // JobExperience(
  //   color: Colors.orangeAccent,
  //   location: "Remote",
  //   title: 'App Architecture Intern',
  //   company: 'Habeato',
  //   startDate: 'Oct 2021',
  //   endDate: 'Nov 2021',
  //   bulletPoints: [
  //     "Collaborated with founders to develop a HealthifyMe clone, demonstrating strong teamwork and app development skills.",
  //     "Engineered complex animations to enhance user experience and app visual appeal.",
  //     "Played an active role in system design processes, contributing to efficient and scalable app architecture.",
  //   ],
  // ),
  // JobExperience(
  //   color: Colors.greenAccent,
  //   location: "Remote",
  //   title: 'App Developer',
  //   company: 'Kylo Apps',
  //   startDate: 'Sep 2021',
  //   endDate: 'Oct 2021',
  //   bulletPoints: [
  //     "Collaborated as a team member in developing a cryptocurrency wallet, akin to Trust Wallet, showcasing strong teamwork and blockchain app development expertise.",
  //     "Proficiently integrated REST APIs into the application, enhancing its functionality and connectivity with external services."
  //   ],
  // ),
  // JobExperience(
  //   color: Colors.black,
  //   location: "Remote",
  //   title: 'Flutter App Intern',
  //   company: 'Cogent Web Services',
  //   startDate: 'Dec 2020',
  //   endDate: 'June 2021',
  //   bulletPoints: [
  //     "Independently developed a Life Simulator game using Flutter from scratch, applying state-of-the-art state management practices to ensure a top-tier user experience.",
  //     "Leveraged Flutter's robust features to craft an immersive and captivating gameplay experience, demonstrating proficiency in app development.",
  //     "Successfully implemented Google Ads, in-app purchases, and Hive database for efficient user data storage and monetization strategies.",
  //     "Generated creative ideas for client pitches, fostering creativity and ensuring the game's entertainment value and thought-provoking nature.",
  //     "Published the game on the Play Store, achieving over 5,000 downloads, showcasing the ability to deliver a popular and engaging mobile application.",
  //   ],
  // ),
];

const String linkedIn = "https://www.linkedin.com/in/anas-nadeem-8888bb223/";
const String github = "https://github.com/anas4519";
const String twitter = "https://x.com/AnasNad50405828";
const String cf = "https://codeforces.com/profile/Anas45";
const String lc = 'https://leetcode.com/u/anas45/';
const String resumeLink =
    "https://drive.google.com/drive/folders/11M7tvOZhP3f5pK-c4gvlMf-ORHpHryB7";
const String email = "nadeemanas617@gmail.com";
const String emailLink = "mailto:nadeemanas617@gmail.com";
String introduction =
    "Welcome to my portfolio website, this website is highly inspired High Coder and Pawan Kumar.\n\n I am a 3rd year B.Tech student in Information Technology, seeking a software development internship to leverage skills in Java, Flutter and Dart.\nEnthusiastic and fast learner, eager to apply academic knowledge and problem-solving abilities to contribute to innovative projects. With a strong programming foundation, proactive attitude, and openness to learning new technologies, I aim to support and drive efficiency within the development team.\n\nYou can check out my projects using the other apps on the Home Screen.";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Git/Github",
    colorS: Colors.pink,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Java",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "C/C++",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "NodeJS",
    colorS: Colors.green,
  ),
  SkillsModel(
    skillName: "Javascript",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "ExpressJS",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "MongoDB",
    colorS: Colors.green,
  ),
  SkillsModel(
    skillName: "Azure App Service",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "AWS EC2",
    colorS: Colors.orange,
  ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
