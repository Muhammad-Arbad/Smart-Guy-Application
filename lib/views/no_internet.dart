import 'package:flutter/material.dart';
import 'package:smart_guy/views/splash.dart';

import 'package:smart_guy/widgets/scaffold_first.dart';

import '../constants/consts.dart';
import '../widgets/custom_button.dart';



class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldFirst(

      mainBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4_outlined,size: 50,color: CustomAppColors.primaryColor,),
          Text("No Internet",),
          CustomButtonWithWithoutIcon(text: "Reload",onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const SplashScreen()));
          },)
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class NoInternet extends StatefulWidget {
//   @override
//   _NoInternetState createState() => _NoInternetState();
// }
//
// class _NoInternetState extends State<NoInternet>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _pageTurnAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     )..repeat(reverse: true);
//
//     _pageTurnAnimation = Tween(begin: -1.0, end: 0.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 200,
//               height: 300,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Image.asset('assets/icons/eye_close.png'), // Replace with your asset path
//                   Positioned(
//                     top: 0,
//                     child: AnimatedBuilder(
//                       animation: _pageTurnAnimation,
//                       builder: (context, child) {
//                         return Transform.translate(
//                           offset: Offset(0, -150 * _pageTurnAnimation.value),
//                           child: Image.asset(
//                             'assets/icons/eye_open.png', // Replace with your asset path
//                             width: 200,
//                             height: 150,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
