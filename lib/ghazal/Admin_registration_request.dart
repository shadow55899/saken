// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:tapbar/modules/Admin/Admin_registration_request/Admin_registration_request_controller.dart';

// class AdminRegistrationRequest extends StatelessWidget {
//   AdminRegistrationRequestController controller =Get.find();
//   @override
//   Widget build(BuildContext context) {
//     final screenHight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     double boxHeight;
//     double boxWidth;
//     double titleSize;
//     double titleSize1;

//     bool isMobile = screenHight > screenWidth;

//     if (isMobile) {
//       boxHeight = screenHight * 0.20;
//       boxWidth = screenWidth ;
//       titleSize = screenWidth * 0.05;
//       titleSize1=screenWidth*0.01;      
//     } else {
//       boxWidth = screenWidth ;
//       boxHeight = screenHight * 0.20;
//       titleSize = screenWidth * 0.017;
//       titleSize1=screenWidth*0.01;
//     }

//     return Scaffold(
//       body:
//          SingleChildScrollView(
//            child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                    height: boxHeight,
//                     width: boxWidth,
//                    child: Center(  
//                    child:  Text(
//                     'طلبات التسجيل',
//                     style: TextStyle(
//                       fontSize: titleSize,
//                       fontWeight: FontWeight.bold
//                     ),
//                   ),
//                 ),
//               ),
           
           
           
           
           
//                isMobile
//                ? ListView.builder(
//                 shrinkWrap: true,
//                  physics: NeverScrollableScrollPhysics(),
//                 itemCount: 12,
//                 itemBuilder: (context,indext){
//                   return Padding(
//                     padding: const EdgeInsets.only(
//                       left: 10,
//                       right: 10,
//                       bottom: 10

//                     ),
//                     child: InkWell(
//                       onTap: (){
//                         Get.defaultDialog(
//                           title: 'تسجيل دخول ',
//                           cancel: Container(
//                             height: screenHight*0.5,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: screenWidth*0.8,
//                                   color: const Color.fromARGB(255, 60, 84, 181),
//                                   child: Text('Name',
//                                   style:TextStyle(
//                                     fontWeight: FontWeight.w600,
                                    
//                                   ) ,),
//                                 )
//                               ],
//                             ),
//                           )
                          
//                         );

//                       },
//                       child: Card(
                        
//                         color: const Color.fromARGB(255, 50, 196, 130),
//                         child: ListTile(
//                           title: Text('طلب تسجيل رقم ${indext+1}'),
//                           subtitle: Text('2000'),
                          
                            
//                           ),
//                         ),
//                     ),
//                   )
//                   ;
//                 })
            
//                 :SingleChildScrollView(
//                   child: Padding(
                  
//                     padding: const EdgeInsets.all(15),
//                     child: GridView.builder(
//                        shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 5,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
                      
//                     ),
//                     itemCount: 10,
//                        itemBuilder:
//                        (context,indext){
//                           return InkWell(
//                             onTap: (){
//                                Get.defaultDialog(
//                           title: 'تسجيل دخول ',
//                           cancel: Container(
//                             height: screenHight*0.7,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: screenWidth*0.5,
//                                   color: const Color.fromARGB(255, 60, 84, 181),
//                                   child: Text('Name',
//                                   style:TextStyle(
//                                     fontWeight: FontWeight.w600,
                                    
//                                   ) ,),
//                                 )
//                               ],
//                             ),
//                           )
                          
//                         );
                  
//                             },
//                             child: Card(
//                               color: Colors.blueGrey,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('طلب تسجيل رقم ${indext+1}',
//                                 style: TextStyle(
//                                   fontSize: titleSize,
//                                 ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text('11/5/2025',
//                                 style: TextStyle(
//                                   fontSize: titleSize1,
//                                 ),
//                                 ),
//                               ],
//                             )),
//                           );
//                        }
//                        ),
//                   ),
//                 )
//             ],
//           ),
//          ),
       
//     );
//   }
// }