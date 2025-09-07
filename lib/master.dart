

// class Master extends StatelessWidget {
//   Master({Key? key}) : super(key: key);
//   final MasterController controller =
//       Get.put(MasterController(), permanent: false);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> screens = [
//       Home(),
//       SalesPage(),
//       CartPage(),
//       Editing(),
//     ];
//
//     return Scaffold(
//       body: Obx(() =>
//           IndexedStack(index: controller.tabIndex.value, children: screens)),
//       bottomNavigationBar: Obx(() {
//         var activecolor = Colors.white;
//         var inactiveColor = Colors.white30;
//         return FlashyTabBar(
//           selectedIndex: controller.tabIndex.value,
//           animationCurve: Curves.linear,
//           showElevation: true,
//           backgroundColor: Colors.teal,
//           animationDuration: const Duration(milliseconds: 250),
//           iconSize: 27.5,
//           height: 60,
//           items: [
//             FlashyTabBarItem(
//               icon: Icon(MdiIcons.home),
//               activeColor: activecolor,
//               inactiveColor: inactiveColor,
//               title: const Text(
//                 'Home',
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             FlashyTabBarItem(
//               icon: Icon(MdiIcons.sale),
//               activeColor: activecolor,
//               inactiveColor: inactiveColor,
//               title: const Text(
//                 'Sales',
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             FlashyTabBarItem(
//               icon: Icon(Icons.shopping_cart),
//               activeColor: activecolor,
//               inactiveColor: inactiveColor,
//               title: const Text(
//                 'Cart',
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             FlashyTabBarItem(
//               icon: Icon(MdiIcons.archiveEdit),
//               activeColor: activecolor,
//               inactiveColor: inactiveColor,
//               title: const Text(
//                 'Container',
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ],
//           onItemSelected: controller.changeTabindex,
//         );
//       }),
//     );
//   }
// }
