// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:tapbar/Model/model_message.dart';
// import 'package:tapbar/modules/chat/chat_controller.dart';

// class Chat extends StatelessWidget {

//   ChatController controller=Get.find();
  
//      final List message = [
//    ModelMessage (Personal_Name: "Ghazal saeed 1",  description: "........",Personal_Photo:"hm..."),
//    ModelMessage (Personal_Name: "Ghazal saeed 1",  description: ".........",Personal_Photo:"hm..."),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var scaffold = Scaffold(
//       appBar: AppBar( backgroundColor: const Color.fromARGB(255, 99, 239, 103),
//       title:Row(mainAxisAlignment: MainAxisAlignment.end,
      
//       )),
//       body: ListView.builder(
//         itemCount: message.length,
        
//         itemBuilder:  (context, index) => Card(child: ListTile(
//           leading: CircleAvatar(child:Text(message[index].Personal_Photo),radius: 30,),
//           title: Text(message[index].Personal_Name),
//           subtitle: Text(message[index].description),
//         ),)
//       ));
//     return scaffold;
      
//   }
// }