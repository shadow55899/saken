// /*import 'package:flutter/material.dart';

// class Photo extends StatelessWidget {
//   final double screenHeight;
//   final double screenWidth;
//   final String imagePath;

//   const Photo({
//     super.key,
//     required this.screenHeight,
//     required this.screenWidth,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool photoSize = screenWidth > screenHeight;
//     final double size = photoSize
//         ? screenWidth * 0.1
//         : screenHeight * 0.1; // إذا الارتفاع أكبر

//     return SizedBox(
//       height: size,
//       width: size,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.white, width: 2),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }*/
// import 'package:flutter/material.dart';

// class Photo extends StatelessWidget {
//   final String imagePath;

//   const Photo({
//     super.key,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final bool isLandscape = size.width > size.height;
//     final double boxSize = (isLandscape ? size.width : size.height) * 0.1;

//     return SizedBox(
//       height: boxSize,
//       width: boxSize,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.white, width: 2),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }

