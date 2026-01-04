import 'package:tapbar/screens/my_apartment_screen.dart';

import '../models/flat.dart';
import '../widgets/close_button_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_apartment.dart';
import 'bookings_requests.dart';


class ApartmentOwnerHome extends StatelessWidget {
  const ApartmentOwnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
     final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:  Text('apartment_owner'.tr),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 54, 201, 177),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight*0.15,),
          Center(
            child: Text(
              'welcome'.tr,
              style: TextStyle(
                fontSize:screenWidth*0.1,
                fontWeight:FontWeight.w600 ),),
          ),
             SizedBox(height: screenHeight * 0.2), // مسافة من الأعل
                // الصف الأول
                CloseButtonResponsive(
                  label: 'add_apartment'.tr,
                
                  onPressed: () {
                    // فتح صفحة Mm لإضافة شقة جديدة
                    Get.to(() => AddApartment(isUpdate: false));
                  },
                ),
                const SizedBox(height:16),

                CloseButtonResponsive(
                  label:'my_apartments'.tr,
                 
                  onPressed: () {
                    Get.to(()=>MyApartmentScreen());

                  },
                ),
                const SizedBox(height: 16),
                CloseButtonResponsive(
                  label:'apartment_requests'.tr ,

                  onPressed: () {
                    Get.to(()=>BookingsRequests());

                  },
                ),
              ],
            ),
          );
      
  }
}

// الزر الخاص بك يبقى كما هو
