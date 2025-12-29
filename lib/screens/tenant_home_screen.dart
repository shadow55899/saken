import '../models/flat.dart';
import '../widgets/close_button_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mm.dart';


class TenantHomeScreen extends StatelessWidget {
  const TenantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
     final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("صفحة المأجر"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 54, 201, 177),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight*0.15,),
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize:screenWidth*0.1,
                fontWeight:FontWeight.w600 ),),
          ),
             SizedBox(height: screenHeight * 0.2), // مسافة من الأعل
                // الصف الأول
                CloseButtonResponsive(
                  label: "إضافة شقة",
                
                  onPressed: () {
                    // فتح صفحة Mm لإضافة شقة جديدة
                    Get.to(() => Mm(isUpdate: false));
                  },
                ),
                const SizedBox(height:16),
                CloseButtonResponsive(
                  label: "شققـي",
                  onPressed: () {
                    // مثال: شقة موجودة للتحديث
                    Flat sampleFlat = Flat(
                      area: 120,
                      rooms: 3,
                      livingRooms: 1,
                      bathrooms: 2,
                      rentalPrice: 1000,
                      governorate: "Cairo",
                      city: "Nasr City",
                      address: "Street 123",
                      status: "Available",
                      averageRate: 4.5,
                      owner: "Owner1",
                      description: "Nice apartment",
                      pictures: [], // يمكن وضع مسارات الصور هنا
                    );
                
                    // فتح صفحة Mm لتحديث الشقة
                    Get.to(() => Mm(isUpdate: true, flat: sampleFlat));
                  },
                ),
                const SizedBox(height:16),
                // الصف الثاني
                CloseButtonResponsive(
                  label: "طلبات الحجز",
                 
                  onPressed: () {
                    // فتح صفحة طلبات الحجز (يمكنك إنشاء صفحة جديدة)
                    Get.snackbar("Info", "سيتم فتح صفحة الطلبات لاحقاً");
                  },
                ),
                const SizedBox(height: 16),
                CloseButtonResponsive(
                  label: "تسجيل خروج",
                
                  onPressed: () {
                  
                  },
                ),
              ],
            ),
          );
      
  }
}

// الزر الخاص بك يبقى كما هو
