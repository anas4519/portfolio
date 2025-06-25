import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;
  const SocialIconButton({super.key, required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          asset,
          color: Colors.white,
        ),
      ),
    );
  }
}

// class _SocialIconButton extends StatelessWidget {
//       final String asset;
//       final VoidCallback onTap;
    
//       const _SocialIconButton({
//         Key? key,
//         required this.asset,
//         required this.onTap,
//       }) : super(key: key);
    
//       @override
//       Widget build(BuildContext context) {
//         return InkWell(
//           borderRadius: BorderRadius.circular(12),
//           onTap: onTap,
//           child: Container(
//             width: 40,
//             height: 40,
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: SvgPicture.asset(
//               asset,
//               color: Colors.white,
//             ),
//           ),
//         );
//       }
//     }