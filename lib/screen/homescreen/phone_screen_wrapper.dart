import 'package:awesome_portfolio/screen/homescreen/phone_home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/current_state.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget childG;
  const ScreenWrapper({super.key, required this.childG});

  @override
  Widget build(BuildContext context) {
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);
    return Column(
      children: [
        // here can show the appbar
        Consumer<CurrentState>(builder: (context, _, __) {
          if (!instance.isMainScreen) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFF0A0A0A)),
              padding: const EdgeInsets.only(top: 30),
              // height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      instance.title ?? "",
                      style:
                          GoogleFonts.inter(fontSize: 18, color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        instance.changePhoneScreen(
                          const PhoneHomeScreen(),
                          true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        }),
        Expanded(
          child: Container(
            // padding: const EdgeInsets.only(top: 10),
            child: childG,
          ),
        ),
      ],
    );
  }
}
